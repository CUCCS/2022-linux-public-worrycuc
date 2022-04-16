<style>pre {
  overflow-y: auto;
  max-height: 300px;
}</style>
# 实验四：任务二 ——Web服务器访问日统计结果记录

## 实验目的

* 编写脚本处理

## 实验环境

* 本机linux系统：ubutun 20.04.03 live-server 64bit

## 实验要求

  * Web服务器访问日志
    - [x] 统计访问来源主机TOP 100和分别对应出现的总次数
    - [x] 统计访问来源主机TOP 100 IP和分别对应出现的总次数
    - [x] 统计最频繁被访问的URL TOP 100
    - [x] 统计不同响应状态码的出现次数和对应百分比
    - [x] 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
    - [x] 给定URL输出TOP 100访问来源主机

## 实验结果汇总

* 统计访问来源主机TOP 100和分别对应出现的总次数


```
    次数 主机id
    -------------
     18 809709107
     17 807279508
     16 808513236
     16 808513015
     15 809795902
     15 808096846
     14 809794955
     14 809662906
     14 809112832
     14 808189327
     14 808067655
     14 807551900
     14 807476873
     13 809872896
     13 809725085
     13 809116028
     13 809017785
     13 808408291
     13 808096845
     13 807488140
     13 807472727
     12 809907040
     12 809886531
     12 809882359
     12 809879343
     12 809814242
     12 809650538
     12 809644197
     12 809104996
     12 809100317
     12 808781719
     12 808764526
     12 808682157
     12 808506869
     12 808502706
     12 808492304
     12 808167448
     12 808073538
     12 807995212
     12 807972510
     12 807911551
     12 807470531
     12 807469030
     12 807468956
     12 807300865
     12 807288283
     11 809902170
     11 809896458
     11 809882201
     11 809881779
     11 809881611
     11 809813907
     11 809813642
     11 809808487
     11 809794966
     11 809794208
     11 809793857
     11 809789067
     11 809720216
     11 809716756
     11 809637169
     11 809635623
     11 809634594
     11 809399192
     11 809382214
     11 809358876
     11 809271735
     11 809209970
     11 809207451
     11 809036749
     11 809026370
     11 808776789
     11 808691647
     11 808685615
     11 808679465
     11 808602293
     11 808601119
     11 808515486
     11 808510572
     11 808488348
     11 808439483
     11 808424780
     11 808424428
     11 808423086
     11 808413880
     11 808173330
     11 808066951
     11 807895760
     11 807822742
     11 807814017
     11 807809475
     11 807809129
     11 807802641
     11 807797928
     11 807566978
     11 807566839
     11 807545239
     11 807476203
     11 807281970
     10 809903692
```

------
* 统计访问来源主机TOP 100 IP和分别对应出现的总次数
```
   次数  IP
  ------------------------
   6530 edams.ksc.nasa.gov
   4846 piweba4y.prodigy.com
   4791 163.206.89.4
   4607 piweba5y.prodigy.com
   4416 piweba3y.prodigy.com
   3889 www-d1.proxy.aol.com
   3534 www-b2.proxy.aol.com
   3463 www-b3.proxy.aol.com
   3423 www-c5.proxy.aol.com
   3411 www-b5.proxy.aol.com
   3407 www-c2.proxy.aol.com
   3404 www-d2.proxy.aol.com
   3337 www-a2.proxy.aol.com
   3298 news.ti.com
   3296 www-d3.proxy.aol.com
   3293 www-b4.proxy.aol.com
   3272 www-c3.proxy.aol.com
   3234 www-d4.proxy.aol.com
   3177 www-c1.proxy.aol.com
   3134 www-c4.proxy.aol.com
   3123 intgate.raleigh.ibm.com
   3088 www-c6.proxy.aol.com
   3041 www-a1.proxy.aol.com
   3011 mpngate1.ny.us.ibm.net
   2983 e659229.boeing.com
   2957 piweba1y.prodigy.com
   2906 webgate1.mot.com
   2761 www-relay.pa-x.dec.com
   2318 beta.xerox.com
   2311 poppy.hensa.ac.uk
   2237 vagrant.vf.mmc.com
   1910 palona1.cns.hp.com
   1793 www-proxy.crl.research.digital.com
   1762 koriel.sun.com
   1681 derec
   1637 trusty.lmsc.lockheed.com
   1623 gw2.att.com
   1563 cliffy.lfwc.lockheed.com
   1503 inet2.tek.com
   1485 disarray.demon.co.uk
   1467 gw1.att.com
   1435 128.217.62.1
   1395 interlock.turner.com
   1360 163.205.1.19
   1354 sgigate.sgi.com
   1336 bocagate.bocaraton.ibm.com
   1324 piweba2y.prodigy.com
   1311 gw3.att.com
   1310 keyhole.es.dupont.com
   1297 n1144637.ksc.nasa.gov
   1292 163.205.3.104
   1256 163.205.156.16
   1252 163.205.19.20
   1216 erigate.ericsson.se
   1211 gn2.getnet.com
   1089 gwa.ericsson.com
   1079 tiber.gsfc.nasa.gov
   1054 128.217.62.2
   1017 bstfirewall.bst.bls.com
   1015 163.206.137.21
   1013 spider.tbe.com
   1010 gatekeeper.us.oracle.com
    995 www-c8.proxy.aol.com
    984 whopkins.sso.az.honeywell.com
    966 news.dfrc.nasa.gov
    949 128.159.122.110
    940 proxy0.research.att.com
    925 proxy.austin.ibm.com
    902 www-c9.proxy.aol.com
    901 bbuig150.unisys.com
    899 corpgate.nt.com
    890 sahp315.sandia.gov
    869 amdext.amd.com
    848 128.159.132.56
    830 n1121796.ksc.nasa.gov
    825 igate.uswest.com
    819 gatekeeper.cca.rockwell.com
    815 wwwproxy.sanders.com
    814 gw4.att.com
    812 goose.sms.fi
    808 128.159.144.83
    805 jericho3.microsoft.com
    798 128.159.111.141
    786 jericho2.microsoft.com
    782 sdn_b6_f02_ip.dny.rockwell.com
    778 lamar.d48.lilly.com
    776 163.205.11.31
    772 heimdallp2.compaq.com
    771 stortek1.stortek.com
    762 163.205.16.75
    759 mac998.kip.apple.com
    742 tia1.eskimo.com
    733 www-e1f.gnn.com
    718 www-b1.proxy.aol.com
    715 reddragon.ksc.nasa.gov
    711 128.159.122.137
    701 rmcg.cts.com
    701 bambi.te.rl.ac.uk
    697 electron.mcc.com
    691 163.205.23.76
```

------

* 统计最频繁被访问的URL TOP 100
```
  次数   URL
  ---------------------------------
  97410 /images/NASA-logosmall.gif
  75337 /images/KSC-logosmall.gif
  67448 /images/MOSAIC-logosmall.gif
  67068 /images/USA-logosmall.gif
  66444 /images/WORLD-logosmall.gif
  62778 /images/ksclogo-medium.gif
  43687 /ksc.html
  37826 /history/apollo/images/apollo-logo1.gif
  35138 /images/launch-logo.gif
  30346 /
  27810 /images/ksclogosmall.gif
  24606 /shuttle/missions/sts-69/mission-sts-69.html
  24461 /shuttle/countdown/
  24383 /shuttle/missions/sts-69/count69.gif
  23405 /shuttle/missions/sts-69/sts-69-patch-small.gif
  22453 /shuttle/missions/missions.html
  19877 /images/launchmedium.gif
  17247 /htbin/cdt_main.pl
  12160 /shuttle/countdown/images/countclock.gif
  12137 /icons/menu.xbm
  12057 /icons/blank.xbm
  10345 /software/winvn/winvn.html
  10308 /icons/image.xbm
  10134 /history/history.html
  10126 /history/apollo/images/footprint-logo.gif
   9439 /history/apollo/images/apollo-small.gif
   9230 /history/apollo/images/footprint-small.gif
   9037 /software/winvn/winvn.gif
   8985 /history/apollo/apollo.html
   8662 /software/winvn/wvsmall.gif
   8610 /software/winvn/bluemarb.gif
   8583 /htbin/cdt_clock.pl
   7865 /shuttle/countdown/liftoff.html
   7389 /shuttle/resources/orbiters/orbiters-logo.gif
   7261 /images/shuttle-patch-logo.gif
   7177 /history/apollo/apollo-13/apollo-13.html
   7040 /images/
   7029 /shuttle/countdown/video/livevideo2.gif
   6615 /images/kscmap-tiny.gif
   6517 /shuttle/technology/sts-newsref/stsref-toc.html
   6309 /history/apollo/apollo-13/apollo-13-patch-small.gif
   5613 /shuttle/missions/sts-71/sts-71-patch-small.gif
   5264 /shuttle/missions/sts-69/images/images.html
   5248 /icons/text.xbm
   5093 /images/construct.gif
   4869 /images/shuttle-patch-small.gif
   4846 /shuttle/missions/sts-69/movies/movies.html
   4791 /shuttle/missions/sts-70/sts-70-patch-small.gif
   4785 /icons/unknown.xbm
   4559 /shuttle/missions/sts-69/liftoff.html
   4464 /facilities/lc39a.html
   4434 /shuttle/resources/orbiters/endeavour.html
   4365 /history/apollo/images/apollo-logo.gif
   4066 /shuttle/missions/sts-70/mission-sts-70.html
   4024 /images/lc39a-logo.gif
   3817 /shuttle/resources/orbiters/endeavour-logo.gif
   3706 /shuttle/technology/sts-newsref/sts_asm.html
   3518 /shuttle/countdown/countdown.html
   3507 /shuttle/missions/sts-71/movies/movies.html
   3377 /shuttle/countdown/video/livevideo.jpeg
   3140 /history/apollo/apollo-11/apollo-11.html
   3130 /shuttle/missions/sts-71/mission-sts-71.html
   3087 /shuttle/missions/sts-70/images/images.html
   2945 /shuttle/missions/sts-71/images/images.html
   2939 /shuttle/missions/sts-73/mission-sts-73.html
   2865 /images/faq.gif
   2864 /shuttle/technology/images/srb_mod_compare_1-small.gif
   2818 /shuttle/technology/images/srb_mod_compare_3-small.gif
   2715 /shuttle/technology/images/srb_mod_compare_6-small.gif
   2701 /history/apollo/apollo-11/apollo-11-patch-small.gif
   2586 /elv/elvpage.htm
   2544 /shuttle/missions/sts-73/sts-73-patch-small.gif
   2385 /shuttle/countdown/video/sts-69-prelaunch-pad.gif
   2343 /shuttle/missions/51-l/mission-51-l.html
   2293 /images/launch-small.gif
   2256 /facilities/tour.html
   2201 /shuttle/missions/51-l/51-l-patch-small.gif
   2172 /images/kscmap-small.gif
   2171 /shuttle/resources/orbiters/challenger.html
   2159 /shuttle/missions/sts-71/movies/sts-71-launch.mpg
   2146 /shuttle/technology/sts-newsref/sts-lcc.html
   2133 /htbin/wais.pl
   2120 /facts/about_ksc.html
   2107 /history/mercury/mercury.html
   2040 /images/mercury-logo.gif
   1991 /elv/elvhead3.gif
   1979 /images/launchpalms-small.gif
   1936 /images/whatsnew.gif
   1929 /history/apollo/apollo-spacecraft.txt
   1915 /facilities/vab.html
   1912 /shuttle/resources/orbiters/columbia.html
   1908 /shuttle/countdown/lps/fr.html
   1904 /shuttle/resources/orbiters/challenger-logo.gif
   1892 /images/ksclogo.gif
   1891 /whats-new.html
   1874 /elv/endball.gif
   1869 /history/apollo/apollo-13/apollo-13-info.html
   1868 /shuttle/missions/sts-74/mission-sts-74.html
   1845 /elv/PEGASUS/minpeg1.gif
   1835 /elv/SCOUT/scout.gif

```
* 统计不同响应状态码的出现次数和对应百分比
```  
次数    状态   百分比
---------------------------
1398987 200   89.1139 %
26497   302   1.68783 %
134146  304   8.54495 %
171     403   0.0108925 %
10055   404   0.640492 %
3       500   0.000191097 %
27      501   0.00171987 %
```
* 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
```
状态码 ------------
次数 URL
============================================== 
403 ------------------------------------------
32 /software/winvn/winvn.html/wvsmall.gif
32 /software/winvn/winvn.html/winvn.gif
32 /software/winvn/winvn.html/bluemarb.gif
12 /ksc.html/images/ksclogo-medium.gif
10 /ksc.html/images/WORLD-logosmall.gif
10 /ksc.html/images/USA-logosmall.gif
10 /ksc.html/images/NASA-logosmall.gif
10 /ksc.html/images/MOSAIC-logosmall.gif
5 /ksc.html/facts/about_ksc.html
4 /ksc.html/shuttle/missions/missions.html
404 ------------------------------------------
1337 /pub/winvn/readme.txt
1185 /pub/winvn/release.txt
683 /shuttle/missions/STS-69/mission-STS-69.html
319 /images/nasa-logo.gif
253 /shuttle/missions/sts-68/ksc-upclose.gif
209 /elv/DELTA/uncons.htm
200 /history/apollo/sa-1/sa-1-patch-small.gif
166 /://spacelink.msfc.nasa.gov
160 /images/crawlerway-logo.gif
154 /history/apollo/a-001/a-001-patch-small.gif

```
* 给定URL输出TOP 100访问来源主机
```
URL为 /
=====================
      次数 id
---------------------
      9   807488140
      7   808190779
      7   808096834
      6   808439468
      5   809825346
      5   809297554
      5   808096835
      5   807927260
      5   807496943
      4   809749541
      4   809675737
      4   809675539
      4   809675247
      4   809675086
      4   809303135
      4   808913697
      4   807927261
      3   809886216
      3   809836887
      3   809828067
      3   809828066
      3   809630075
      3   809617248
      3   809617244
      3   809617238
      3   809617212
      3   809303134
      3   809272875
      3   809271735
      3   809177943
      3   808969018
      3   808106810
      3   808106808
      3   808017949
      3   807496944
      3   807496942
      3   807488141
      2   809914541
      2   809912807
      2   809904415
      2   809903873
      2   809903157
      2   809901051
      2   809895905
      2   809895753
      2   809886700
      2   809882921
      2   809881682
      2   809879883
      2   809879311
      2   809877244
      2   809876690
      2   809873653
      2   809870973
      2   809870372
      2   809869760
      2   809862881
      2   809858495
      2   809834544
      2   809828069
      2   809828068
      2   809825481
      2   809825347
      2   809800459
      2   809794295
      2   809790021
      2   809788019
      2   809777149
      2   809735784
      2   809729040
      2   809728788
      2   809721739
      2   809715679
      2   809713139
      2   809712946
      2   809708122
      2   809703361
      2   809665667
      2   809656229
      2   809653070
      2   809644225
      2   809638913
      2   809638885
      2   809637199
      2   809635623
      2   809634468
      2   809631840
      2   809630284
      2   809617249
      2   809617243
      2   809617239
      2   809617213
      2   809617165
      2   809612594
      2   809607090
      2   809587960
      2   809579823
      2   809577303
      2   809543143
      2   809514537


```