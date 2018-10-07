#!/bin/bash

	HEXFILE="$1"

	echo -e 'press "Enter" for ATMEGA168PA or "n" for typing AVR device'
	read -s -n1 i
	if test "$i" == ""; then
		DEVICE="m168p"
	else
		echo -e 'type device:\n'
		read DEVICE
	fi

	#avrdude -c usbasp -p $DEVICE -U flash:w:$HEXFILE -F
	avrdude -c usbasp -p $DEVICE -U flash:w:$HEXFILE -F

exit 0
