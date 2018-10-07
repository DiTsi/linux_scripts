#!/bin/bash

DIR=~/.translate_dict
DICT=$DIR/my_dict.txt

while :; do
	kolvo=$(cat $DICT | wc -l)
	i=1


	if [ $kolvo -lt 10 ]; then
		max=$kolvo
	else
		max=10
	fi


	while [ $i -le $max ]; do
		sleep 2m
		notify-send "$(sed -n "$i"p $DICT)" -t 8000
		((i+=1))
	done


done
exit 0
