#!/bin/bash

$ACTION = $1

case $ACTION in
	'mount')
		echo sdfkjdfsdfsdrhkjehrkjr | encfs -S ~/.dropbox_data/Dropbox/projects/ ~/projects/ 
		;;
	'umount')
		fusermount -u ~/projects/
		;;
	*)
		xterm -hold -e echo "Unsupported parameter"
		;;
exit 0

