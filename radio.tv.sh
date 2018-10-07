#!/bin/bash
clear
while :; do
potoki=(
"http://62.75.191.45:8050;stream.nsv" "Viva"
"http://88.198.3.15:8100;stream.nsv" "Euro Dance Radio"
"http://62.75.191.45:8050;stream.nsv" "kakayato"
)
#echo ${potoki[*]}
#kolvo=`echo ${potoki[*]} | wc -w`
#echo $kolvo
i=1
n=1
while :; do
echo "$n - ${potoki[$i]}"
((n+=1))
((i+=2))
if [ "${potoki[$i]}" = "" ]; then break; fi
done
echo -e "\nЧто смотрим?"; read i
((i=i*2-2))

mpv ${potoki[$i]}
done
