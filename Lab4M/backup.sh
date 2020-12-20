#!/bin/bash

HOMEDIR="/home/user"

LastBackupDate=$(ls $HOMEDIR | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
LastBackup="$HOMEDIR/Backup-$(LastBackupDate)"
Rep=$HOMEDIR/.backup-report
LastBackupTime=$(date -d "LastBackupDate" +"%s")

NowDate=$(date +"%Y-%m-%d")
NowTime=$(date -d "$NowDate" +"%s")

CalcTime=$(echo "(${NowTime} - ${LastBackupTime}) / 60 / 60 / 24" | bc )

if [[ $CalcTime > 7 || -z "$LastBackupDate" ]];
then
	mkdir "$HOMEDIR/Backup-${NowDate}"
	for file in $(ls $HOMEDIR/source);
	do
		cp "$HOMEDIR/source/$file" "$HOMEDIR/Backup-$NowDate"
	done
	flist=$(ls $HOMEDIR/source | sed "s/^/\t/")
	echo -e "${NowDate}. Created:\n${flist}" >> $Rep
else
	changes=""
	for file in $(ls $HOMEDIR/source);
	do
		if [[ -f "LastBackup/$file" ]];
	then
		sourceSize=$(wc -c "$HOMEDIR/source/${file}" | awk '{print $1}')
		BackupSize=$(wc -c "${LastBackup}/${file}" | awk '{print $1}')
		Size=$(echo "${sourceSize} - ${BackupSize}" | bc )

		if [[ $Size != 0 ]];
		then
			mv "$LastBackup/$file" "$LastBackup/$file.NowDate"
			cp "HOMEDIR/source/$file" $LastBackup
			changes="${changes}\n\t$file ($file.$NowDate)"
		fi
		else
			cp "$HOMEDIR/source/$file" $LastBackup
			changes="${changes}\n\t$file"
	fi
	done
    changes=$(echo $changes | sed 's/^\\n//')
    if[[ ! -z "$changes"]];
    then
	  echo -e "${LastBackupDate}. Updated:\n${changes}" >> $Rep
       fi
fi