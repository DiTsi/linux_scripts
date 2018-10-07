#!/bin/bash
clear
echo "Выберите действие:"
echo
echo "1) создать новый /etc/apt/apt.conf.d/proxy"
echo "2) очистить /etc/apt/apt.conf.d/proxy"
echo; read -s -n1 a
case "$a" in
"1")
clear
echo "Введите ip адрес в формате 192.168.0.12"
echo -e "ip: \c"
read ip; echo
echo "Введите порт"
echo "Если оставить поле пустым, то будет установлен порт 8080"
echo -e "port: \c"
read port; echo
if [ "$port" = "" ]; then
port=8080
fi
echo "Введите имя пользователя (если не задано, оставить поле пустым)"
echo -e "name: \c"
read name; echo
if [ "$name" != "" ]; then
echo "Введите пароль"
echo -e "password: \c"
read pass;
echo "Acquire::http::Proxy \"http://${name}:${pass}@$ip:$port/\";" | sudo tee /etc/apt/apt.conf.d/proxy
echo "Acquire::Proxy \"true\";" | sudo tee -a /etc/apt/apt.conf.d/proxy
else
echo "Acquire::http::Proxy \"http://$ip:$port/\";" | sudo tee /etc/apt/apt.conf.d/proxy
echo "Acquire::Proxy \"true\";" | sudo tee -a /etc/apt/apt.conf.d/proxy
fi
;;
"2")
echo "" | sudo tee /etc/apt/apt.conf.d/proxy
;;
esac
