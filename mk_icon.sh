#!/bin/bash
clear
echo "Выберите одно из действий:"
echo
echo "1) Создать новый значок"
echo "2) Перейти в папку со значками"
echo "3) Редактировать ~/.ideskrc"
echo "0) Закрыть скрипт"
echo
read -s -n1 a
if [ $a -eq "1" ]; then
echo "Существующие иконки:"
echo `ls ~/.idesktop -m`
echo -e "Введите имя файла иконки (без .lnk): \c"; read name
name=$name'.lnk'
echo "table Icon" > ~/.idesktop/$name
namei=`zenity --entry --title 'Введите название иконки:'`; echo " Caption: $namei" >> ~/.idesktop/$name
echo -e "Введите команду, выполняемую кнопкой: \c"; read com
echo " Command: $com" >> ~/.idesktop/$name
cd ~/temp/icons; icon=`zenity --file-selection --title 'Выберите иконку'`; echo " Icon: $icon" >> ~/.idesktop/$name
echo "Изменить стандартный размер иконки 60х60? (y/n)"; read y;
if [ $y = y ]; then
echo -e "Введите размер иконки в формате X Y : \c"; read x y;
echo " Width: $x" >> ~/.idesktop/$name
echo " Height: $y" >> ~/.idesktop/$name
else
echo " Width: 60" >> ~/.idesktop/$name
echo " Height: 60" >> ~/.idesktop/$name
fi
echo " X: 40" >> ~/.idesktop/$name
echo " Y: 40" >> ~/.idesktop/$name
echo "end" >> ~/.idesktop/$name
echo "Иконка создана! (^_^)"
fi
if [ $a -eq "2" ]; then
mc ~/.idesktop
fi
if [ $a -eq "3" ]; then
nano ~/.ideskrc
fi

