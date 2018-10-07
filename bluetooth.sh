#!/bin/bash

dejstv=1
while [ $dejstv -ne 0 ]; do
clear
echo -e "Выберите действие:\n"
echo "1) Найти и примонтировать телефон"
echo "2) Отмонтировать телефон"
echo "3) Передать файл на телефон"
echo "4) Примонтировать Sony Ericsson Arc S"
echo "5) Отмонтировать Sony Ericsson Arc S"
echo -e "0) Закрыть скрипт\n"
read -s -n1 dejstv

case $dejstv in

4)
obexfs -b 5C:B5:24:22:30:89 /media/Xperia_Arc_S
LD_PRELOAD=/usr/lib/libtrash/libtrash.so.2.4 mc /media/Xperia_Arc_S
;;

5)
sudo umount /media/Xperia_Arc_S
;;

1)
clear; echo "Поиск..."
scan=( `hcitool scan | sed '1d; s/\t//; s/\n/\ /g; s/\ /\_/g; s/[;.,]//g'` )
#scan=(`cat ~/temp/hcitool_temp | sed '1d; s/\t//; s/\n/\ /g; s/\ /\_/g; s/[;.,]//g'` )
slov=`echo ${scan[*]} | wc -w`

clear
echo -e "найденные устройства:\n"
i=1; nomer=1
while [ $i -lt $slov ]; do
((k=i-1))
((y=nomer+1))
echo -e "$nomer - ${scan[$i]}$(tput cup $y 20)(${scan[$k]})"
i=$((i+=2))
((nomer++))
done

echo -e "\nвведите номер подключаемого устройства: \c"; read -s -n1 i
nazv=$((i*2-1)); ustr=$((nazv-1))
nazv=${scan[$nazv]}; ustr=${scan[$ustr]}

if [ ! -d /media/$nazv ]; then
sudo mkdir /media/$nazv
fi

clear; echo -e "\nвведите, если понадобится, на телефоне pin 314"
xterm -e "bluetooth-agent 314 &"
obexfs -b $ustr /media/$nazv
LD_PRELOAD=/usr/lib/libtrash/libtrash.so.2.4 mc /media/$nazv ~
;;
2)
clear
ustr=( `ls /media` ); kolvo=`echo ${ustr[*]} | wc -w`
nomer=1
while [ $nomer -le $kolvo ]; do
echo -e "$nomer - \c"; ((i=nomer-1)); echo "${ustr[$i]}"
((nomer++))
done
echo -e "\nкакое устройство отмонтировать? \c"; read i
((i--))
sudo umount /media/${ustr[$i]}
;;
3)


clear; echo "Поиск..."
scan=( `hcitool scan | sed '1d; s/\t//; s/\n/\ /g; s/\ /\_/g'` )
slov=`echo ${scan[*]} | wc -w`

echo -e "устройство-приемник:\n"
i=1; nomer=1
while [ $i -lt $slov ]; do
echo -e " $nomer - ${scan[$i]}"
((i+=2))
((nomer++))
done
echo
read -s -n1 i; ((i=i*2-2)); ustr=${scan[$i]}

path=`zenity --file-selection --title 'Выберите передаваемый файл'`
obexftp -b $ustr -p "$path"
;;
esac
done
