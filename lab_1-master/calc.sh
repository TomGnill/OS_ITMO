#!/bin/bash
 calc() {

 re='^-?[0-9]+$'
 if ! [[ $# -eq 3 ]];then
   echo "Error: количество аргументов слишком большое/мало">&2; exit -4
 fi
 if [[ "$1" != "sum" && "$1" != "mul" && "$1" != "sub" && "$1" != "div" ]]; then
   echo "Error: такого действия нет" >&2; exit  -5
 fi
 if ! [[ "$2" =~ $re && "$3" =~ $re ]]; then
   echo "Error: для корректной работы calc необходимо ввести 2 целых числа." >&2; exit -1
 fi
 if [[ "$1" == "div" && "$2" == "0" ]]; then
   echo "Error: На ноль делить нельзя!" >&2; exit -1
fi
case $1 in
 sum)
  echo $(($2 + $3))
 ;;
 sub)
  echo $(($2 - $3))
 ;;
 mul)
  echo $(($2 * $3))
 ;;
 div)
  echo $(($2 / $3)) | bc -l
 ;;
  esac
}
