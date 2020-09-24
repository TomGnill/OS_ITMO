#!/bin/bash
if ! [ -f "calc.sh" ]; then
   calc_er=1
 else
. ./calc.sh
fi
if ! [ -f "search.sh" ]; then
    sea_er=1
 else
. ./search.sh
fi
if ! [ -f "reverse.sh" ]; then
    rev_er=1
 else
. ./reverse.sh
fi
if ! [ -f "strlen.sh" ]; then
    str_er=1
 else
. ./strlen.sh
fi
if ! [ -f "log.sh" ]; then
    log_er=1
 else
. ./log.sh
fi
if ! [ -f "exit.sh" ]; then
    exi_er=1
 else
. ./exit.sh
fi
if ! [ -f "interactive.sh" ]; then
   int_er=1
 else
. ./interactive.sh
fi
if ! [ -f "help.sh" ]; then
   hel_er=1
 else
. ./help.sh
fi
case $1 in
calc)
if [ "$calc_er" = "1" ]; then
 echo" Error:такого действия нет!">&2; exit -5
fi
    calc "$2" "$3" "$4"
    exit 0
;;
search)
if [ "$sea_er" = "1" ]; then
 echo" Error:такого действия нет!">&2; exit -5
fi
    search "$2" "$3"
    exit 0
;;
reverse)
if [ "$rev_er" = "1" ]; then
 echo"Error: такого действия нет!">&2; exit -5
fi
    reverse" $2" "$3"
    exit 0
;;
strlen)
if [ "str_er" = "1" ]; then
 echo"Error: такого действия нет!">&2; exit -5
fi
    strlen "$2"
    exit 0
;;
log)
if [ "log_er" = "1" ]; then
 echo"Error: такого действия нет!">&2; exit -5
fi
    log "var/log/anaconda/X.log"
    exit 0
;;
exit)
if [ "$er_ex" = "1" ]; then
   echo"Error: данное действие недоступно.">&2 ;exit -5
fi
 if ! [[ $# -eq 1 ]]; then
   exit "$2"
else
   exit "0"
fi
;;
interactive)
 if [ "$int_er" = "1" ]; then
  echo"Error: данное действие недоступно.">&2; exit -5
fi
  interactive
;;
help)
 if [ "$hel_er" = "1" ]; then
echo "Error: Действие недоступно">&2; exit -5
fi
 help
 exit 0
;;
*)
  echo "Error: Такого действия нет, чтобы узнать возможные функции введите help.">&2 ; exit -2
;;
esac
