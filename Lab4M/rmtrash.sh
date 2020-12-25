#!/bin/bash

LABDIR = "/home/user/Lab4M"
TRASHDIR = "/home/user/.trash"
if[[ $# > 1 || $# < 1 || ! -f $1 ]];
then
	echo "Error in arg."
	exit 1
fi
if [[ ! -e "/home/user/.trash" ]];
then
	mkdir /home/user/.trash
	
fi

value=$(find "$TRASHDIR/" -type f -name "[1-9]" | sed -e 's,.trash/,,')
value=$(echo $value | awk '{print NF}')

if [ -z $value ];
then
	ln "$LABDIR/"$1 "$TRASHDIR/1"
else
	value=$(($value + 1))
	ln "$LABDIR/"$1 "$TRASHDIR/"$value
fi

echo $(readlink -f $1) $value >> /home/user/.trash.log
rm $1
