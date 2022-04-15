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

function display {
  local i=1
  for ele in "${top100[@]}";do
    printf "%s. %s times: %s\n" "$i" "${my_list[${ele}]}" "${my_count[${ele}]}" >>./output2.txt
    i=$((i+1))
  done
}

function display2 {
  local i=1
  n=0
  amount=${#my_arrary[@]}
  echo "$amount"
  for ele in "${my_list[@]}";do
    num=${my_count[$n]}
    precentage=$(( num*100/amount )) #怎么写
    printf "%s. %s times: %s %s%% \n" "$i" "$ele" "${my_count[$n]}" "$precentage" >>./output2.txt
    i=$((i+1))
    n=$((n+1))
  done
}

function get_list { #不含重复内容的所有内容的数组
  my_list[0]="${my_arrary[0]}"
  list_num=1
  for id in "${my_arrary[@]}"; do 
    list_count=0 
    for i in "${my_list[@]}"; do
      if [[ "${id}" == "$i" ]];then
        list_count=$((list_count+1))
      fi
    done
    if [[ $list_count -eq 0 ]];then
    my_list[$list_num]="$id" 
    list_num=$((list_num+1))
    fi
  done
  echo "get_list is done"
  echo "===================="
}

function get_count { #统计每个id出现次数的数组
  for id in "${my_arrary[@]}"; do 
    i=0
    while [[ "$id" != "${my_list[${i}]}" ]]; do #加引号，字符的比较 !=
      i=$((i+1))
    done
    my_count[${i}]=$((my_count[i]+1)) 
  done
  echo "get_count is done"
  echo "===================="
}


function TOP100 { #对数组排序，然后输出0-99 ,这里使用专门的全局变量数组p1，传递数组
  index=0
  my_arrary=("$@") #运算量少

  top100=()
  get_list #直接使用my_arrary全局变量

  get_count # 直接使用全局变量"${my_arrary[*]}" "${my_list[*]}"

  if [[ $2 -eq 1 ]];then
    display2 
    return #不执行之后的操作
  fi

  n=0
  for ele in "${my_count[@]}";do
    # echo "$ele"
    arr[$n]=$ele
    n=$((n+1))
  done
  number=${#arr[@]}

  i=0
  n=0
  max=0
  time=100
  if [[ $2 -eq 2 ]];then
    time=10
  fi
  while [[ $i -lt $time ]];do #之后改成time 
    while [[ $n -lt $number ]];do
      if [[ ${arr[${n}]} -gt $max ]];then
        max_num=$n
        max=${arr[$max_num]}
      fi
      n=$((n+1))
    done
    top100[i]=$max_num
    arr[$max_num]=0
    max=0
    n=0
    i=$((i+1))
  done
  display # "${top100[*]}" "${my_list[*]}" "${my_count[*]}"
}


function name {
  echo "first,count the TOP 100 host name and the number it was requested" # TOP100 主机id
  echo "---------------------------" # 求（1）
  TOP100 "${host_id_arrary[@]}"
  echo "work is done"
}

function ip {
  echo "second,count the TOP 100 ip and the number it was requested" # TOP100 主机id
  echo "------------------------------------" # 求（2）
  TOP100 "${host_ip_arrary[@]}"
  echo "work is done"
}

function URL {
  echo "third,count the TOP 100 url" # TOP100 url
  echo "----------------------------------" # 求（3）
  TOP100 "${url_arrary[@]}"
  echo "work is done"
}

function status {
  
echo "forth,count different sataus code " #统计不同响应状态码的出现次数和对应百分比
echo "--------------------------------" # 求（4）
TOP100 "${status_arrary[@]}" "1"
echo "work is done"
}

function restrict {
echo "fifth,count different sataus code " # 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
echo "---------------------------------------" # 求（5）
p1=()
index=0
for ip in "${status_arrary[@]}"; do
  if [[ $ip -ge 400 ]]&&[[  $ip -lt 500 ]];then #4xx
    position[${index}]=$index
    index=$((index+1))
  fi
  echo $index
done

index=0
for i in "${position[@]}"; do
    p1[${index}]="${url_arrary[$i]}"
    index=$((index+1))
done

 TOP100 "${p1[@]}" "2"
 echo "work is done"
}

function define {
  
echo "sixth,count different sataus code " # #给定URL输出TOP 100访问来源主机
echo "------------------------------------" 

index=0
p1=() # 清空p1
for ip in "${url_arrary[@]}"; do
  if [[ "$ip" == "${OPTARG}" ]];then #改为400 500
    position[${index}]=$index
    index=$((index+1))
  fi
  echo $index
done
echo "=========================="
index=0
for i in "${position[@]}"; do
    p1[${index}]="${host_id_arrary[$i]}"
    index=$((index+1))
done
echo $index
TOP100 "${p1[@]}"
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



count=0
line_num=0
while read line #阅读每行
do
    if [[ $line_num -eq 0 ]];then #去掉第一行
        line_num=$((line_num+1))
        continue
    fi
    host_id=$(echo "$line" | cut -f 3)   
    # echo "$host_id"
    host_id_arrary[$count]="$host_id" #将所有记录存进数组,注意数组从1开始
    
    host_ip=$(echo "$line" | cut -f 1)   
    # echo "$host_ip"
    host_ip_arrary[$count]="$host_ip"

    url=$(echo "$line" | cut -f 5)   
    # echo "$url"
    url_arrary[$count]="$url"

    status=$(echo "$line" | cut -f 6)   
    # echo "$status"
    status_arrary[$count]="$status"
    line_num=$((line_num+1))
    count=$((count+1))
done < ../web_log.tsv 

parse_opts "$@" #要加参数