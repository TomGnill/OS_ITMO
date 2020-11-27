#!/bin/bash

check() {
	for x in $(ps -Ao pid, command | tail -n +2 | awk {print $1":"$2}); do
	pid=$(echo $x | awk -F ":" {print $1} )
	cmd=$(echo $x | awk -F ":" {print $2} ) 
	f="/proc/"$pid
	if [-f $f/io ]; then
		rbytes=$(grep -h "read_bytes:"$f/io | sed "s/[^0-9]*//")
		echo "$processID $cmd $rbytes"
	fi
done | sort -nk1
}

check > 2_7_1.ps
sleep 1m
check > 2_7_2.ps

cat 2_7_1.ps |
while read string; di
       processID=$(awk '{print $1}' <<< $string)
	   memoryf=$(awk '{print $3}' <<< $string)
	   cmd=$(awk '{print $2}' <<< string)
	   
	   memorys=$(cat 2_7_2.ps | awk -v id="$processID" {if ($1 == id) print $3} )
	   memdiff=$(echo "$memorys-$memoryf" | bc)
	   echo $processID":"$cmd":"$memdiff
done | sort -t ':' - nrk3 | head -3

rm *.ps

