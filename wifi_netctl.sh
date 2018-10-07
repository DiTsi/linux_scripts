#!/usr/bin/bash

wifi_1="DiTsi_WiFi";			key_1="x"
wifi_2="mikrotik_wifi";			key_2="e"
wifi_3="Nilex_WiFi";			key_3="n"
wifi_4="onlime_90";				key_4="o"


ESSID=$(netctl list | grep '*' | sed s/*\ //)


clear
iwconfig wlan0
tput setf 6

echo
if [ "$key_1" != "" ]; then echo "$key_1)    $wifi_1"; fi
if [ "$key_2" != "" ]; then echo "$key_2)    $wifi_2"; fi
if [ "$key_3" != "" ]; then echo "$key_3)    $wifi_3"; fi
if [ "$key_4" != "" ]; then echo "$key_4)    $wifi_4"; fi
if [ "$key_5" != "" ]; then echo "$key_5)    $wifi_5"; fi
if [ "$key_6" != "" ]; then echo "$key_6)    $wifi_6"; fi
if [ "$key_7" != "" ]; then echo "$key_7)    $wifi_7"; fi
if [ "$key_8" != "" ]; then echo "$key_8)    $wifi_8"; fi
if [ "$key_9" != "" ]; then echo "$key_9)    $wifi_9"; fi
if [ "$ESSID" != "" ]
then
	echo "------------------"
	echo "d)    down $ESSID"
fi

tput sgr0

read -s -n1 i

if [ "$i" != "d" ]
then
	case $i in
		"$key_1") NETWORK="$wifi_1";;
		"$key_2") NETWORK="$wifi_2";;
		"$key_3") NETWORK="$wifi_3";;
		"$key_4") NETWORK="$wifi_4";;
		"$key_5") NETWORK="$wifi_5";;
		"$key_6") NETWORK="$wifi_6";;
		"$key_7") NETWORK="$wifi_7";;
		#"$key_8") NETWORK="$wifi_8";;
		#"$key_9") NETWORK="$wifi_9";;
		"q"|"0") exit 0;;
		*)
			clear
			echo "Неверная клавиша! Закрываю скрипт..."
			sleep 1s
			exit 0
		;;
	esac

	ESSID=$(netctl list | grep '*' | sed s/*\ //)

	if [ "$ESSID" == "$NETWORK" ]
	then
		clear
		echo "Профиль $NETWORK уже используется. Выхожу..."
		sleep 1s
		exit 0

	else
		#if [ "$ESSID" = "ditsi_wifi" ]; then
			#mocp -s
			#sudo nfsumnt
		#fi
		clear
		sudo netctl switch-to "$NETWORK"
		if [ $? != 0 ]; then
			#notify-send ":: $NETWORK  [failed to connect]"
			dunstify "netctl" "$NETWORK  [failed to connect]" -r 217
		else
			#if [ "$NETWORK" = "ditsi_wifi" ]; then
				#sudo nfsmnt
			#fi
			
			if [ "$ESSID" != "" ]; then
				#notify-send ":: switch to $NETWORK  [done]"
				dunstify "netctl" "switch to $NETWORK  [done]" -r 217
			else
				#notify-send ":: connect to $NETWORK [done]"
				dunstify "netctl" "connect to $NETWORK [done]" -r 217
			fi
			
			sleep 1s
			exit 0
		fi
	fi
else

    if [ "$ESSID" != "" ]
	then
		clear
		#nfsumnt
		sudo netctl stop "$ESSID"
		if [ $? == 0 ]; then
			#notify-send ":: disconnect $ESSID [done]"; fi
			dunstify "netctl" "disconnect $ESSID [done]" -r 217; fi
		sleep 1s
		exit 0
	else
		#notify-send "Соединений Wi-Fi не установлено"
		dunstify "netctl" "Соединений Wi-Fi не установлено" -r 217
		exit 0
	fi

fi
