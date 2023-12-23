#!/bin/sh
# Description: This script will create a course directory if it does not exist.
# Author: Zoybzo
# Date: 2023-12-23
# Version: 1.0
# Usage: ./makedir.sh course_name1, course_name2, ...
if [ -z "$1" ]; then
  echo "Please enter at least one course name."
  exit 1
fi
subdir_names=("相关课件" "相关教材" "相关题目" "相关作业" "知识点笔记" ".private")
function create_dir() {
  course_name=$1
  if [ ! -d "./${course_name}" ]; then
    mkdir ./${course_name}
  else
    echo "$course_name directory already exists."
  fi
  for str in ${subdir_names[@]}; do
    if [ ! -d "./${course_name}/${str}" ]; then
      mkdir ./${course_name}/${str}
    else
      echo "Subdirectory ${course_name}/${str} already exists."
    fi
  done
}
for i in "$@"
do
    create_dir $i 
done
# ./makedir.sh "国际会议交流" "新时代中国特色社会主义理论与实践" "自然辩证法" "论文写作指导" "软件安全" "软件形式化" "高级人工智能" "高级软件工程"
