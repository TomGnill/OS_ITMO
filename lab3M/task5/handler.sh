#!/bin/bash

cmd="+"
echo "You use plus"
result=1
tail -f pipe |
while true;
do
	read arifm
	case $arifm in
		"+")
			cmd="$arifm"
			echo "You use plus"
		;;
		"*")
			cmd="$arifm"
			echo "You use multi"
		;;
		[0-9])
			case $cmd in
				"+")
					result=$(($result + $arifm))
					echo $result
				;;
				"*")
					result=$(($result * $arifm)
					echo $result
			esac
		;;
		"exit")
			killall tail
			exit 0
		;;
		*)
			killall tail
			echo "Error"
			exit 1
		;;
	esac
done
