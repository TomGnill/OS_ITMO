#!/bin/bash

search(){
if ![[ $# -eq 3]]; then
echo"Error: для корректной работы search необходимо ввести слово и название директории">&2; exit -1
fi
if ![ -d "$3" ]; then 
echo"Error: такой директории не существует."
fi
  grep -r "$1" "$2"

}

