#!/usr/bin/env bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b") #除去空格作为分隔符


function help() {
  echo "Usage: ./task2-2.sh [OPTIONS]"
  echo "Options:"
  printf " -h , --help           for help\n"
  printf " -j [files/docmentary], --jpeg/jpg           image compression for jpeg image\n"
  printf " -c [files/docmentary], --comression     for compressing resolution of the jpeg/png/svg image while keeping the szie\n"
  printf " -w [files/docmentary], --watermarking   for adding user-defined text watermarking on images\n"
  printf " -r [files/docmentary], --renaming       for renaming iamges,adding prefix or suffix\n"
  printf " -s [files/docmentary], --switching      for switching png/svg images to ipeg iamges\n"
}

function traverse { #负责遍历
  echo "$1"
  workdir="$1"
  for file in $(find ${workdir} -type f); do 
     echo "$file"
     image_compre "${file}"
  done
}

function image_compre { #jpg,jpeg
  echo "$1"
  folderpath=$1
  if [ -f "$folderpath" ];then
    if [ "$(echo "$folderpath" |rev| cut -d "." -f 1 |rev )" = "jpeg" ];then #./*.jpeg适应
    gzip -d "$folderpath" #图片质量压缩
    fi
  fi
  if [ -d "$folderpath" ];then
    traverse "$folderpath" #遍历目录
  fi
  echo "work is done"
}

function resolution_compre {
  echo "$1"
 # 为了travis测试不另外设置命令端输入
 # read -p "please input the quality you want:" quality
 # if [[ $quality -gt 100 ]]&&[[ $quality -le 0 ]];then #确保值小于100
 #  echo "the quality should smaller than 100,bigger than 0"
 # fi
  folderpath=$1
  if [[ -f "$folderpath" ]]||[[  -d "$folderpath" ]];then
    for file in $(find "$folderpath" -name "*.jpeg" -or -name "*.png" -or -name "*.jpg" );do  #imageMagick不支持svg
      echo "$file"
      name=$(echo "$file" |rev| cut -d "." -f 2- | rev)
      name2=$(echo "$file" |rev| cut -d "." -f 1 | rev)
      convert "$file" -quality "80" "${name}_comp.${name2}" #尺寸不变的分辨率压缩
    done
  fi
  echo "work is done"
}

function watermarking { #把/前的.
  echo "$1"
  folderpath=$1
  if [ -f "$folderpath" ];then 
    name=$(echo "$folderpath" |rev| cut -d "." -f 2- | rev) #字符串截取处理
    name2=$(echo "$folderpath" | rev | cut -d "." -f 1 | rev)
    if [[ "${name2}" == "jpeg" ]]&&[[ "${name2}" == "jpg" ]]&&[[ "${name2}" == "png" ]];then
    echo "${name}_mark.${name2}"
    convert "${folderpath}" -gravity southeast -fill black -pointsize 16 -draw "text 5,5 'worry3+3'" "${name}_mark.${name2}" #文本水印
    fi
  fi
  if [ -d "$folderpath" ];then
    for file in $(find "$folderpath" -name "*.jpeg" -or -name "*.png" -or -name "*.jpg");do 
        echo "$file"
        name=$(echo "$file" |rev| cut -d "." -f 2- | rev)
        name2=$(echo "$file" | rev | cut -d "." -f 1 | rev)
        echo "${name}_mark.${name2}"
    convert "${file}" -gravity southeast -fill black -pointsize 16 -draw "text 5,5 'worry3+3'" "${name}_mark.${name2}" #svg不通用
    done
  fi
  echo "work is done"
}

function renaming {
  echo "$1"
  folderpath=$1
  read -p "please input the prefix :" p1
  read -p "please input the suffix :" p2
  if [ -f "$folderpath" ];then
    echo "$folderpath"
    name=$(echo "$folderpath" |rev| cut -d "." -f 2- | rev)
    name2=$(echo "$folderpath" | rev | cut -d "." -f 1 | rev)
    name3=$(echo "$name" | rev | cut -d "/" -f 1 | rev) # 有无路径/ 1.jpeg
    if [[ $? -eq 0 ]];then
      name1=$(echo "$name" |rev| cut -d "/" -f 2- | rev)
      name4=$(echo "$name3" | cut -d "." -f 1)
      if [[ $p1 ]]&&[[ $p2 ]];then #对输入参数的处理
      newname="${name1}/${p1}_${name4}_${p2}.${name2}"
      elif [[ $p2 ]];then
      newname="${name1}/${name4}_${p2}.${name2}"
      elif [[ $p1 ]];then
      newname="${name1}/${p1}_${name4}.${name2}"
      else
      newname="${name1}/${name4}.${name2}"
      fi
    else
    newname="${p1}_${name}_${p2}.${name2}"
    fi
  mv "$folderpath" "$newname"
  fi
  if [ -d "$folderpath" ];then
    for file in $(find "$folderpath" -type f );do 
        echo "$file"
       name=$(echo "$file" |rev| cut -d "." -f 2- | rev)
       name2=$(echo "$file" | rev | cut -d "." -f 1 | rev)
       name3=$(echo "$name" | rev | cut -d "/" -f 1 | rev) # 有无路径/ 1.jpeg
       if [[ $? -eq 0 ]];then
        name1=$(echo "$name" |rev| cut -d "/" -f 2- | rev)
        name4=$(echo "$name3" | cut -d "." -f 1)
       if [[ $p1 ]]&&[[ $p2 ]];then #对输入参数的处理
        newname="${name1}/${p1}_${name4}_${p2}.${name2}"
       elif [[ $p2 ]];then
        newname="${name1}/${name4}_${p2}.${name2}"
       elif [[ $p1 ]];then
        newname="${name1}/${p1}_${name4}.${name2}"
       else
        newname="${name1}/${name4}.${name2}"
       fi
      else
        newname="${p1}_${name}_${p2}.${name2}"
      fi
      mv "$file" "$newname"
    done
  fi
  echo "work is done"
}

function switching {
  echo "$1"
  folderpath=$1
  if [[ -f "$folderpath" ]]||[[  -d "$folderpath" ]];then
    for file in $(find "$folderpath" -name "*.png" -or -name "*.svg" -or -name "*.jpg" );do #判断文件格式
      name=$(echo "$file" |rev| cut -d "." -f 2- | rev)
      convert "$file" "${name}_exchange".jpeg 
      echo "${name}_exchange.jpeg is generated"
    done
  fi
  echo "work is done"
}


function parse_opts() {
  while getopts ":hj:c:w:r:s:" opt;do
    case $opt in
    h)
      help
      ;;
    j)
      echo "参数值：${OPTARG}"
      image_compre "${OPTARG}"
      ;;
    c)
      echo "参数值：${OPTARG}"
      resolution_compre "${OPTARG}"
      ;;
    w)
      echo "参数值：${OPTARG}"
      watermarking "${OPTARG}"
      ;;
    r)
      echo "参数值：${OPTARG}"
      renaming "${OPTARG}"
      ;;
    s)
      echo "参数值：${OPTARG}"
      switching "${OPTARG}"
      ;;
    *)
      echo "无效或不存在选项"
      help
      exit 0
      ;;
  esac
  done
}
printf "welcom\n"


parse_opts "$@" #要加参数

IFS=$SAVEIFS