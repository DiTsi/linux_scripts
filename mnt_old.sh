#!/bin/bash

spis=(`ls /dev/sd* | sed 's/\/dev\/sda[0-9]\?//; s/\/dev\///'`); kolvo=`echo ${spis[*]} | wc -w`
fg='tput cup'

if [ "$spis" = "" ]; then
tput setb 7
tput setf 0
clear
echo "$($fg 3 4)NO DEVICES!"
sleep 2s

else
while :; do
tput setb 7
tput setf 0
clear
echo "$($fg 1 38)┌--------------------------------┐"
echo "$($fg 2 38)|"; echo "$($fg 2 71)|"
echo "$($fg 3 38)|"; echo "$($fg 3 71)|"
echo "$($fg 4 38)|"; echo "$($fg 4 71)|"
echo "$($fg 5 38)|"; echo "$($fg 5 71)|"
echo "$($fg 6 38)|"; echo "$($fg 6 71)|"
echo "$($fg 7 38)|"; echo "$($fg 7 71)|"
echo "$($fg 8 38)|"; echo "$($fg 8 71)|"
echo "$($fg 9 38)|"; echo "$($fg 9 71)|"
echo "$($fg 10 38)|"; echo "$($fg 10 71)|"
echo "$($fg 11 38)└--------------------------------┘"

echo "$($fg 1 4)Devices:"

a=0
b=1
echo
while [ "$a" -lt "$kolvo" ]; do
fu[$b]=${spis[$a]}
((q=b+2))
echo "$($fg $q 4)$b) /dev/${fu[$b]}"
mountpoint -q /media/${fu[$b]}
if [ $? = '0' ]; then
echo "$($fg $q 16)$(tput setf 4) - mounted!$(tput setf 0)"
fi
((a++))
((b++))
done

echo "$($fg 3 40)Select action:"
echo "$($fg 5 40)m) Mount device and open folder"
echo "$($fg 6 40)u) Unmount folder"
echo "$($fg 7 40)o) Open folder"
echo "$($fg 9 40)0) Close script"

echo "$($fg 19 20)┌---------------------------------------------┐"
echo "$($fg 20 20)|                                             |"
echo "$($fg 21 20)└---------------------------------------------┘"
tput cup 20 22

mountpoint -q /media/sdb1
if [ "$kolvo" = "2" -a $? = '1' ]; then
dejstv="m"
else
read -s -n1 dejstv
fi

case $dejstv in
m)
mountpoint -q /media/sdb1
if [ "$kolvo" = "2" -a $? = '1' ]; then
b=2
else
echo "какое устройство необходимо примонтировать?"; read -s -n1 b
fi
if [ ! -d /media/${fu[$b]} ]; then
echo -e "папки для монтирования устройства нет!\nчтобы создать, введите пароль"
sudo mkdir /media/${fu[$b]}
fi
sudo mount -o noauto,uid=1000,fmask=111,dmask=000 /dev/${fu[$b]} /media/${fu[$b]}
LD_PRELOAD=/usr/lib/libtrash/libtrash.so.2.4 mc /media/${fu[$b]} ~;;
u)
mountpoint -q /media/sdb1
if [ "$kolvo" = "2" -a $? = '0' ]; then
b=2
else
echo "какую папку необходимо размонтировать?"; read -s -n1 b
fi
sudo umount /media/${fu[$b]} 2>/dev/null
mountpoint -q /media/${fu[$b]}
if [ $? = '0' ]; then
tput cup 20 22
echo "device is busy. Kill processes? (y/N)"; read -s -n1 ans
 if [ "$ans" = "y" ]; then
 fuser -km /media/${fu[$b]}
 sudo umount /media/${fu[$b]}
 tput cup 20 22; echo "устройство отмонтировано ;)              "; sleep 1s
 exit 0
 fi
else
tput cup 20 22; echo "устройство отмонтировано ;)              "; sleep 1s
exit 0
fi
;;
o)
mountpoint -q /media/sdb1
if [ "$kolvo" = "2" -a $? = '0' ]; then
b=2
else
echo "какую папку открыть?"; read -s -n1 b
fi
LD_PRELOAD=/usr/lib/libtrash/libtrash.so.2.4 mc /media/${fu[$b]} ~;;
0)
echo "закрываюся..."
sleep 2s
exit 0;;
esac

done
fi
