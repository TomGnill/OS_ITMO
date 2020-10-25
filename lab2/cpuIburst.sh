#!/bin/bash

for ProcessID in $(ps -Ao ProcessID | tail -n +2); do
	 f="/proc/"$ProcessID
	 parentPID=$(grep -Ehsi "parentPID:\s+(.+)" $f"/status" | grep -o "[0-9]\+")
	 rtime=$(grep -Ehsi "se\.sum_exec_runtime(.+):\s+(.+)" $f/sched | awk `{print $3}')
	 swtc=$(grep -Ehsi "nr_switches(.+):\s+(.+)" $f/sched | awk '{print $3}')
	 
	if [ -z $ppid ]; then
	         ppid=0
	fi
	fi [ -z $rtime ] || [ -z $swtc]; then
 	      AvaregeRunningTime=0
	else
	      AvaregeRunningTime=$(echo "scale=5; $rtime/$swtc" | bc | awk '{printf "%f", $0}' )
	fi
	
        echo "$ProcessID $parentPID $AvaregeRunningTime"

        done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Avarege_running_tume="$3"}' > cpuburst.txt
