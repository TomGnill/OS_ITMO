#!/bin/bash

result=1
operation="+"
TERM()
{
	echo "End"
	exit 0
}
SIG1()
{
	operation="+"
}
SIG2()
{
	operation="*"
}
trap "TERM" SIGTERM
trap "SIG1" USR1
trap "SIG2" USR2
	while true;
		do
		case "$operation" in
			"+")
				result=$(($result + 2))
			;;
			"*")
				result=$(($result * 2))
			;;
	esac
	echo $result
	sleep 1
done
