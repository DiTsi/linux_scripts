#!/bin/bash

clear
unison /home/local/HORSGROUP/dtsybus/data /home/local/HORSGROUP/dtsybus/.google_drive/data_backup -auto -perms 0

echo -e "\e[32mCompleted. Press any key to exit...\e[0m"
read -s -n1 vybor
case $vybor in
	*) exit 0;;
esac
