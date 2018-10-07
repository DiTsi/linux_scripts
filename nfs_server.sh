#!/bin/bash
clear
while [ "$b" != "0" ]; do
echo "Выберите действие:"
echo
echo "1) Показать /etc/exports"
echo "2) Запустить NFS-KERNEL-SERVER"
echo "3) Создать новый /etc/exports, выполнить \"exportfs -a\" и запустить NFS-KERNEL-SERVER"
echo "4) Добавить запись в /etc/exports и выполнить \"exportfs -a\""
echo "5) Остановить NFS-KERNEL-SERVER"
echo "0) Закрыть скрипт"
echo; read -s -n1 b
case "$b" in
"1")
echo;echo '---------------------------------'
cat /etc/exports
echo '---------------------------------';echo
;;
"2")
sudo /etc/init.d/nfs-kernel-server start
clear
;;
"3")
path=`zenity --file-selection --directory --title 'Выберите папку'`
echo 'Введите ip адрес, который получит возможность монтировать папку'
echo 'Если оставить пустым, то монтировать смогут c любого ip'
read ip
if [ "$ip" = "" ]; then
ip="*"
fi
echo 'Добавить возможность записи для данной папки? (y/n)'; read write
if [ "$write" = "y" ]; then
write='(rw,no_subtree_check)'
else
write='(ro,no_subtree_check)'
fi
echo -e $path' '$ip$write'\n' | sudo tee /etc/exports
sudo exportfs -a
sudo /etc/init.d/nfs-kernel-server start
echo
;;
"4")
path=`zenity --file-selection --directory --title 'Выберите папку'`
echo 'Введите ip адрес, который получит возможность монтировать папку'
echo 'Если оставить пустым, то монтировать смогут c любого ip'
read ip
if [ "$ip" = "" ]; then
ip="*"
fi
echo 'Добавить возможность записи для данной папки? (y/n)'; read write
if [ "$write" = "y" ]; then
write='(rw,no_subtree_check)'
else
write='(ro,no_subtree_check)'
fi
echo -e $path' '$ip$write'\n' | sudo tee -a /etc/exports
sudo exportfs -a
echo
;;
"5")
sudo /etc/init.d/nfs-kernel-server stop
clear
;;
esac
done
clear
