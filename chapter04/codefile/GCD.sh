#!/usr/bin/env bash


if [[ $# -ne 2 ]];then #判断是否输入两个参数
  echo "please put in 2 parameters"
  exit 126
fi

expr $1 + 1 &>/dev/null #对输入值进行运算,以确定其为整数
if [[ $? -eq 0 ]];then
  expr $2 + 1 &>/dev/null 
  if [[ $? -eq 0  ]];then
    num=2
    temp=1
    while [[ $num -le $1 ]]&&[[ $num -le $2 ]] #求最大公约数
    do
      if [[ $(($1%num)) ]]&&[[ $(($2%num)) ]]&&[[ $num -gt $temp ]];then
        temp=$num
        num=$((num+1))
      fi
    done
    echo "GCD is $temp"
    exit 0
  fi
fi

echo "$1" |sed 's/\.//g'  | grep [^0-9] >/dev/null #判断输入参数是否为字符（小数或者整数可以正常运行）
if [[ $? -eq 0 ]];then
  echo "$1 is a string"
  exit 126
else 
  expr $1 + 1 &>/dev/null #对输入值进行运算
  if [[ $? -ne 0 ]];then
  echo "$1 is a decimal"
  exit 126
  fi
fi
echo "$2" |sed 's/\.//g'  | grep [^0-9] >/dev/null  
if [[ $? -eq 0 ]];then
  echo "$2 is a string"
  exit 126
else 
  expr $2 + 1 &>/dev/null #对输入值进行运算
  if [[ $? -ne 0 ]];then
  echo "$2 is a decimal"
  exit 126
  fi
fi