#!/bin/bash

FILENAME=$1
AVRDEVICE=(atmega48 atmega8 attiny2313)

if [ "$FILENAME" == "" ]; then
	clear
	echo "no file select"
	echo "use \"asm2avr sourcefile.asm\""
	exit 0
fi


echo "select device:"
i=0
while [ $i -lt ${#AVRDEVICE[*]} ]; do
		  echo "$i) ${AVRDEVICE[$i]}"
	((i++))
done
read -s -n1 j
AVRDEVICE_CHOISE=${AVRDEVICE[$j]}	


while :; do
	echo "file = $(dirname $FILENAME)/$(basename $FILENAME)"
	echo -e "\n press \"1\" to compile ASM file and flash HEX to AVR device"
	read -s -n1 CHOISE
	case $CHOISE in
		"1")
			tput setb 2; tput setf 0; echo "AVRA ->"; tput sgr0
			avra $FILENAME
			tput setb 2; tput setf 0; echo "-<"; tput sgr0


			tput setb 2; tput setf 0; echo "AVRDUDE ->"; tput sgr0
			FILENAME_HEX=$(echo $FILENAME | sed 's/\.asm/\.hex/')
			avrdude -c usbasp -p $AVRDEVICE_CHOISE -U flash:w:$FILENAME_HEX -F
			tput setb 2; tput setf 0; echo "-<"; tput sgr0


			tput setb 4; tput setf 0; echo "END"; tput sgr0
		;;
		*)
			exit 0
		;;
	esac
done
