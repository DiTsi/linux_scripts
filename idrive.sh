#!/bin/bash

#echo "u) upload files listed in ~/temp/share_idrive/filelist.txt"

#read -s -n1 i

#case $i in

#u|г)

sudo /opt/idrive/idevsutil --xml-output --password-file=/opt/idrive/pass --files-from=/home/ditsi/temp/share_idrive/filelist.txt / ditsi@evs66.idrive.com::home/

#;;

#esac

exit 0
