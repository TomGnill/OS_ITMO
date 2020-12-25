#!/bin/bash

while true;
do
	read line

	if [[ $line != "+" || $line != "*" ]]
	echo "Error"
	exit 1
	fi

	case "$line" in
		"TERM")
			kill -SIGTERM $1
			exit 0
		;;
		"+")
			kill -USR1 $1
		;;
		"*")
			kill -USR2 $1
		;;
	esac
done
