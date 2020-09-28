#!/bin/bash
log() {
if ! [ -f "/var/log/anaconda/X.log" ]; then
  echo "Error: log файла не существует" >&2; exit -3
else
cat /var/log/anaconda/X.log |grep "(WW)"|grep -v "warning"|sed "s/(WW)/\x1b[93mWarning:\x1b[0m/g"
cat /var/log/anaconda/X.log |grep "(II)"|grep -v "informational"|sed "s/(II)/\x1b[36mInformation:\x1b[0m/g"
fi
}
