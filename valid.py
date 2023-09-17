import os
import time
import torch
import argparse
import scipy.io
import warnings
from torch.autograd import Variable
from torchvision import datasets, transforms
import numpy as np
import matplotlib.pyplot as plt

import json
import dataset
from darknet import Darknet
from utils import *
from MeshPly import MeshPly


def valid(datacfg, modelcfg, weightfile):
    def truths_length(truths, max_num_gt=50):
        for i in range(max_num_gt):
            if truths[i][1] == 0:
                return i

    # Parse configuration files
    data_options = read_data_cfg(datacfg)
    valid_images = data_options['valid']
    meshname = data_options['mesh']
    backupdir = data_options['backup']
    name = data_options['name']
    gpus = data_options['gpus']
    im_width = int(data_options['width'])
    im_height = int(data_options['height'])
    if not os.path.exists(backupdir):
        makedirs(backupdir)

    # Parameters
    seed = int(time.time())
    # os.environ['CUDA_VISIBLE_DEVICES'] = gpus
    torch.cuda.manual_seed(seed)
    save = True
    testtime = True
    num_classes = 1
    testing_samples = 0.0
    edges_corners = [[0, 1], [0, 2], [0, 4], [1, 3], [1, 5], [2, 3], [2, 6], [3, 7], [4, 5], [4, 6], [5, 7], [6, 7]]
    if save:
        makedirs(backupdir + '/test')
        makedirs(backupdir + '/test/gt')
        makedirs(backupdir + '/test/pr')
        makedirs(backupdir + '/test/images')

    # To save
    testing_error_trans = 0.0
    testing_error_angle = 0.0
    testing_error_pixel = 0.0
    iou_acc = []
    errs_2d = []
    errs_3d = []
    errs_trans = []
    errs_angle = []
    errs_corner2D = []
    preds_trans = []
    preds_rot = []
    preds_corners2D = []
    gts_trans = []
    gts_rot = []
    gts_corners2D = []

    # Read object model information, get 3D bounding box corners
    mesh = MeshPly(meshname)
    vertices = np.c_[np.array(mesh.vertices), np.ones((len(mesh.vertices), 1))].transpose()
    corners3D = get_3D_corners(vertices)
    #try:
    #    diam = float(options['diam'])
    #except:
    #    diam = calc_pts_diameter(np.array(mesh.vertices))

    diam = calc_pts_diameter(np.array(mesh.vertices))
    # Get validation file names
    with open(valid_images) as fp:
        tmp_files = fp.readlines()
        valid_files = [item.rstrip() for item in tmp_files]

    # Specicy model, load pretrained weights, pass to GPU and set the module in evaluation mode
    model = Darknet(modelcfg)
    model.print_network()
    model.load_weights(weightfile)
    model.cuda()
    model.eval()
    test_width = model.test_width
    test_height = model.test_height
    num_keypoints = model.num_keypoints
    num_labels = num_keypoints * 2 + 3  # +2 for width, height,  +1 for class label

    # Get the parser for the test dataset
    valid_dataset = dataset.listDataset(valid_images,
                                        shape=(test_width, test_height),
                                        shuffle=False,
                                        transform=transforms.Compose([transforms.ToTensor(), ]))

    # Specify the number of workers for multiple processing, get the dataloader for the test dataset
    kwargs = {'num_workers': 4, 'pin_memory': True}
    test_loader = torch.utils.data.DataLoader(valid_dataset, batch_size=1, shuffle=False, **kwargs)

    logging("   Testing {}...".format(name))
    logging("   Number of test samples: %d" % len(test_loader.dataset))
    # Iterate through test batches (Batch size for test data is 1)
    count = 0

    type = ".Images"
    if "투명" in test_loader.dataset.lines[0]:
        type = ".TR"

    for batch_idx, (data, target) in enumerate(test_loader):
        with open(test_loader.dataset.lines[batch_idx].replace('원천데이터', '라벨링데이터').replace(type, '3D_json').replace('.png', '.json').replace('\n', ''), encoding='UTF-8') as f:
            label_info = json.load(f)
            # Read intrinsic camera parameters
            fx = float(label_info['metaData']['Fx'])
            fy = float(label_info['metaData']['Fy'])
            u0 = float(label_info['metaData']['PPx'])
            v0 = float(label_info['metaData']['PPy'])
            internal_calibration = get_camera_intrinsic(fx, fy, u0, v0)
        # Images
        img = data[0, :, :, :]
        img = img.numpy().squeeze()
        img = np.transpose(img, (1, 2, 0))

        t1 = time.time()
        # Pass data to GPU
        data = data.cuda()
        target = target.cuda()
        # Wrap tensors in Variable class, set volatile=True for inference mode and to use minimal memory during inference
        with torch.no_grad():
            data = data

        t2 = time.time()
        # Forward pass
        output = model(data).data
        t3 = time.time()
        # eliminate low-confidence predictions
        all_boxes = get_region_boxes(output, num_classes, num_keypoints)
        t4 = time.time()
        # Evaluation
        # Iterate through all batch elements
        for box_pr, target in zip([all_boxes], [target[0]]):
            # For each image, get all the targets (for multiple object pose estimation, there might be more than 1 target per image)
            truths = target.view(-1, num_labels)
            # Get how many objects are present in the scene
            num_gts = truths_length(truths)
            # Iterate through each ground-truth object
            for k in range(num_gts):
                box_gt = list()
                for j in range(1, 2 * num_keypoints + 1):
                    box_gt.append(truths[k][j])
                box_gt.extend([1.0, 1.0])
                box_gt.append(truths[k][0])

                # Denormalize the corner predictions
                corners2D_gt = np.array(np.reshape(box_gt[:18], [9, 2]), dtype='float32')
                corners2D_pr = np.array(np.reshape(box_pr[:18], [9, 2]), dtype='float32')
                corners2D_gt[:, 0] = corners2D_gt[:, 0] * im_width
                corners2D_gt[:, 1] = corners2D_gt[:, 1] * im_height
                corners2D_pr[:, 0] = corners2D_pr[:, 0] * im_width
                corners2D_pr[:, 1] = corners2D_pr[:, 1] * im_height
                preds_corners2D.append(corners2D_pr)
                gts_corners2D.append(corners2D_gt)

                # Compute IOU
                iou = compute_convexhull_iou(corners2D_gt, corners2D_pr)
                iou_acc.append(iou)

                # Compute corner prediction error
                corner_norm = np.linalg.norm(corners2D_gt - corners2D_pr, axis=1)
                corner_dist = np.mean(corner_norm)
                errs_corner2D.append(corner_dist)

                # Compute [R|t] by pnp
                R_gt, t_gt = pnp(np.array(np.transpose(np.concatenate((np.zeros((3, 1)), corners3D[:3, :]), axis=1)),
                                          dtype='float32'), corners2D_gt,
                                 np.array(internal_calibration, dtype='float32'))
                R_pr, t_pr = pnp(np.array(np.transpose(np.concatenate((np.zeros((3, 1)), corners3D[:3, :]), axis=1)),
                                          dtype='float32'), corners2D_pr,
                                 np.array(internal_calibration, dtype='float32'))

                # Compute translation error
                trans_dist = np.sqrt(np.sum(np.square(t_gt - t_pr)))
                errs_trans.append(trans_dist)

                # Compute angle error
                angle_dist = calcAngularDistance(R_gt, R_pr)
                errs_angle.append(angle_dist)

                # Compute pixel error
                Rt_gt = np.concatenate((R_gt, t_gt), axis=1)
                Rt_pr = np.concatenate((R_pr, t_pr), axis=1)
                proj_2d_gt = compute_projection(vertices, Rt_gt, internal_calibration)
                proj_2d_pred = compute_projection(vertices, Rt_pr, internal_calibration)
                proj_corners_gt = np.transpose(compute_projection(corners3D, Rt_gt, internal_calibration))
                proj_corners_pr = np.transpose(compute_projection(corners3D, Rt_pr, internal_calibration))

                norm = np.linalg.norm(proj_2d_gt - proj_2d_pred, axis=0)
                pixel_dist = np.mean(norm)
                errs_2d.append(pixel_dist)

                # save prediction image
                if save:
                    # Visualize
                    plt.xlim((0, im_width))
                    plt.ylim((0, im_height))
                    #plt.imshow(scipy.misc.imresize(img, (im_height, im_width)))
                    plt.imshow(cv2.resize(img, (im_width, im_height), interpolation=cv2.INTER_CUBIC))
                    # # Projections
                    for edge in edges_corners:
                        plt.plot(proj_corners_gt[edge, 0], proj_corners_gt[edge, 1], color='g', linewidth=1.0)
                        plt.plot(proj_corners_pr[edge, 0], proj_corners_pr[edge, 1], color='b', linewidth=1.0)
                    plt.gca().invert_yaxis()
                    # plt.show()
                    plt.savefig(backupdir + '/test/images/' + valid_files[count].split('/')[-1])
                    plt.clf()

                # Compute 3D distances
                transform_3d_gt = compute_transformation(vertices, Rt_gt)
                transform_3d_pred = compute_transformation(vertices, Rt_pr)
                norm3d = np.linalg.norm(transform_3d_gt - transform_3d_pred, axis=0)
                vertex_dist = np.mean(norm3d)
                errs_3d.append(vertex_dist)

                # Sum errors
                testing_error_trans += trans_dist
                testing_error_angle += angle_dist
                testing_error_pixel += pixel_dist
                testing_samples += 1

                if save:
                    preds_trans.append(t_pr)
                    gts_trans.append(t_gt)
                    preds_rot.append(R_pr)
                    gts_rot.append(R_gt)

                    np.savetxt(backupdir + '/test/gt/R_' + valid_files[count][-10:-3] + 'txt',
                               np.array(R_gt, dtype='float32'))
                    np.savetxt(backupdir + '/test/gt/t_' + valid_files[count][-10:-3] + 'txt',
                               np.array(t_gt, dtype='float32'))
                    np.savetxt(backupdir + '/test/pr/R_' + valid_files[count][-10:-3] + 'txt',
                               np.array(R_pr, dtype='float32'))
                    np.savetxt(backupdir + '/test/pr/t_' + valid_files[count][-10:-3] + 'txt',
                               np.array(t_pr, dtype='float32'))
                    np.savetxt(backupdir + '/test/gt/corners_' + valid_files[count][-10:-3] + 'txt',
                               np.array(corners2D_gt, dtype='float32'))
                    np.savetxt(backupdir + '/test/pr/corners_' + valid_files[count][-10:-3] + 'txt',
                               np.array(corners2D_pr, dtype='float32'))

                count = count + 1

        t5 = time.time()

    # Compute 2D projection error, 6D pose error, 5cm5degree error
    px_threshold = 5  # 5 pixel threshold for 2D reprojection error is standard in recent sota 6D object pose estimation works
    eps = 1e-5
    total_iou = len(np.where(np.array(iou_acc) >= 0.5)[0]) * 100 / (len(iou_acc) + eps)
    acc = len(np.where(np.array(errs_2d) <= px_threshold)[0]) * 100. / (len(errs_2d) + eps)
    acc5cm5deg = len(np.where((np.array(errs_trans) <= 0.05) & (np.array(errs_angle) <= 5))[0]) * 100. / (
                len(errs_trans) + eps)
    acc3d10 = len(np.where(np.array(errs_3d) <= diam * 0.1)[0]) * 100. / (len(errs_3d) + eps)
    corner_acc = len(np.where(np.array(errs_corner2D) <= px_threshold)[0]) * 100. / (len(errs_corner2D) + eps)
    mean_err_2d = np.mean(errs_2d)
    mean_corner_err_2d = np.mean(errs_corner2D)
    nts = float(testing_samples)

    if testtime:
        print('-----------------------------------')
        print('  tensor to cuda : %f' % (t2 - t1))
        print('    forward pass : %f' % (t3 - t2))
        print('get_region_boxes : %f' % (t4 - t3))
        print(' prediction time : %f' % (t4 - t1))
        print('            eval : %f' % (t5 - t4))
        print('-----------------------------------')

    # Print test statistics
    logging('Results of {}'.format(name))
    logging('   Acc using {} px 2D Projection = {:.2f}%'.format(px_threshold, acc))
    logging('   Acc using 10% threshold - {} vx 3D Transformation = {:.2f}%'.format(diam * 0.1, acc3d10))
    logging('   Acc using 5 cm 5 degree metric = {:.2f}%'.format(acc5cm5deg))
    logging("   Mean 2D pixel error is %f, Mean vertex error is %f, mean corner error is %f" % (
    mean_err_2d, np.mean(errs_3d), mean_corner_err_2d))
    logging('   Translation error: %f m, angle error: %f degree, pixel error: % f pix' % (
    testing_error_trans / nts, testing_error_angle / nts, testing_error_pixel / nts))
    logging('   Intersection Of Union = {:.2f}%'.format(total_iou))


if __name__ == '__main__':

    # Parse configuration files
    parser = argparse.ArgumentParser(description='SingleShotPose')
    parser.add_argument('--datacfg', type=str, default='data/measuring_cup3/measuring_cup3.data') # data config
    parser.add_argument('--modelcfg', type=str, default='cfg/yolov8n.pt') # network config
    parser.add_argument('--weightfile', type=str, default='data/glass_bottle1/models/model.weights') # imagenet initialized weights
    args       = parser.parse_args()
    datacfg    = args.datacfg
    modelcfg   = args.modelcfg
    weightfile = args.weightfile
    valid(datacfg, modelcfg, weightfile)
