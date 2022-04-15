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
  * age in [0,20): 9 1% 
  * age in [20,30]: 600 81% 
  * age above 30: 127 18% 

|    年龄   |                 球员数量                |               百分比                  |
| :-------: | :------------------------------------: | :-----------------------------------: |
|    **[0,20)**     |            9           |             1%              |
|     **[20,30]**      |                   600                     |                       81%                      |
|     **above 30**      |                    127                     |                  18%                        |

------
* 统计访问来源主机TOP 100 IP和分别对应出现的总次数
  * Goalie: 96 13% 
  * Defender: 237 32% 
  * Midfielder: 268 37% 
  * Forward: 135 18% 

|    年龄   |                 球员数量                |               百分比                  |
| :-------: | :------------------------------------: | :-----------------------------------: |
|    **Goalie**     |            96           |             13%              |
|     **Defender**      |                   237                   |                       32%                      |
|     **Midfielder**      |                    268                     |                  37%                        |
|     **Forward**      |                    135                     |                  18%                        |

------

* 统计最频繁被访问的URL TOP 100
  * **Lazaros Christodoulopoulos** has the longest name, length is **25** 
  * **Jô** has the shortest name, length is **2** 

* 统计不同响应状态码的出现次数和对应百分比
  * **Faryd Mondragon** is the oldest players, he is **42** 
  * **Fabrice Olinga** is the yougest players, he is **18** 

* 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
  * **Faryd Mondragon** is the oldest players, he is **42** 
  * **Fabrice Olinga** is the yougest players, he is **18** 

* 给定URL输出TOP 100访问来源主机

## 实验结果记录过程

* 将输出结果整理
```shell
printf "%s has the longest name, length is %s \n" "${longest}" "${max}" >>./output.txt
```

![](./img/ouyput.png)

```
age in [0,20): 9 1% 
age in [20,30]: 600 81% 
age above 30: 127 18% 
Goalie: 96 13% 
Defender: 237 32% 
Midfielder: 268 37% 
Forward: 135 18% 
Lazaros Christodoulopoulos has the longest name, length is 25 
Jô has the shortest name, length is 2 
Faryd Mondragon is the oldest players, he is 42 
Fabrice Olinga is the yougest players, he is 18 
```