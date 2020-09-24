#!/bin/bash
strlen() {
if ! [[ $# -eq 1 ]]; then
echo"Error: для правильной работы укажите строку, если строка содержит пробел попробуйте добавить ковычки">&2; exit -3
fi
   somevar="$1"
   size=${#somevar}
   echo "$size"
}
