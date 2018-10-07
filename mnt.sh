#!/bin/bash

# switch $2
case $2 in
1)
DEV=sdc1
;;
2)
DEV=sdd1
;;
3)
DEV=sde1
;;
4)
DEV=sdc2
;;
5)
DEV=sdd2
;;
6)
DEV=sde2
;;
7)
DEV=sdc
;;
8)
DEV=sdd
;;
9)
DEV=sde
;;
esac


# switch $1
case $1 in 
"m")
# CHECK MOUNT FOLDER EXISTS
if ! [ -d /mnt/$DEV ]; then
	notify-send "folder /mnt/$DEV not exist. Type \"mkdir /mnt/$DEV\"" -t 10000
	exit 0
fi

# CHECK DEVICE TO MOUNT EXISTS
i=5
ok=0
if ! [ -e /dev/$DEV ]; then
	while [ $i -gt 0 ]; do
		notify-send "Waiting $i sec for /dev/$DEV device" -t 500
		sleep 1.1s
		if [ -e /dev/$DEV ]; then
			ok=1
			break
		fi
		((i--))
	done
	if [ $ok -eq 0 ]; then
		notify-send "There is no /dev/$DEV device" -t 3000
		exit 0
	fi
fi
notify-send "Mounting /dev/$DEV device" -t 1000
sudo mount -o iocharset=utf8,noauto,flush,uid=1000,fmask=111,dmask=000 /dev/$DEV /mnt/$DEV
xterm -geometry 120x40 -e mc /mnt/$DEV ~/temp/downloads
;;

"u")
# notify-send "/dev/$DEV unmounting. Please, wait..." -t 1000

xterm -geometry 40x8 -e "echo unmounting... & sudo umount /dev/$DEV"
if [ $? = '0' ]; then
	mnt=1
else
	mnt=0
fi
mountpoint -q /mnt/$DEV
if [ $? = '0' ]; then
	notify-send "/dev/$DEV is busy. See the processes!" -t 4000
        xterm -geometry 148x20 -e "echo -e \"Processes:\n\" & lsof | grep $DEV & sleep 2m"
else if [ $mnt = 0 ]; then
		notify-send "/dev/$DEV not mounted!" -t 4000
	else 
		notify-send "/dev/$DEV unmounted" -t 10000
	fi
fi
;;
esac

exit 0
