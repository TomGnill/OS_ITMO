#!/bin/bash
reverse() {
if ! [[ $3 -eq 3 ]]; then
echo"Error: необходимо указать input iutpu директорию">&2; exit -1
fi
if ! [[ -f "$2" ]] ; then
echo"Error: фалйл не существует">&2; exit -1
fi

 IFC=$'\n'
for entry in $(tac "$1")
do
for value in $entry
do
echo " $value"
 done
done
}
