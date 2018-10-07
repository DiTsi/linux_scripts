#!/bin/bash


NUM=1
DIR=~/temp


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
