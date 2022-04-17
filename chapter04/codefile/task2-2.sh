#!/usr/bin/env bash
#已经获取 wget https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/web_log.tsv.7z


function help() {
  echo "Usage: ./task2-2.sh [OPTIONS]"
  echo "Options:"
  echo "  -h, --help        print this help message"
  echo "  -n  --name        get the host name which are in the TOP100 list of the most frequencily requested host" 
  echo "  -i  --ip          get the host ip which are in the TOP100 list of the most frequencily requested host"
  echo "  -u  --url         get the URL that are in the TOP100 list of most frequencily requested"
  echo "  -s  --status      get the appear times of different status codes "
  echo "  -r  --restric     count the TOP10 URL what have 4xx like status code and its times"
  echo "  -d [URL] --define      get the host id of TOP100 list of defined URL requested host,please input URL:"
}


function name {
  echo "first,count the TOP 100 host name and the number it was requested" # TOP100 主机id
  echo "---------------------------" # 求（1）
  awk -F '\t' '{print $3}' ../web_log.tsv | sort | uniq -c | sort -nr | head -100 
  echo "work is done"
}

function ip {
  echo "second,count the TOP 100 ip and the number it was requested" # TOP100 主机ip
  echo "------------------------------------" # 求（2）
  awk -F '\t' '{print $1}' ../web_log.tsv | sort | uniq -c | sort -nr | head -100 
  echo "work is done"
}

function URL {
  echo "third,count the TOP 100 url" # TOP100 url
  echo "----------------------------------" # 求（3）
  awk -F '\t' '{print $5}' ../web_log.tsv | sort | uniq -c | sort -nr | head -100 
  echo "work is done"
}

function status {
  
echo "forth,count different sataus code " #统计不同响应状态码的出现次数和对应百分比
echo "--------------------------------" # 求（4）
awk -F '\t' 'BEGIN{counts=0;printf "times: percentage: status:\n"} $6 !~ /response/ {status[$6]=$6;times[$6]++;counts++} END{for(code in status) {print times[code],code,times[code]*100/counts,"%"}}' ../web_log.tsv 
# $6 !~ /[response]/ 去掉respons行
echo "work is done"
}

function restrict {
echo "fifth,count different sataus code " # 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数 404,403
echo "---------------------------------------" # 求（5）
# 格式code url times 
awk -F '\t' '$6 ~ /^4/ {print $5,$6}' ../web_log.tsv | sort -k 2 |uniq -c | sort -nr |rev| awk -F ' ' '{print $3,$2,$1}' | rev |awk -F ' ' 'BEGIN{
    counts=0;line=0;printf "times: url: \n"} {url[line]=$2;url_status[line]=$1;times[line]=$3;status[$1]=$1;line++} END{
        for(code in status){
            print code,"------------";counts=0;line=0;while(counts < 10){
                if(url_status[line]==code){print times[line],url[line];counts++;};line++}}}' 

echo "work is done"
}

function define {
  
echo "sixth,count different sataus code " # #给定URL输出TOP 100访问来源主机
  echo "----------------------------------" # 求（6）
  awk -F '\t' -va="${OPTARG}" '{if($5==a)print $3}' ../web_log.tsv | sort | uniq -c | sort -nr | head -100 # ../web_log.tsv
  echo "work is done"
echo "work is done"
}

function parse_opts() {
  while getopts ":hniusrd:" opt;do
    case $opt in
    h)
      help
      exit 0
      ;;
    n)
      echo "begin ,get host name"
      name
      ;;
    i)
      echo "begin ,get host ip"
      ip
      ;;
    u)
      echo "begin ,get TOP100 URL"
      URL
      ;;
    s)
      echo "begin ,get status code"
      status
      ;;
    r)
      echo "begin ,get 4XX TOP10 URL"
      restrict
      ;;
    d)
      echo "参数值：${OPTARG}"
      define
      ;;
    [?])
      echo "无效或不存在选项"
      help
      exit 0
      ;;
  esac
  done
}



echo "开始分析统计"


parse_opts "$@" #要加参数