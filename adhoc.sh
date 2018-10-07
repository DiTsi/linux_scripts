#!/bin/bash
# wpa_supplicant -iwlan0 -d -Dwext -c /etc/wpa_supplicant-adhoc.conf

case $1 in

"up")


	ifconfig wlan0 down
	iwconfig wlan0 mode ad-hoc
	iwconfig wlan0 channel 1
	iwconfig wlan0 essid 'DiTsi_WiFi'

	sudo ifconfig wlan0 192.168.0.1 netmask 255.255.255.0 up

	ifconfig wlan0 up
	iwconfig wlan0 Bit 54Mb/s

	echo 1 > /proc/sys/net/ipv4/ip_forward
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

;;

"down")

	ifconfig wlan0 down

;;

*)

	echo "используйте \"up\"/\"down\""

esac

exit 0
