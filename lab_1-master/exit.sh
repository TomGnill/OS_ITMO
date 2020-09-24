#!/bin/bash
exit(){
 re='^-?[0-9]+$'
 if [[ "$1" =~ $re ]] ; then
 command exit "$1"
else
 command exit 0
fi
}
