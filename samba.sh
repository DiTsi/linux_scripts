#!/bin/bash
clear
while [ "$b" != "0" ]; do
echo "Выберите действие:"
echo
echo "1) Показать /etc/samba/smb.conf"
echo "2) Запустить SAMBA"
echo "3) Создать новый /etc/samba/smb.conf и запустить SAMBA"
echo "4) Добавить путь в /etc/samba/smb.conf и перезапустить SAMBA"
echo "5) Остановить SAMBA"
echo "0) Закрыть скрипт"
echo; read -s -n1 b
case "$b" in
"1")
clear
echo '---------------------------------'
cat /etc/samba/smb.conf
echo '---------------------------------';echo
;;
"2")
sudo /etc/init.d/samba start
clear
;;
"3")
path=`zenity --file-selection --directory --title 'Выберите расшариваемую папку'`
echo 'Введите название папки (под этим именем она будет отображаться в Windows):'; read name
echo 'Добавить возможность записи для данной папки? (y/n)'; read write
if [ "$write" = "y" ]; then
write='read only = no'
else
write='read only = yes'
fi
echo -e '[global]\nworkgroup = MSHOME\nserver string = DiTsi\n# interfaces = eth0 192.168.0.1/255.255.255.0\n# bind interfaces only = yes\ninvalid users = root @root\n#hosts deny = ALL\nhosts allow = 192.168.0.\ndisplay charset = CP1251\ndos charset = CP866\nsecurity = share\nguest only = yes\n#guest account = nobody\n#encrypt passwords = yes\nlog file = /var/log/samba/log.%m\nsmb passwd file = /etc/samba/smbpasswd\n#printer name = Canon MP160 Printer\n#create mask = 0775\n' | sudo tee /etc/samba/smb.conf
echo -e '['$name']\npath = '$path'\n#writeable=yes\n#browseable = yes\n#public = yes\n'$write | sudo tee -a /etc/samba/smb.conf
sudo /etc/init.d/samba start
echo
;;
"4")
path=`zenity --file-selection --directory --title 'Выберите расшариваемую папку'`
echo 'Введите название папки (под этим именем она будет отображаться в Windows):';read name
echo 'Добавить возможность записи для данной папки? (y/n)'; read write
if [ "$write" = "y" ]; then
write='read only = no'
else
write='read only = yes'
fi
echo -e '['$name']\npath = '$path'\n#writeable=yes\n#browseable = yes\n#public = yes\n'$write | sudo tee -a /etc/samba/smb.conf
sudo /etc/init.d/samba restart
echo
;;
"5")
sudo /etc/init.d/samba stop
clear
;;
esac
done
clear
