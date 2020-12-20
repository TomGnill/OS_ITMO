#!/bin/bash

if[[ $# > 1 || $# < 1 || ! -f $1 ]];
then
	echo "Error in arg."
	exit 1
fi
if [[ ! -e "/home/user/.trash" ]];
then
	mkdir /home/user/.trash
fi

value=$(find "/home/user/.trash/" -type f -name "[1-9]" | sed -e 's,.trash/,,')
value=$(echo $value | awk '{print NF}')

if [ -z $value ];
then
	ln "/home/user/Lab4M/"$1 "/home/user/.trash/1"
else
	value=$(($value + 1))
	ln "/home/user/Lab4M/"$1 "/home/user/.trash/1"
fi
echo $(readlink -f $1) $value >> /home/user/.trash.log
rm $1
