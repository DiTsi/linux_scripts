#!/bin/bash

clear
echo "c) connect"
echo "d) disconnect"
echo "0) exit"

read -s -n1 i

case $i in
	"c"|"с")
		echo -e 'power on' | bluetoothctl
		sleep 1s
		echo -e 'connect 00:02:3C:03:BB:42' | bluetoothctl
		;;
	"d"|"в")
		echo -e 'disconnect' | bluetoothctl
		#sleep 3s
		echo -e 'power off' | bluetoothctl
		;;
	0)
		exit 0
		;;
	*)
		echo "ne ta knopka"
		;;
esac

exit 0

