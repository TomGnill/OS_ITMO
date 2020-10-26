#!/bin/bash

proc=$(ps -U user -o pid,command | tail -n +2 | sed -r "s/\s*([^ ]+)\s(.*)/\1:\2/")
lines_cnt=$(echo "$proc"|wc -1)
echo "Total process num: $lines_cnt" > userproc.txt
echo -e "\n$proc" >> userproc.txt
