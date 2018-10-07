#!/bin/bash
clear
r=0
while [ $r == 0 ]; do
echo "Выберите действие:"
echo
echo "1) view /etc/ffproxy/db/access.ip"
echo "2) edit /etc/ffproxy/db/access.ip and restart /etc/init.d/ffproxy"
echo "3) add IP to /etc/ffproxy/db/access.ip and restart /etc/init.d/ffproxy"
echo "4) stop /etc/init.d/ffproxy"
echo "0) close script"
echo
read -s -n1 a
case "$a" in
"3")
clear
echo -e "Введите ip: \c"; read ip
ip=( `echo $ip | tr '.' ' '` )
echo "^${ip[0]}\\.${ip[1]}\\.${ip[2]}\\.${ip[3]}$" | sudo tee -a /etc/ffproxy/db/access.ip
sudo /etc/init.d/ffproxy restart
;;
"4")
sudo /etc/init.d/ffproxy stop
;;
"1")
clear
cat /etc/ffproxy/db/access.ip
;;
"2")
sudo nano /etc/ffproxy/db/access.ip
sudo /etc/init.d/ffproxy restart
clear
;;
"0")
r=1
esac
echo
echo
done
