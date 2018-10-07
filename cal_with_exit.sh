#!/usr/bin/bash

cal -my
tput setab 2 && tput setaf 0 && echo -e "(type \"q\" to exit)\c" && tput sgr0
while :; do 
	read -s -n1 key
	if [ "$key" == "q" ]; then
		exit 0
	fi
done
