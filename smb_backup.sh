#!/bin/bash

path="00. Личные папки/Dmitrii.Tsybus/backup"

sudo mount //horsgroup.com/departments

clear
unison /home/local/HORSGROUP/dtsybus/data /home/local/HORSGROUP/dtsybus/smb_mnt/"$path" -auto -links false -perms 0

echo -e "\e[32mCompleted. Press any key to exit...\e[0m"
read -s -n1 vybor
case $vybor in
	*) exit 0;;
esac
