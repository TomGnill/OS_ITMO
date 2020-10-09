#!/bin/bash
interactive() {
echo "Вас приветствует интерактивный режим labOS, не пытайтесь меня сломать, ибо всё что я умею
 в этой жизни это дышать

Введите букву для выбора действия, или его название:
 c\ - "calc"
 s\ - "search"
 r\ - "reverse"
 n\ - "strlen"
 l\ - "log"
 для подробного описания введите h -help
 Для выхода из программы e - exit
 "
read command
case $command in
 c|calc)
 if [ "$calc_er" = "1" ]; then
  echo "Error: действие недоступно." >&2;
  interactive
 fi
 echo "выберите действие:sum(+)/sub(-)/mul(*)/div(/):"; read calc_command
 if [[ -z "$calc_command" ]]; then
 echo "Error: вы не передали арифм. действие!">&2; exit -6
 interactive
 fi
 echo "первое число:"; read first
 if [[ -z "$first" ]]; then
 echo "Error: вы не ввели число">&2; exit -6
 interactive
 fi
 echo "второе число:"; read second
 if [[ -z "$second" ]]; then
 echo "Error: вы не передали второе число">&2; exit -6
 interactive
 fi
 echo "Ответ:"; calc "$calc_command" "$first" "$second"
 echo " "
 interactve
;;
 s|search)
  if [ "$sea_er" = "1" ]; then
  echo "Error:  действие недоступно" >&2;
  interactive
  fi
  echo "Введите директорию поиска:"; read sea_dir
  if [[ -z "sea_dir" ]]; then
  echo "Error: вы не передали директорию!">&2; exit -6
  interactive
  fi
  echo "Введите выражение:"; read sea_str
  if [[ -z "sea_str" ]]; then
  echo "Error: вы не передали выражение/строку">&2; exit -6
  interactive
  fi
  if ! [[ -d "$sea_dir" ]]; then
  echo "Error: директории несуществует" >&2;
  interactive
  fi
  search "$sea_dir" "$sea_str"
  echo " "
  interactive
;;
 r|reverse)
  if [ "$rev_er" = "1" ]; then
   echo "Error: действие недоступно" >&2;
   interactive
   fi
   echo "Файл ввода:"; read rev_fil1
   if [[ -z "rev_fil1" ]]; then
   echo "Error: вы не ввели файл ввода">&2; exit -2
   interactive
   fi
   echo "Файл вывода:"; read rev_fil2
   if [[ -z "rev_fil2" ]]; then
   echo "Error: вы не ввели файл вывода!">&2; exit -2
   interactive
   fi
   reverse "$rev_fil1" "$rev_fil2"
   echo " "
   interactive
;;
 n|strlen)
  if [ "$str_er" = "1" ]; then
   echo "Error: действие недоступно" >&2;
   interactive
  fi
   echo "Введите строку:"; read string
   eval "str=($string)"
   if [[ -z "str"]]; then
   echo "0"
   fi
   if [[ -z $string ]]; then
   echo "Error: вы не передали строку">&2; exit -2
   interactive
   fi
   strlen  "$str"
   echo " "
   interactive
;;
 l|log)
  if [ "$log_er" = "1" ]; then
   echo "Error: действие недоступно" >&2;
   interactive
  fi
    log "/var/log/anaconda/X.log"
    echo " "
    interactive
;;
 e|exit)
  if [ "$exi_er" = "1" ]; then
  echo "Error: действие недоступно" >&2;
  interactive
  fi
   command exit 0
;;
 h|help)
  if [ "$hel_er" = "1"]; then
   echo "Error: действие недоступно" >&2;
   interactive
  fi
   help
   interactive
;;
 *)
   echo "Вы выбрали несуществующее действие" >&2;
   interactive
;;
esac
}
