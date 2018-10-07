#!/bin/bash

DIR_OUT=~/temp
LOG=~/.logs/sox_trim

FILE_PATH_NAME=`zenity --file-selection`


clear
echo "1) Разбить файл на части"
echo "2) Вырезать кусок из файла"
read -s -n1 CHOISE

echo "введите начало отрезаемого куска в секундах"
read NACHALO

echo "введите длину отрезаемого куска/кусков в секундах"
read DLINA

FILE_NAME=`basename "$FILE_PATH_NAME"`
FILE_NAME=`echo $FILE_NAME | sed 's/.wav//'`

echo "входной файл $FILE_PATH_NAME" >> $LOG

###

if [ $CHOISE = "1" ]; then

NUM=0

while [ "`cat /tmp/sox_trim_out`" == "" ]; do

 ((NUM++))

 if [ $NUM -lt 10 ]; then

        NUMO="0"$NUM

        else

        NUMO=$NUM

 fi

 sox $FILE_PATH_NAME $DIR_OUT/$FILE_NAME"_"$NUMO".wav" trim $NACHALO $DLINA >> $LOG
 ((NACHALO=NACHALO+DLINA))

done

echo "файл разбит на $NUM частей" >> $LOG
echo "выходной файл $DIR_OUT/$FILE_NAME_$NUMO.wav" >> $LOG

fi

###

if [ $CHOISE = "2" ]; then

 ((KONEC=NACHALO+DLINA))
 sox $FILE_PATH_NAME $DIR_OUT/$FILE_NAME"_"$NACHALO-$KONEC".wav" trim $NACHALO $DLINA

 echo выразано с $NACHALO по $KONEC секунду >> $LOG
 echo выходной файл $DIR_OUT/$FILE_NAME"_"$NACHALO-$KONEC".wav" >> $LOG

fi

echo >> $LOG

exit 0
