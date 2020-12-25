
#!/bin/bash

LABDIR = "/home/user/RestoredLabs/OS_ITMO/Lab4M"
TRASHDIR = "/home/user/.trash"
if [[ $# != 1 || ! -f $1 ]];
then
	echo "Error in arg."
	exit 1
fi
if [[ ! -e $TRASHDIR ]]; then
	 mkdir /home/user/.trash
fi

if [[ ! -f ~/.trash.log ]]; then
	 touch /home/user/.trash.log
fi
value=0
Trash = $1-$value
while [[ -f $TRASHDIR/$Trash ]]; do
  len value++
  Trash = $1-$value
done
ln $Trash $TRASHDIR/$Trash
echo $(readlink -f $1) $value >> /home/user/.trash.log
rm $1
