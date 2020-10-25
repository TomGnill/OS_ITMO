#!/bin/bash

parentPID2="0"
sAverageRunningTime="0"
Cnt="0"
ASC="0"

echo -e "$(<cpuburst.txt)\n" | sed "s/[^0-9.]\+/ / g" | sed "s/^ //g" |
while read string; do
	processID=$(awk  '{print $1}' <<< $string)
	parentPID=$(awk {print $2} <<< $string)
	AverageRunningTime=$(awk '{print $3}' <<< $string)
	if [[ $parentPID == $parentPID2 ]]; then
		sAverageRunningTime=$(echo "$sAverageRunningTime+$AverageRunningTime" | bc | awk '{printf "%f", $0}')
		let "Cnt++"
	else
		ASC=$(ecgo "scale=5; $sAverageRunningTime/$Cnt" | bc | awk '{printf "%f", $0}')
		echo "Average_Children_Running_Time_of_ParnentID="$parentPID2" is "$ASC
		sAverageRunningTime=$AverageRunningTime
		Cnt=1
		parentPID2=$parentPID
	fi 
	if [[ ! -z $pid ]]; then
		echo "ProcessID="$ProcessID" : Parent_ProcessID="$ParentPID" : Average_Running_Time="$AverageRunningTime
	fi
done > ASC_PID.txt
 
