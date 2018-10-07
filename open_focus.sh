#!/bin/bash

APP=`basename $1`
FULLAPP="$*"
HOSTNAME=`hostname`

# пробуем найти уже запущенный экземпляр программы
# и вывести ее окно на передний план
wmctrl -l -x | grep -i $APP | while read RUNNING
do
        WINDOW=${RUNNING#*${HOSTNAME} }
        wmctrl -a $WINDOW
        exit 1
done

# запускаем программу, если она еще не запущена
if [ $? -eq 0 ]
then
    $FULLAPP
fi
