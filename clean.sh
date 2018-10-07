#!/bin/bash

FOLDERS="$HOME/temp/windows_files $HOME/temp/Downloads"
TRASH="$HOME/temp/TRASH"

# сколько дней не открывался файл
diff=14

# прошло в сек с 1970г.
DATE_cur=`date +%s`

# создать папку TRASH, если не существует
if [ ! -d $TRASH ]; then 
	mkdir -p $TRASH
fi

# перевод в секунды
((diff*=86400))

clear

for FOLDER in $FOLDERS; do

	for FILE in $FOLDER/*; do
		DATE_open=`stat -c %X "$FILE"`
		((DATE_diff=DATE_cur-DATE_open))
		if [ "$DATE_diff" -gt "$diff" ]; then
			mv "$FILE" "$TRASH"
		fi
	done
	
done

exit 0