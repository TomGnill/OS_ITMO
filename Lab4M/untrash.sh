#!/bin/bash

TrashDir="/home/user/.trash/"
TrashLog="/home/user/.trash.log"
HOMEDIR="/home/user"

if [[ $# > 1 || $# < 1 || ! -d $TrashDir || ! -f $TrashLog || ! "`echo $1 | sed 's/[a-z,0-9,_,-]*//'`" == "" ]];
then
	echo "Bad situation"
	exit 1
fi

file=$1
a=""
num=""

for i in $(grep "$1" $TrashLog | awk '{print $1}');
do
	a=$(echo $i | sed -e 's,/home/user/Lab4M/,,')
	if [ $a == $file ];
	then
	    break;
	fi
done
if [ $a == $file];
    then
	echo ""
    else
	echo "Error"
	exit 1
fi

for i in $(grep "$1" $TrashLog | awk '{print $NF}');
do
	FN=$(grep $i $TrashLog | awk '{$NF=""; print $0}')
	FN=$(echo "$FN" | sed 's/ *$//')
read -p "${FN} Continue?" yn
case "$yn" in
	"y")
	     NFN=""
	     TN=$i
	     RDIR=$(echo "$FN" | awk 'BEGIN{FS=OFS="/"}; {NF=""; print $0}')
	     FNN=$(echo "$FN" | awk 'BEGIN{FS="/"}; {print $NF}')
	     if [[ ! -d $RDIR ]];
	     then
		echo "Dir not found. File restored in homeDir"
		if [[ -f "${HOMEDIR}/{FNN}" ]];
		then
		    read -p "File \"${HOMEDIR}/${FNN}\" exitst.New name: " NFN
		    ln "${TrashDir}/${TN}" "${HOMEDIR}/${NFN}"
	            rm "${TrashDir}/${TN}"
		else
		    ln "${TrashDir}/${TN}" "${HOMEDIR}/${FNN}"
		    rm "${TrashDir}/${TN}"
		fi
	      else
		if [[ -f "${FN}" ]];
		then
		    read -p "File \"${FN}\" exits. New name: " NFN
		    ln "${TrashDir}/${TN}" "${HOMEDIR}/${NFN}"
		    rm "${TrashDir}/${TN}"
	        else
		    ln "${TrashDir}/${TN}" "${FN}"
		    rm "${TrashDir}/${TN}"
	        fi
	      fi
	      sed "/${i}/d" $TrashLog > .trash.log2 && mv .trash.log2 $TrashLog
	      echo "Fine"
	      continue
	    ;;
	    *)
              echo "Bad choice"
	      continue
            ;;
	    n)
	      echo "Bye!"
	      continue
            ;;
          esac
done
