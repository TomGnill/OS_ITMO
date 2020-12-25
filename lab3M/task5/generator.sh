#!/bin/bash

while true;
do
	read arifm
	echo "$arifm" > pipe

	if [[ "$arifm" == "QUIT" ]];	then
		echo "Finish"
		exit 0
	fi

	if [[ "$arifm" != "+" && "$arifm" != "*" && "$arifm" != [0-9] ]];then
		echo "You can enter only +, * and numbers 0-9 !"
		exit 1
	fi
done

