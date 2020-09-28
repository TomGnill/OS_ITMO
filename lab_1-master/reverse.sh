#!/bin/bash
reverse() {
if ! [ -r $1 ]; then
echo "Error: не получается прочесть первый файл">&2; exit -2
fi
if [[ -z "$1" ]]; then
echo "Error: вы не передали имя файла ввода">&2; exit -6
fi
if [[ -z "$2" ]]; then
echo "Error: вы не передали имя создаваемого/существующего файла">&2; exit -6
elif ! [ -f $2 ]; then
touch $2 &> /dev/null
tac $1 > $2
elif ! [ -w $2 ]; then
echo "Error: не получается переписать второй файл">&2; exit -2
fi
if ! [[ -f "$1" ]]; then
echo "Error: файл не существует">&2; exit -1
fi
if ! [[ -f "$2" ]] ; then
echo "Error: файл не существует">&2; exit -1
elif [[ $1 == $2 ]]; then
echo " Ты всё равно получишь тоже самое">&2 ;exit -2
fi
 tac $1 > $2
}
