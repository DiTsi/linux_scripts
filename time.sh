#!/bin/bash
clear
Y=`date +%Y`
M=`date +%m`
D=`date +%d`
h=`date +%H`
m=`date +%M`
echo '   Текущие дата и время:     (ниже подписаны названия параметров)'
echo
echo '   '$h:$m'  '$D-$M-$Y
echo '   h  m   D  M  Y'
echo;echo
echo 'Выберите действие:'
echo
echo '1) Изменить время'
echo '2) Изменить дату'
echo '3) Изменить один из параметров (Y/M/D/h/m/s)'
read -s -n1 a
case "$a" in
"2")
echo
echo -e 'Введите дату в формате "DD MM YYYY": \c'; read dr1 dr2 dr3
D=$dr1
M=$dr2
Y=$dr3
;;
"1")
echo
echo -e 'Введите время в формате "hh mm": \c'; read tr1 tr2
h=$tr1
m=$tr2
;;
"3")
echo
echo 'Какой параметр нужно изменить? (Y/M/D/h/m)'; read par
case "$par" in
"Y")
echo -e 'Введите значение в формате YYYY: \c'; read Y
;;
"M")
echo -e 'Введите значение в формате MM: \c'; read M
;;
"D")
echo -e 'Введите значение в формате DD: \c'; read D
;;
"h")
echo -e 'Введите значение в формате hh: \c'; read h
;;
"m")
echo -e 'Введите значение в формате mm: \c'; read m
;;
esac
;;
esac
sudo date $M$D$h$m$Y