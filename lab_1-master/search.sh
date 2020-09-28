#!/bin/bash
search(){
if ! [[ $# -eq 2 ]]; then
echo "Error: для корректной работы search необходимо ввести слово и название директории">&2; exit -1
fi
if [[ -z "$2" ]]; then
echo "Error: вы не передали искомое слово">&2; exit -1
fi
if [[ -z "$1" ]]; then
echo "Error: вы не передали путь директории">&2; exit -1
fi
if ! [[ -d $1 ]]; then
echo "Error: такой директории не существует">&2; exit -2
fi
if [[ -z "$1" && -z "$2" ]]; then
echo "Error: вы не передали директорию и слово/выражение">&2; exit -6
fi
  grep -r "$2" "$1" 2>/dev/null

}

