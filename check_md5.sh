#/bin/bash

clear
isofile=`zenity --title "Please select ISO" --file-selection 2>/dev/null`

blocks=$(expr $(du -b "$isofile" | awk '{print $1}') / 2048)
echo -e 'Enter the device (example: /dev/sdc): \c'
read device
echo -e 'wait...\n'

srmd5sum=`sudo dd if=$device bs=2048 count=$blocks | md5sum`
filemd5sum=`md5sum "$isofile"`

echo -e "\nResult:"
echo -e "   "$filemd5sum
echo -e "   "$srmd5sum "$device" | sed s/\ -//

