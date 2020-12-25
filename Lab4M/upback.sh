#!/bin/bash

HOME="/home/user"

if [[  -d $HOME/restore ]];
then
	rm -r $HOME/restore
	mkdir $HOME/restore
else
	mkdir $HOME/restore
fi

if [[ -z "$(ls $HOME | grep -E "^Backup-" | sort -n | tail -1 | sed 's/^Backup-//')" ]]
then
	echo "Try again"
	exit 1
else
	LastBackupDate=$(ls $HOME | grep -E "^Backup-" | sort -n | tail -1 | sed 's/^Backup-//')
	LastBackup="$HOME/Backup-${LastBackupDate}"
fi

for Fi in $(ls $LastBackup | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$");
	do
		cp "${LastBackup}/${Fi}" "$HOME/restore/${Fi}"
		echo "performed"
	done
