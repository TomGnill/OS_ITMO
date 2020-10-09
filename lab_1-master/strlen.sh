#!/bin/bash
strlen() {
if ! [[ $# -eq 1 ]]; then
echo"Error: для правильной работы укажите строку, если строка содержит пробел попробуйте добавить ковычки">&2; exit -3
fi
if [[ -z "$1" ]]; then
echo "Error: вы не передали строку">&2; exit -6
fi
   string="$@"
   echo "${#string}"
}
