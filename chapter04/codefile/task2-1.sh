#!/usr/bin/env bash

#已经获取 wget https://c4pr1c3.github.io/LinuxSysAdmin/exp/chap0x04/worldcupplayerinfo.tsv


function help() {
  echo "Usage: ./task2-2.sh [OPTIONS]"
  echo "Options:"
  echo "  -h, --help        print this help message"
  echo "  -a  --age         get the number and percentage of players from different age groups" 
  echo "  -p  --position    get the number and percentage of players from different positions"
  echo "  -n  --name        who has the longest name?(character) who has the shortest name?"
  echo "  -o  --oldest      who is the oldest players? who is the yougest players "
}

function age {
echo "first, the number and percentage of players from different age groups"
s_count=0
m_count=0
l_count=0
line_num=1
while read line #阅读每行,统计年龄
do
    if [[ $line_num -ne 1 ]];then
        age=$(echo "$line" | cut -f 6) #按tab分隔
        if [[ $age -lt 20 ]];then
            s_count=$((s_count+1))
        elif [[ $age -gt 30 ]];then
            l_count=$((l_count+1))
        else
          m_count=$((m_count+1))
        fi
    fi
    line_num=$((line_num+1))
done < ../worldcupplayerinfo.tsv
all=$((s_count+m_count+l_count))
s_precentage=$((s_count*100/all))
m_precentage=$((m_count*100/all))
l_precentage=$((100-m_precentage-s_precentage))
printf "age in [0,20): %s %s%% \n" "${s_count}" "${s_precentage}" 
printf "age in [20,30]: %s %s%% \n" "${m_count}" "${m_precentage}" 
printf "age above 30: %s %s%% \n" "${l_count}" "${l_precentage}" 
echo "age counting task is done"
echo "======================================"
}

function position {
echo "second,count the number and percentage of players from different positions"
g_count=0
d_count=0
M_count=0
f_count=0
line_num=1
while read line #阅读每行,统计位置
do
    if [[ $line_num -eq 1 ]];then
        line_num=$((line_num+1))
        continue
    fi
    position=$(echo "$line" | cut -f 5)
 case $position in
        "Goalie")
         g_count=$((g_count+1));;
        "Defender")
         d_count=$((d_count+1));;
        "Midfielder")
         M_count=$((M_count+1));;
        "Forward")
         f_count=$((f_count+1));;
        "Défenseur" )
          d_count=$((d_count+1));;
        "") exit
    esac
done < ../worldcupplayerinfo.tsv
all=$((g_count+d_count+M_count+f_count))
g_precentage=$((g_count*100/all))
d_precentage=$((d_count*100/all))
f_precentage=$((f_count*100/all))
M_precentage=$((100-g_precentage-d_precentage-f_precentage))
printf "Goalie: %s %s%% \n" "${g_count}" "${g_precentage}" 
printf "Defender: %s %s%% \n" "${d_count}" "${d_precentage}" 
printf "Midfielder: %s %s%% \n" "${M_count}" "${M_precentage}"
printf "Forward: %s %s%% \n" "${f_count}" "${f_precentage}" 
echo "position counting task is done"
echo "======================================"
}

function name {
echo "who has the longest name?(character)(bit) who has the shortest name?"
longest=0;shortest=0;max=0;min=10
line_num=1
while read line #阅读每行,比较名字长度，按字符个数，名字间的空格和-不算 Raes M'Bolhi 全都计算
do
    if [[ $line_num -eq 1 ]];then
        line_num=$((line_num+1))
        continue
    fi
    name=$(echo "$line" | cut -f 9)
    name1=${name//-/} # 去掉-
    name2=${name1// /} # 去掉空格
    length=${#name2}
    if [[ $length -lt $min ]];then
        min=$length
        shortest=$name
    elif [[ $length -gt $max ]];then
        max=$length
        longest=$name
    fi
done < ../worldcupplayerinfo.tsv
printf "%s has the longest name, length is %s \n" "${longest}" "${max}" 
printf "%s has the shortest name, length is %s \n" "${shortest}" "${min}" 
echo "name counting task is done"
echo "======================================"
}

function oldest {
echo "who is the oldest players? who is the yougest players"
oldest=0;yougest=0;max=31;min=31
line_num=1
while read line #阅读每行,统计年龄
do
    if [[ $line_num -eq 1 ]];then
        line_num=$((line_num+1))
        continue
    fi
    age=$(echo "$line" | cut -f 6)
    name=$(echo "$line" | cut -f 9)
    if [[ $age -lt $min ]];then
        min=$age
        yougest=$name
    elif [[ $age -gt $max ]];then
        max=$age
        oldest=$name
    fi
done < ../worldcupplayerinfo.tsv
printf "%s is the oldest players, he is %s \n" "${oldest}" "${max}" 
printf "%s is the yougest players, he is %s \n" "${yougest}" "${min}" 
echo "age ranking task is done"
echo "======================================"
}

function parse_opts() {
  while getopts ":hapno" opt;do
    case $opt in
    h)
      help
      exit 0
      ;;
    a)
      age
      ;;
    p)
     position 
      ;;
    n)
      name
      ;;
    o)
      oldest
      ;;
    ?)
      echo "无效或不存在选项"
      help
      exit 0
      ;;
  esac
  done
}


echo "now let's analyze it"

parse_opts "$@" #要加参数
