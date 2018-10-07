#!/bin/bash

NAME=$1
controller=$2
Ooption=$3
fg='tput cup'

windows_height=$(tput lines)
windows_width=$(tput cols)

((q=windows_height-=2))
((p=windows_width-=18))

function timer {
	sec=$1
	while [ $sec -gt 0 ]; do
			echo -e "$($fg $q $p)EXIT: $sec seconds\c"
			sleep 1s
			((sec-=1))
	done
}

if [ "Ooption" == "" ]; then
	Ooption = "fast"
fi

if [ "$controller" == "" ]; then

	
	clear
	
	
	echo -e '\n SELECT YOUR DEVICE:\n'
	echo ' 1) attiny2313'
	echo ' 2) atmega8'
	echo ' 3) atmega168'
	echo ' 4) atmega48'
	echo ' 5) attiny85'
	echo ' m) manual (enter your chip; such as "attiny2313", "atmega8")'
	
	#secs=10
	#timer $secs&
	
	#read -s -n1 -t$secs i
	read -s -n1 i
	#if [ "$i" == "" ]; then
		##kill $!
		#exit 0
	#fi
	
	#kill $!
	
	case $i in
		1) DEVICE="attiny2313";;
		2) DEVICE="atmega8";;
		3) DEVICE="atmega168";;
		4) DEVICE="atmega48";;
		5) DEVICE="attiny85";;
		"m"|"ь")
			tput cup 30 0
			echo -e "DEVICE = \c"
			read DEVICE;;
		*) exit 0
	esac
	

	clear

else 

	DEVICE=$controller;

fi


NAME="`echo $NAME | sed 's/\.c//'`"


#avr-gcc -gdwarf-4 -O"$Ooption" -mmcu="$DEVICE" -c ./"$NAME".c
avr-gcc -gdwarf-2 -Wall -fsigned-char -O1 -mmcu="$DEVICE" -c ./"$NAME".c
if [ $? != 0 ]; then echo -e '\n\n\nUNSUCCESS =('; exit 0; fi
avr-gcc -g -mmcu="$DEVICE" -o ./"$NAME".elf ./"$NAME".o
avr-objcopy -j .text -j .data -O ihex ./"$NAME".elf ./"$NAME".hex


#avr-objcopy -O ihex ./"$NAME".o ./"$NAME".hex

#if [ $? != 0 ]; then exit 0; fi

echo -e 'Compilation success'
#avr-size -C --mcu="$DEVICE" --target=ihex ./"$NAME".elf
string=$(avr-size -C --mcu="$DEVICE" --target=ihex ./"$NAME".elf)
proc=$(echo $string | sed 's/.*(\([0-9]*\)\.[0-9]% Full.*Data.*/\1/')

RED='\033[0;31m'
NC='\033[0m' # No Color
if [ $proc -ge 100 ]; then
	echo -e "\n${RED}Attention! $proc% of flash used!"
	exit 0
else
	echo -e "\n${proc}% of flash used"
fi


printf '\nDo you want to programm you device? (y/N)\n'
#timer 5 &
#read -s -n1 -t5 i
read -s -n1 i
if test "$i" != "y"; then
#	kill $!
	exit 0
fi

#kill $!

avrdude -c usbasp -p $DEVICE -U flash:w:./"$NAME".hex -F
exit 0





#while :; do
#	echo -e 'SUCCESS!\n\nDo you want to programm you device? (y/n)'
#
#	read -s -n1 k

#	while :; do
#	case $k in
#		"y"|"н") 
#			avrdude -c usbasp -p $DEVICE -U flash:w:./"$NAME".hex -F
#			if [ $? != 0 ]; then
#				echo -e 'Try it again? (y/n)'
#				read -s -n1 r
#				if [ $r == "y" -o $r == "н" ]; then
#					avrdude -c usbasp -p $DEVICE -U flash:w:./"$NAME".hex -F
#				else
#					exit 0
#				fi
#			else
#				exit 0
#			fi
#		;;
#		"n"|"т")
#			exit 0
#		;;
#	esac
#	done

done
