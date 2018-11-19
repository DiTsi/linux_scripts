#!/bin/bash


NUM=1
if [ "$1" == "work" ]; then
	DIR=~/temp
else
	DIR=~/temp
fi


while :; do

 if [ $NUM -lt 10 ]; then

	NAME="0"$NUM".png"

 else

	NAME=$NUM".png"

 fi

 if [ -f $DIR/$NAME ]; then

	((NUM++))

 else

	import $DIR/$NAME

 exit 0

 fi

done
