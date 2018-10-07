#!/bin/bash

mocp -s
sleep 0.5s

case $1 in
	"")
		umount /home/ditsi/temp/downloads/torrents
		umount /home/ditsi/music
		umount /home/ditsi/temp/share_server
		umount /home/ditsi/distrib
		exit 0
	;;
	"-f"|"--force")
		sudo umount -f /home/ditsi/temp/downloads/torrents
		sudo umount -f /home/ditsi/music
		sudo umount -f /home/ditsi/temp/share_server
		sudo umount -f /home/ditsi/distrib
		exit 0
	;;
	"-h"|"--help")
		echo -e "\nUsage nfsumnt:"
		echo -e "\t-f, --force\t\t\tforce umount\n"
		exit 0
esac
