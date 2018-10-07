#!/bin/bash

echo "d) default_color"
echo "c) color1"
echo "g) gap_x"


read -s -n1 I

case $I in


d|в)


clear
echo "CURRENT `grep default_color ~/.conkyrc.d/conkyrc_hor_cpu -h | sed 's/\ /\=/'`"


echo -e "NEW default_color=\c"
read COLOR_NEW


ls ~/.conkyrc.d/ -1 | while read FILE
do
# sed -e 's/^default_color\ [1-9a-z]*$/default_color\ '$COLOR_NEW'/' ~/.conkyrc.d/$FILE | grep default_color
 sed -e 's/^default_color\ [1-9a-z]*$/default_color\ '$COLOR_NEW'/' ~/.conkyrc.d/$FILE > /tmp/conkyrc_tmp
 cat /tmp/conkyrc_tmp > ~/.conkyrc.d/$FILE
done
;;


c|с)


clear
echo "CURRENT `grep 'color1\ [a-z1-9]' ~/.conkyrc.d/conkyrc_hor_cpu -h | sed 's/\ /\=/'`"


echo -e "NEW color1=\c"
read COLOR_NEW


ls ~/.conkyrc.d/ -1 | while read FILE
do
# sed -e 's/^color1\ [1-9a-z]*$/color1\ '$COLOR_NEW'/' ~/.conkyrc.d/$FILE | grep color1
 sed -e 's/^color1\ [1-9a-z]*$/color1\ '$COLOR_NEW'/' ~/.conkyrc.d/$FILE > /tmp/conkyrc_tmp
 cat /tmp/conkyrc_tmp > ~/.conkyrc.d/$FILE
done
;;


#g|п)

#ls ~/.conkyrc.d/ -1 > /tmp/conkyrc_tmp
#i=1
#cat /tmp/conkyrc_tmp | while read LINE
#do
#echo "$i) $LINE"
#((i++))
#done

#grep gap_x ~/.conkyrc.d/* -h


#sed -e 's/^gap_x\ [1-9a-z]*$/gap_x\ '$VAL'/' ~/.conkyrc.d/* | grep gap_x
# sed -e 's/^color1\ [1-9a-z]*$/color1\ '$VAL'/' ~/.conkyrc.d/$FILE > /tmp/conkyrc_tmp
# cat /tmp/conkyrc_tmp > ~/.conkyrc.d/$FILE
#;;

esac
