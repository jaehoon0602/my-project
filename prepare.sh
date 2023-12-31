#!/bin/bash

DATA=test_datasets
TESTCASE=("010101" "010102" "010103" "010104" "010105" "010201" "010202" "010203" "010204" "010205" "030101" "030102" "030103" "030105" "030106" "030107" "030201" "030203" "030204" "030205" "030206" "030209" "030301" "030302" "030303" "030304" "030305" "030306" "030307" "030308" "030309" "040301" "040302" "040303" "040304" "040305" "040306" "040307" "040308" "040309" "040310" "040311" "040402" "040403" "040404" "040407" "040408" "040409" "050101" "050102" "050103" "050104" "050105" "050106" "050107" "050108" "050109" "050110" "050111" "050112" "050201" "050202" "050203" "050204" "050205" "050206" "050207" "050208" "050209" "050210" "050211" "050212" "050301" "050302" "050303" "050304" "050305" "050306" "050307" "050308" "050309" "050310" "050311" "050312" "060102" "060103" "060104" "060105" "060106" "060107" "060108" "060109" "060110" "060111" "060112" "060201" "060203" "060204" "060205" "060206" "060207" "060208" "060209" "060210" "060211" "060212" "060301" "060302" "060303" "060304" "060305" "060306" "060307" "060308" "060309" "070101" "070102" "070103" "070105" "070106" "070107" "070108" "070109" "070110" "070111" "070112" "070113" "070201" "070202" "070203" "070204" "070205" "070206" "070207" "070208" "070209" "070210" "070212" "070213" "070302" "070303" "070304" "070305" "070306" "070307" "070308" "070309" "070312" "070313" "070401" "070402" "070403" "070404" "070405" "070406" "070407" "070408" "070409" "070410" "070411" "070413" "070414" "070415" "070416" "070501" "070502" "070503" "070504" "070506" "070507" "070508" "070509" "070510" "070511" "070512" "070601" "070602" "070603" "070604" "070605" "070606" "070607" "070608" "070609" "070610" "070611" "070612" "070613" "070701" "070702" "070703" "070704" "070705" "070706" "070707" "070708" "070709" "070710" "070711" "070712" "070801" "070802" "070803" "070804" "070805" "070806" "070807" "070808" "070809" "070810" "070901" "070902" "070903" "070904" "070906" "070907" "070909" "070910" "070911" "070912" "070913" "071001" "071002" "071003" "071004" "071005" "071006" "071008" "071009" "071010" "080101" "080102" "080103" "080104" "080105" "080106" "080107" "080108" "080109" "090103" "090104" "090105" "090107" "090109" "090110" "090113" "090201" "090202" "090203" "090204" "090205" "090206" "090207" "090209" "090210" "090211" "090211" "090301" "090302" "090303" "090304" "090305" "090306" "090307" "090308" "090309" "090310" "090404" "090405" "090406" "090407" "090408" "090409" "090410" "090502" "090504" "090505" "090506" "090507" "090509" "090510" "100101" "100103" "100105" "100107" "100108" "100109" "100201" "100203" "100204" "100205" "100206" "100207" "100208" "100210" "100211" "100212" "110101" "110102" "110103" "110104" "110105" "110106" "110107" "110108" "110109" "110110" "110111" "110112" "110113")

ZIP_010101=https://www.dropbox.com/s/9snrohm0hni10ew/010101.zip?dl=0
ZIP_010102=https://www.dropbox.com/s/jgvzk3uvcluwih7/010102.zip?dl=0
ZIP_010103=https://www.dropbox.com/s/d3s0sifm4dyvic4/010103.zip?dl=0
ZIP_010104=https://www.dropbox.com/s/lws3n0vqwd3t8aq/010104.zip?dl=0
ZIP_010105=https://www.dropbox.com/s/60v2wzxktc29v4i/010105.zip?dl=0
ZIP_010201=https://www.dropbox.com/s/iu7y8fc2fcm48j8/010201.zip?dl=0
ZIP_010202=https://www.dropbox.com/s/3cppj7wbyseayd2/010202.zip?dl=0
ZIP_010203=https://www.dropbox.com/s/c4nfl8lxmtmy2q6/010203.zip?dl=0
ZIP_010204=https://www.dropbox.com/s/jxmz9v989vmtbac/010204.zip?dl=0
ZIP_010205=https://www.dropbox.com/s/d0ufbk9fvwy66lj/010205.zip?dl=0
ZIP_030101=https://www.dropbox.com/s/s8bjpvt4bl65mqk/030101.zip?dl=0
ZIP_030102=https://www.dropbox.com/s/ydtnhwvysg2fvvo/030102.zip?dl=0
ZIP_030103=https://www.dropbox.com/s/fawm17mrc8o2num/030103.zip?dl=0
ZIP_030105=https://www.dropbox.com/s/wpfcpmvkon0cmii/030105.zip?dl=0
ZIP_030106=https://www.dropbox.com/s/49amt8qmdwkk4fs/030106.zip?dl=0
ZIP_030107=https://www.dropbox.com/s/0j8jdbs1on8wam4/030107.zip?dl=0
ZIP_030201=https://www.dropbox.com/s/jjzhgz6z2uv196m/030201.zip?dl=0
ZIP_030203=https://www.dropbox.com/s/bxlhcvp52ztbgnu/030203.zip?dl=0
ZIP_030204=https://www.dropbox.com/s/687fv3oe83rjpzz/030204.zip?dl=0
ZIP_030205=https://www.dropbox.com/s/ftnwz3nmvr9br7y/030205.zip?dl=0
ZIP_030206=https://www.dropbox.com/s/1722yali8kik21e/030206.zip?dl=0
ZIP_030209=https://www.dropbox.com/s/7b7h2qox0o98xxg/030209.zip?dl=0
ZIP_030301=https://www.dropbox.com/s/97u3dy2q1esxa47/030301.zip?dl=0
ZIP_030302=https://www.dropbox.com/s/l3qr9m2tl4vvt0u/030302.zip?dl=0
ZIP_030303=https://www.dropbox.com/s/3dp3un5euwsxch5/030303.zip?dl=0
ZIP_030304=https://www.dropbox.com/s/hzhqe2droklik0f/030304.zip?dl=0
ZIP_030305=https://www.dropbox.com/s/c935yjhcg1xtt06/030305.zip?dl=0
ZIP_030306=https://www.dropbox.com/s/un4j0sznr6bsr8f/030306.zip?dl=0
ZIP_030307=https://www.dropbox.com/s/orme4jzfr41a40b/030307.zip?dl=0
ZIP_030308=https://www.dropbox.com/s/odvq5tyngao32hl/030308.zip?dl=0
ZIP_030309=https://www.dropbox.com/s/fyq1ubmowrrs71a/030309.zip?dl=0
ZIP_040301=https://www.dropbox.com/s/fggmp32rkn6pbn5/040301.zip?dl=0
ZIP_040302=https://www.dropbox.com/s/f6lbv1x2echyjjt/040302.zip?dl=0
ZIP_040303=https://www.dropbox.com/s/ck184u5h6ccgn2e/040303.zip?dl=0
ZIP_040304=https://www.dropbox.com/s/eaidbmu38gbavgz/040304.zip?dl=0
ZIP_040305=https://www.dropbox.com/s/pt6elynbuknoqf0/040305.zip?dl=0
ZIP_040306=https://www.dropbox.com/s/bwpfp5ga0r4jr08/040306.zip?dl=0
ZIP_040307=https://www.dropbox.com/s/u2xki85v6czzdrx/040307.zip?dl=0
ZIP_040308=https://www.dropbox.com/s/2fsllo2td93vsbp/040308.zip?dl=0
ZIP_040309=https://www.dropbox.com/s/2937sgpmzvw9ceo/040309.zip?dl=0
ZIP_040310=https://www.dropbox.com/s/ml3cme6ulmn3fkm/040310.zip?dl=0
ZIP_040311=https://www.dropbox.com/s/kasdustroncu9ic/040311.zip?dl=0
ZIP_040402=https://www.dropbox.com/s/ltpgmseovziysv2/040402.zip?dl=0
ZIP_040403=https://www.dropbox.com/s/pavssok5yfhik0c/040403.zip?dl=0
ZIP_040404=https://www.dropbox.com/s/mqhc0qngjwpgyom/040404.zip?dl=0
ZIP_040407=https://www.dropbox.com/s/w5mew9t3fqrfiq7/040407.zip?dl=0
ZIP_040408=https://www.dropbox.com/s/tfr1pnxwjwbga6b/040408.zip?dl=0
ZIP_040409=https://www.dropbox.com/s/y42zs7ytz5fti69/040409.zip?dl=0
ZIP_050101=https://www.dropbox.com/s/thnil0vtgvmssk2/050101.zip?dl=0
ZIP_050102=https://www.dropbox.com/s/aij7lmjupg0eu05/050102.zip?dl=0
ZIP_050103=https://www.dropbox.com/s/j3tfpz22ssz75s5/050103.zip?dl=0
ZIP_050104=https://www.dropbox.com/s/6qatmt5wdsgh950/050104.zip?dl=0
ZIP_050105=https://www.dropbox.com/s/5ha1repmljnp8o9/050105.zip?dl=0
ZIP_050106=https://www.dropbox.com/s/qex9odrz87feqaj/050106.zip?dl=0
ZIP_050107=https://www.dropbox.com/s/qv875ik0lan77go/050107.zip?dl=0
ZIP_050108=https://www.dropbox.com/s/532j3qen21rw7sm/050108.zip?dl=0
ZIP_050109=https://www.dropbox.com/s/22edmwpuryu106x/050109.zip?dl=0
ZIP_050110=https://www.dropbox.com/s/ld7zfoe9pr86qu2/050110.zip?dl=0
ZIP_050111=https://www.dropbox.com/s/o52fkzpzl1crox1/050111.zip?dl=0
ZIP_050112=https://www.dropbox.com/s/c5l5j7t3cuz2rwj/050112.zip?dl=0
ZIP_050201=https://www.dropbox.com/s/9fb3hnd40rhz68d/050201.zip?dl=0
ZIP_050202=https://www.dropbox.com/s/k6lsp2rlmbedsyl/050202.zip?dl=0
ZIP_050203=https://www.dropbox.com/s/1e4j61awfl1p3cu/050203.zip?dl=0
ZIP_050204=https://www.dropbox.com/s/l3rw3u37mt4cgct/050204.zip?dl=0
ZIP_050205=https://www.dropbox.com/s/x3gz3ikcvrccj9z/050205.zip?dl=0
ZIP_050206=https://www.dropbox.com/s/nxot5kvix3hlpb2/050206.zip?dl=0
ZIP_050207=https://www.dropbox.com/s/o387khtaon6stpr/050207.zip?dl=0
ZIP_050208=https://www.dropbox.com/s/pzvz9jjevbepue9/050208.zip?dl=0
ZIP_050209=https://www.dropbox.com/s/bd3hkcretcb3946/050209.zip?dl=0
ZIP_050210=https://www.dropbox.com/s/gk1b1bg4e931dsh/050210.zip?dl=0
ZIP_050211=https://www.dropbox.com/s/5uoy51ytgx386lv/050211.zip?dl=0
ZIP_050212=https://www.dropbox.com/s/zxflz957arpxyw9/050212.zip?dl=0
ZIP_050301=https://www.dropbox.com/s/961rf2b9uevbhry/050301.zip?dl=0
ZIP_050302=https://www.dropbox.com/s/kyy2fjzzag7lq78/050302.zip?dl=0
ZIP_050303=https://www.dropbox.com/s/jywzkukwvkh94jv/050303.zip?dl=0
ZIP_050304=https://www.dropbox.com/s/vykfi90tjsux3i0/050304.zip?dl=0
ZIP_050305=https://www.dropbox.com/s/pcb1vwizq1uaxjz/050305.zip?dl=0
ZIP_050306=https://www.dropbox.com/s/77ivla2fgc2yra1/050306.zip?dl=0
ZIP_050307=https://www.dropbox.com/s/otm0j93dwgvaj89/050307.zip?dl=0
ZIP_050308=https://www.dropbox.com/s/ame421lsprxgq0k/050308.zip?dl=0
ZIP_050309=https://www.dropbox.com/s/bsfmfwg57d1o0aw/050309.zip?dl=0
ZIP_050310=https://www.dropbox.com/s/vg0k319ilchohhg/050310.zip?dl=0
ZIP_050311=https://www.dropbox.com/s/utwec26vvjnmie5/050311.zip?dl=0
ZIP_050312=https://www.dropbox.com/s/si1c526uq7mg06j/050312.zip?dl=0
ZIP_060102=https://www.dropbox.com/s/q5nann3qvjw0hac/060102.zip?dl=0
ZIP_060103=https://www.dropbox.com/s/sp9gy82mx2t0337/060103.zip?dl=0
ZIP_060104=https://www.dropbox.com/s/3z5q22dzx9c487h/060104.zip?dl=0
ZIP_060105=https://www.dropbox.com/s/mn6otpcnsfmg5av/060105.zip?dl=0
ZIP_060106=https://www.dropbox.com/s/0cw8zt71f8u4hy1/060106.zip?dl=0
ZIP_060107=https://www.dropbox.com/s/nmxf2nxljjxujj6/060107.zip?dl=0
ZIP_060108=https://www.dropbox.com/s/r84wv871l88zwj7/060108.zip?dl=0
ZIP_060109=https://www.dropbox.com/s/fa9wi8s2qmcr97d/060109.zip?dl=0
ZIP_060110=https://www.dropbox.com/s/lsdbpdo6c6628qh/060110.zip?dl=0
ZIP_060111=https://www.dropbox.com/s/8v11s6touwzudi7/060111.zip?dl=0
ZIP_060112=https://www.dropbox.com/s/ew81q03x0eqt4vl/060112.zip?dl=0
ZIP_060201=https://www.dropbox.com/s/4cj57g1tm18mnr3/060201.zip?dl=0
ZIP_060203=https://www.dropbox.com/s/lrxlc2k9mgt60a3/060203.zip?dl=0
ZIP_060204=https://www.dropbox.com/s/e5cr5xnbhtw4ogl/060204.zip?dl=0
ZIP_060205=https://www.dropbox.com/s/9w02qnuqus0xqm0/060205.zip?dl=0
ZIP_060206=https://www.dropbox.com/s/7m1sruu8wxdg8nf/060206.zip?dl=0
ZIP_060207=https://www.dropbox.com/s/dxwt1ast6b3cetb/060207.zip?dl=0
ZIP_060208=https://www.dropbox.com/s/a6gin6pi402arwm/060208.zip?dl=0
ZIP_060209=https://www.dropbox.com/s/6ddbfjcudiy7er9/060209.zip?dl=0
ZIP_060210=https://www.dropbox.com/s/r1v6wdfy8p1egzd/060210.zip?dl=0
ZIP_060211=https://www.dropbox.com/s/vwnucm61dlntp2b/060211.zip?dl=0
ZIP_060212=https://www.dropbox.com/s/zsdrngtss9fiqss/060212.zip?dl=0
ZIP_060301=https://www.dropbox.com/s/u6t41qpqtx64ff3/060301.zip?dl=0
ZIP_060302=https://www.dropbox.com/s/nk32bsbfgycpp78/060302.zip?dl=0
ZIP_060303=https://www.dropbox.com/s/fuvhfgt9v8uev5v/060303.zip?dl=0
ZIP_060304=https://www.dropbox.com/s/r9yaceqbp5r6je1/060304.zip?dl=0
ZIP_060305=https://www.dropbox.com/s/jzsz6kbvhwyv65d/060305.zip?dl=0
ZIP_060306=https://www.dropbox.com/s/2sq9n1xeae5ivwj/060306.zip?dl=0
ZIP_060307=https://www.dropbox.com/s/ch3mkwg7pa93ed0/060307.zip?dl=0
ZIP_060308=https://www.dropbox.com/s/7u3ouqyaueouotv/060308.zip?dl=0
ZIP_060309=https://www.dropbox.com/s/n3umsxmoy5tair4/060309.zip?dl=0
ZIP_070101=https://www.dropbox.com/s/qrva40hyfklhxf4/070101.zip?dl=0
ZIP_070102=https://www.dropbox.com/s/kb0qd0sg0o9mt0y/070102.zip?dl=0
ZIP_070103=https://www.dropbox.com/s/l89jprce0ah5vz5/070103.zip?dl=0
ZIP_070105=https://www.dropbox.com/s/lixxl837xk1bfmw/070105.zip?dl=0
ZIP_070106=https://www.dropbox.com/s/knsk2vqt63nukom/070106.zip?dl=0
ZIP_070107=https://www.dropbox.com/s/dlcpm1kn5e5z5xj/070107.zip?dl=0
ZIP_070108=https://www.dropbox.com/s/vv6iw8otujdr4cc/070108.zip?dl=0
ZIP_070109=https://www.dropbox.com/s/0s54ogt6v2ptr4a/070109.zip?dl=0
ZIP_070110=https://www.dropbox.com/s/1epbes40n2l9ckx/070110.zip?dl=0
ZIP_070111=https://www.dropbox.com/s/4n7wwl3a9oj6ngu/070111.zip?dl=0
ZIP_070112=https://www.dropbox.com/s/jvuyapt4agwkha0/070112.zip?dl=0
ZIP_070113=https://www.dropbox.com/s/skwu2msbvs8dyhm/070113.zip?dl=0
ZIP_070201=https://www.dropbox.com/s/q4d2vo19onvldgu/070201.zip?dl=0
ZIP_070202=https://www.dropbox.com/s/ht5oel9q7jjbtu3/070202.zip?dl=0
ZIP_070203=https://www.dropbox.com/s/v6bchwrb6bj8ar1/070203.zip?dl=0
ZIP_070204=https://www.dropbox.com/s/b818ij7sw09dbup/070204.zip?dl=0
ZIP_070205=https://www.dropbox.com/s/ificlxyaol943tv/070205.zip?dl=0
ZIP_070206=https://www.dropbox.com/s/jsmqbngeuydq0dj/070206.zip?dl=0
ZIP_070207=https://www.dropbox.com/s/8ruvb7177wl1u1i/070207.zip?dl=0
ZIP_070208=https://www.dropbox.com/s/aomc21nxwtf3eo0/070208.zip?dl=0
ZIP_070209=https://www.dropbox.com/s/kt9c5a139cnltrh/070209.zip?dl=0
ZIP_070210=https://www.dropbox.com/s/2js76qt6vzxgj7z/070210.zip?dl=0
ZIP_070212=https://www.dropbox.com/s/sjojd1572xgvglj/070212.zip?dl=0
ZIP_070213=https://www.dropbox.com/s/auri3llydp9hea9/070213.zip?dl=0
ZIP_070302=https://www.dropbox.com/s/nlhpadd28skav5s/070302.zip?dl=0
ZIP_070303=https://www.dropbox.com/s/u7e9px1ynu284y4/070303.zip?dl=0
ZIP_070304=https://www.dropbox.com/s/l32qpb67gcmsgv3/070304.zip?dl=0
ZIP_070305=https://www.dropbox.com/s/rcm9m5ryghe4lgw/070305.zip?dl=0
ZIP_070306=https://www.dropbox.com/s/3314gaz0blzp0f7/070306.zip?dl=0
ZIP_070307=https://www.dropbox.com/s/2yphcq12odc8k3i/070307.zip?dl=0
ZIP_070308=https://www.dropbox.com/s/x278nx4yxc01c9r/070308.zip?dl=0
ZIP_070309=https://www.dropbox.com/s/7n2teoa83y4yv3x/070309.zip?dl=0
ZIP_070312=https://www.dropbox.com/s/fzmx5rznalli3n0/070312.zip?dl=0
ZIP_070313=https://www.dropbox.com/s/0k9j9lem0xlsthm/070313.zip?dl=0
ZIP_070401=https://www.dropbox.com/s/1bmz4k5vhcgdegu/070401.zip?dl=0
ZIP_070402=https://www.dropbox.com/s/qeqob3rpnqev3er/070402.zip?dl=0
ZIP_070403=https://www.dropbox.com/s/6ay4d8j56p3ugps/070403.zip?dl=0
ZIP_070404=https://www.dropbox.com/s/gppzsflpzvmjxkg/070404.zip?dl=0
ZIP_070405=https://www.dropbox.com/s/y582fmpvqnyagaa/070405.zip?dl=0
ZIP_070406=https://www.dropbox.com/s/f2q44ci3t0zvx28/070406.zip?dl=0
ZIP_070407=https://www.dropbox.com/s/1voy77z9fh3q12o/070407.zip?dl=0
ZIP_070408=https://www.dropbox.com/s/5x1s86crqvjehgt/070408.zip?dl=0
ZIP_070409=https://www.dropbox.com/s/031mq094h37upot/070409.zip?dl=0
ZIP_070410=https://www.dropbox.com/s/cxv86vbvtx4i3p3/070410.zip?dl=0
ZIP_070411=https://www.dropbox.com/s/04a3gjfdlqqot0f/070411.zip?dl=0
ZIP_070413=https://www.dropbox.com/s/r9o9y7ibn3glel8/070413.zip?dl=0
ZIP_070414=https://www.dropbox.com/s/27shcuxwb1107ro/070414.zip?dl=0
ZIP_070415=https://www.dropbox.com/s/slccp1rb59bee85/070415.zip?dl=0
ZIP_070416=https://www.dropbox.com/s/5xt56lx3no0yewg/070416.zip?dl=0
ZIP_070501=https://www.dropbox.com/s/0bdy9iz8q75c30g/070501.zip?dl=0
ZIP_070502=https://www.dropbox.com/s/2joqo1tamqxt6fh/070502.zip?dl=0
ZIP_070503=https://www.dropbox.com/s/1ddv1l9vkynciic/070503.zip?dl=0
ZIP_070504=https://www.dropbox.com/s/rx54t68v7nitjhm/070504.zip?dl=0
ZIP_070506=https://www.dropbox.com/s/tb0uf3iyzjc0xao/070506.zip?dl=0
ZIP_070507=https://www.dropbox.com/s/sc6g9s2xpjdiuld/070507.zip?dl=0
ZIP_070508=https://www.dropbox.com/s/1hp8bknzi1ymay3/070508.zip?dl=0
ZIP_070509=https://www.dropbox.com/s/8uy0qul0kdfkyk1/070509.zip?dl=0
ZIP_070510=https://www.dropbox.com/s/hq9htivk5ksv6iv/070510.zip?dl=0
ZIP_070511=https://www.dropbox.com/s/dityuontk15x07n/070511.zip?dl=0
ZIP_070512=https://www.dropbox.com/s/270y5szx9q6cw5g/070512.zip?dl=0
ZIP_070601=https://www.dropbox.com/s/0t6d08ydyiyplle/070601.zip?dl=0
ZIP_070602=https://www.dropbox.com/s/r6prswt4kdj4bma/070602.zip?dl=0
ZIP_070603=https://www.dropbox.com/s/1m196kif3shloal/070603.zip?dl=0
ZIP_070604=https://www.dropbox.com/s/z4we38zsy3f1mhc/070604.zip?dl=0
ZIP_070605=https://www.dropbox.com/s/wzhz2eubjcfnp8v/070605.zip?dl=0
ZIP_070606=https://www.dropbox.com/s/asuyvgdre3fazwf/070606.zip?dl=0
ZIP_070607=https://www.dropbox.com/s/on6zm0kmda4sl3o/070607.zip?dl=0
ZIP_070608=https://www.dropbox.com/s/jte74l0eq1byazq/070608.zip?dl=0
ZIP_070609=https://www.dropbox.com/s/b73u4rucapr48mi/070609.zip?dl=0
ZIP_070610=https://www.dropbox.com/s/cva2x3tw9h3p7nh/070610.zip?dl=0
ZIP_070611=https://www.dropbox.com/s/b0vgj2yfgcfbgg1/070611.zip?dl=0
ZIP_070612=https://www.dropbox.com/s/i609ofgoudkg56k/070612.zip?dl=0
ZIP_070613=https://www.dropbox.com/s/n85i10pcg5pi068/070613.zip?dl=0
ZIP_070701=https://www.dropbox.com/s/70g4wdtez98xj6k/070701.zip?dl=0
ZIP_070702=https://www.dropbox.com/s/7zof15nzxr1a7cq/070702.zip?dl=0
ZIP_070703=https://www.dropbox.com/s/mqfw732u4imyhyb/070703.zip?dl=0
ZIP_070704=https://www.dropbox.com/s/nfahelwydczjfbe/070704.zip?dl=0
ZIP_070705=https://www.dropbox.com/s/rtsunva1yyjmata/070705.zip?dl=0
ZIP_070706=https://www.dropbox.com/s/6h2kwu0y4c0wepd/070706.zip?dl=0
ZIP_070707=https://www.dropbox.com/s/484kyjvvuh8qvdc/070707.zip?dl=0
ZIP_070708=https://www.dropbox.com/s/2fctsxq21oidcd4/070708.zip?dl=0
ZIP_070709=https://www.dropbox.com/s/vndb1s602bgt7ix/070709.zip?dl=0
ZIP_070710=https://www.dropbox.com/s/b6wixfagu0s1uq0/070710.zip?dl=0
ZIP_070711=https://www.dropbox.com/s/8t3vm9t74v43ydi/070711.zip?dl=0
ZIP_070712=https://www.dropbox.com/s/l5o8tlcs4rcu39k/070712.zip?dl=0
ZIP_070801=https://www.dropbox.com/s/n7qschebrdeif1k/070801.zip?dl=0
ZIP_070802=https://www.dropbox.com/s/gihvr9sffzg5dbu/070802.zip?dl=0
ZIP_070803=https://www.dropbox.com/s/65g32a9zeauf4kk/070803.zip?dl=0
ZIP_070804=https://www.dropbox.com/s/cyzjp4pus2qqs93/070804.zip?dl=0
ZIP_070805=https://www.dropbox.com/s/7gt2enbf85y1qrw/070805.zip?dl=0
ZIP_070806=https://www.dropbox.com/s/1ckq5h3syij257c/070806.zip?dl=0
ZIP_070807=https://www.dropbox.com/s/3r6kpz8t86zh1sj/070807.zip?dl=0
ZIP_070808=https://www.dropbox.com/s/y4gd1puspiurjqx/070808.zip?dl=0
ZIP_070809=https://www.dropbox.com/s/c5802b54fpno09e/070809.zip?dl=0
ZIP_070810=https://www.dropbox.com/s/8ndn900azeaq57j/070810.zip?dl=0
ZIP_070901=https://www.dropbox.com/s/tlk0b6lbhet4ip3/070901.zip?dl=0
ZIP_070902=https://www.dropbox.com/s/6va40eyyhog7l7t/070902.zip?dl=0
ZIP_070903=https://www.dropbox.com/s/1xo9viu4wmgtit7/070903.zip?dl=0
ZIP_070904=https://www.dropbox.com/s/7bo79700et92nxg/070904.zip?dl=0
ZIP_070906=https://www.dropbox.com/s/ee1dy2krxkqs59i/070906.zip?dl=0
ZIP_070907=https://www.dropbox.com/s/w29qtwyh6urspc3/070907.zip?dl=0
ZIP_070909=https://www.dropbox.com/s/ydbuupz4payvh76/070909.zip?dl=0
ZIP_070910=https://www.dropbox.com/s/4f7szl0575kbd0a/070910.zip?dl=0
ZIP_070911=https://www.dropbox.com/s/7ymvccb7iurwvhf/070911.zip?dl=0
ZIP_070912=https://www.dropbox.com/s/am6qzdc5prk2mnl/070912.zip?dl=0
ZIP_070913=https://www.dropbox.com/s/cb400auhsxx70pl/070913.zip?dl=0
ZIP_071001=https://www.dropbox.com/s/59bb314umbtx1hn/071001.zip?dl=0
ZIP_071002=https://www.dropbox.com/s/bapda881c3xrp5m/071002.zip?dl=0
ZIP_071003=https://www.dropbox.com/s/1ym8kfv5cgy8j42/071003.zip?dl=0
ZIP_071004=https://www.dropbox.com/s/gwohpgvpfzv3cj5/071004.zip?dl=0
ZIP_071005=https://www.dropbox.com/s/6y6v8tc7dx7ig0v/071005.zip?dl=0
ZIP_071006=https://www.dropbox.com/s/vc8itspk2t8r3ez/071006.zip?dl=0
ZIP_071008=https://www.dropbox.com/s/7vc7dcdk2kq8p2g/071008.zip?dl=0
ZIP_071009=https://www.dropbox.com/s/6yfvvsp72uekfs6/071009.zip?dl=0
ZIP_071010=https://www.dropbox.com/s/7tqel8wpuyae3km/071010.zip?dl=0
ZIP_080101=https://www.dropbox.com/s/l45m9t6fehz3yzg/080101.zip?dl=0
ZIP_080102=https://www.dropbox.com/s/i6emjqi8eqg3r1r/080102.zip?dl=0
ZIP_080103=https://www.dropbox.com/s/7lvazhg419k2ihv/080103.zip?dl=0
ZIP_080104=https://www.dropbox.com/s/qolha6ej23zhr68/080104.zip?dl=0
ZIP_080105=https://www.dropbox.com/s/qmmecn2beskdkl4/080105.zip?dl=0
ZIP_080106=https://www.dropbox.com/s/au5ny0uez6a3tlx/080106.zip?dl=0
ZIP_080107=https://www.dropbox.com/s/9a1wxjbwvqdtp6g/080107.zip?dl=0
ZIP_080108=https://www.dropbox.com/s/eypja3ekdr7pw2p/080108.zip?dl=0
ZIP_080109=https://www.dropbox.com/s/jvhl8xy0chw8nhz/080109.zip?dl=0
ZIP_090103=https://www.dropbox.com/s/6skbcyfoux8xlto/090103.zip?dl=0
ZIP_090104=https://www.dropbox.com/s/3lirqpkfp42ezl8/090104.zip?dl=0
ZIP_090105=https://www.dropbox.com/s/maav9grhxukapkb/090105.zip?dl=0
ZIP_090107=https://www.dropbox.com/s/vkudwt0vbephwmv/090107.zip?dl=0
ZIP_090109=https://www.dropbox.com/s/xxakeyh3h22116f/090109.zip?dl=0
ZIP_090110=https://www.dropbox.com/s/9d2ogyxf75h4uz0/090110.zip?dl=0
ZIP_090113=https://www.dropbox.com/s/cgo0s4uyrq1tosq/090113.zip?dl=0
ZIP_090201=https://www.dropbox.com/s/uhws18sdm4japty/090201.zip?dl=0
ZIP_090202=https://www.dropbox.com/s/o47cbma6vppjp4p/090202.zip?dl=0
ZIP_090203=https://www.dropbox.com/s/wrxgos251lhc5f2/090203.zip?dl=0
ZIP_090204=https://www.dropbox.com/s/vkt1mp9x3mwx4c3/090204.zip?dl=0
ZIP_090205=https://www.dropbox.com/s/d986n8czfobqsb8/090205.zip?dl=0
ZIP_090206=https://www.dropbox.com/s/3bovmeiyka7yef5/090206.zip?dl=0
ZIP_090207=https://www.dropbox.com/s/10dxkq74eeizzg3/090207.zip?dl=0
ZIP_090209=https://www.dropbox.com/s/vioatoa6ps1ac59/090209.zip?dl=0
ZIP_090210=https://www.dropbox.com/s/onjkiwtxcxnhycx/090210.zip?dl=0
ZIP_090211=https://www.dropbox.com/s/qzzfiava273q8o3/090211.zip?dl=0
ZIP_090211=https://www.dropbox.com/s/qzzfiava273q8o3/090211.zip?dl=0
ZIP_090301=https://www.dropbox.com/s/trjjvjzm6x4ab9u/090301.zip?dl=0
ZIP_090302=https://www.dropbox.com/s/qv6k0c36at6nn61/090302.zip?dl=0
ZIP_090303=https://www.dropbox.com/s/hww64vqo90854f1/090303.zip?dl=0
ZIP_090304=https://www.dropbox.com/s/refvqfqdmcdq4cx/090304.zip?dl=0
ZIP_090305=https://www.dropbox.com/s/89l309ar3wgjrwo/090305.zip?dl=0
ZIP_090306=https://www.dropbox.com/s/7z6cpqdoc4nd35x/090306.zip?dl=0
ZIP_090307=https://www.dropbox.com/s/9t94dlqq3i74ktl/090307.zip?dl=0
ZIP_090308=https://www.dropbox.com/s/zpfyyj4stk6cezp/090308.zip?dl=0
ZIP_090309=https://www.dropbox.com/s/w29z6ng1ul9xhad/090309.zip?dl=0
ZIP_090310=https://www.dropbox.com/s/r4i8pr1hymkbyas/090310.zip?dl=0
ZIP_090404=https://www.dropbox.com/s/yw0f3mn5mbwdrub/090404.zip?dl=0
ZIP_090405=https://www.dropbox.com/s/h9j7e751uk6se0c/090405.zip?dl=0
ZIP_090406=https://www.dropbox.com/s/ntdtvjko4m94hyz/090406.zip?dl=0
ZIP_090407=https://www.dropbox.com/s/r9p1plhvrzpuep7/090407.zip?dl=0
ZIP_090408=https://www.dropbox.com/s/p31s48d5f9tn2gn/090408.zip?dl=0
ZIP_090409=https://www.dropbox.com/s/92zppd7h35g3m5w/090409.zip?dl=0
ZIP_090410=https://www.dropbox.com/s/iupp1ty7ipk9z59/090410.zip?dl=0
ZIP_090502=https://www.dropbox.com/s/kaa6ycgkv1lcdyp/090502.zip?dl=0
ZIP_090504=https://www.dropbox.com/s/q3lavbzletbz54g/090504.zip?dl=0
ZIP_090505=https://www.dropbox.com/s/1o117dgml8m58uy/090505.zip?dl=0
ZIP_090506=https://www.dropbox.com/s/zj3m223og8ugalm/090506.zip?dl=0
ZIP_090507=https://www.dropbox.com/s/cgxts1y5ov60p3l/090507.zip?dl=0
ZIP_090509=https://www.dropbox.com/s/5uzewl9chqtekb7/090509.zip?dl=0
ZIP_090510=https://www.dropbox.com/s/9sj37idrhp4p756/090510.zip?dl=0
ZIP_100101=https://www.dropbox.com/s/3j4kaohxv9yifio/100101.zip?dl=0
ZIP_100103=https://www.dropbox.com/s/c8yd6ezyglqxk5h/100103.zip?dl=0
ZIP_100105=https://www.dropbox.com/s/9318lrckov0wvxv/100105.zip?dl=0
ZIP_100107=https://www.dropbox.com/s/qim0qbynbifz5b7/100107.zip?dl=0
ZIP_100108=https://www.dropbox.com/s/ol8h79bvdsttup1/100108.zip?dl=0
ZIP_100109=https://www.dropbox.com/s/l7wafszxv7h9w37/100109.zip?dl=0
ZIP_100201=https://www.dropbox.com/s/fftu0uo61d6eynj/100201.zip?dl=0
ZIP_100203=https://www.dropbox.com/s/zjpbrx4c8y94kgd/100203.zip?dl=0
ZIP_100204=https://www.dropbox.com/s/dh3xeyovrj7jpkx/100204.zip?dl=0
ZIP_100205=https://www.dropbox.com/s/lt1vd49tvqeom11/100205.zip?dl=0
ZIP_100206=https://www.dropbox.com/s/cqms7zuf5lsu6ui/100206.zip?dl=0
ZIP_100207=https://www.dropbox.com/s/wrtqujspjpyr5xt/100207.zip?dl=0
ZIP_100208=https://www.dropbox.com/s/i8h4fma3mdp57aw/100208.zip?dl=0
ZIP_100210=https://www.dropbox.com/s/pfgjbkydhqtok3v/100210.zip?dl=0
ZIP_100211=https://www.dropbox.com/s/2fvabie5mtwsft1/100211.zip?dl=0
ZIP_100212=https://www.dropbox.com/s/ykxsx046mac38jo/100212.zip?dl=0
ZIP_110101=https://www.dropbox.com/s/90qwok6ygz3xpt5/110101.zip?dl=0
ZIP_110102=https://www.dropbox.com/s/wy5wucq7c739erx/110102.zip?dl=0
ZIP_110103=https://www.dropbox.com/s/zl77kojk5h10nz2/110103.zip?dl=0
ZIP_110104=https://www.dropbox.com/s/npd2rfqe9benfuc/110104.zip?dl=0
ZIP_110105=https://www.dropbox.com/s/d66bsxm95jczerx/110105.zip?dl=0
ZIP_110106=https://www.dropbox.com/s/d5xdhm6c7uyohir/110106.zip?dl=0
ZIP_110107=https://www.dropbox.com/s/mstha9g5e0j2wg0/110107.zip?dl=0
ZIP_110108=https://www.dropbox.com/s/1ez1116vy3vwh0k/110108.zip?dl=0
ZIP_110109=https://www.dropbox.com/s/mtrmi2jvw84l8sp/110109.zip?dl=0
ZIP_110110=https://www.dropbox.com/s/2f8yal4pq02npyv/110110.zip?dl=0
ZIP_110111=https://www.dropbox.com/s/0q6tzgbocarmbow/110111.zip?dl=0
ZIP_110112=https://www.dropbox.com/s/9ijku739cse0oyq/110112.zip?dl=0
ZIP_110113=https://www.dropbox.com/s/3sz7xyq2wykddzr/110113.zip?dl=0

if [ $1 == "report" ]; then
	echo "report"  > "report.txt"
	for i in ${TESTCASE[@]}
	do
		str="cat experimental_results/${i}.txt  >> \"report.txt\""
		echo -ne "${i} "  >> "report.txt"
		eval $str
		echo ""  >> "report.txt"
	done
else
	if [ ! -d "$DATA" ]; then
		mkdir -pv $DATA
	fi	

	for i in ${TESTCASE[@]}
	do
		if [ $1 -eq "${i}" ]; then
		   if [ ! -d "$DATA/${i}" ]; then
		   	   echo prepare ${i}
		   	   if [ -f "$DATA/${i}.zip" ]; then
		   	   	  mkdir -pv $DATA/${i}
				  mv $DATA/${1}.zip $DATA/${i}/
		   	   	  cd $DATA/${i}
		   	   	  unzip ${i}.zip

			   else
		   	   	  mkdir $DATA/${i}
		   	   	  str="wget \$ZIP_${i} -O $DATA/${i}/${i}.zip"
		   	   	  echo $str
		   	   	  eval $str
		   	   	  cd $DATA/${i}
		   	   	  unzip ${i}.zip
			   fi			
		   fi
		fi
	done
fi
