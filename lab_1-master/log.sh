#!/bin/bash
log() {
if ! [ -f "var/log/anaconda/X.log" ]; then
  echo "Error: log файла не существует" >&2; exit -3
fi
while IFS = read -r line
do
 if [[ (("$line" == *"(WW)"*)) && ! (("$line" == *"(WW) warning, (EE) error, (NI) not implemented,
(??) unknown"*)) ]]; then
 echo -e "${line//"(WW)"/"\e[33mWarning:\e[0m"}"
fi
done <"$1"
while IFS = read -r line
do if [[ (("$line" == *"(II)")) && ! (("$line" == *"(++) from command line, (!!) notice, (II)
informatioanl,"*)) ]]; then
 echo -e "${line//"(II)"/"\e[94mInformation:\e[0m"}"
fi
 done < "$1"
}
