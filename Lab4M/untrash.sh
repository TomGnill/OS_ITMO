#!/bin/bash

TrashDir=~/.trash
TrashLog=~/.trash.log
HOMEDIR="/home/user"
name=$1

if [[ $# != 1 || ! -d $TrashDir || ! -f $TrashLog || ! "`echo $1 | sed 's/[a-z,0-9,_,-]*//'`" == "" ]];
then
	echo "Bad situation"
	exit 1
fi

fi

restore() {
	path=$1
	file=$2
	ln $TrashDir/$file $path
}

grep $name $TrashLog |
while read filepath; do
         file=$(echo $filepath | cut -d " " -f 1)
    	 del=$(echo $filepath | cut -d " " -f 2)

        read -p "${FN} Continue?" yn
        case "$yn" in
		"y")
	    	dir=$(dirname $file) &&
       		 if [ -d $dir ]; then
    	      	     $(restore $file $del)
     		  else
       		     $(restore $HOMEDIR/$name $del) &&
       	  	     echo "Restored in $HOMEDIR"
       		 fi &&
        		rm $TrashDir/$del && {
            		sed -i "#$filepath#d" $TrashLog
            		echo "Restored $file"
	 	   *)
          	    echo "Bad choice"
	  	    continue
         	   ;;
	  	  "n")
	   	   echo "Bye!"
	   	   continue
          	  ;;
          esac
done
