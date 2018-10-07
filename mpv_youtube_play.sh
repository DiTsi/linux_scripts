#!/bin/bash

browser="Chromium"
terminal="xterm"

wmctrl -a $browser
sleep 0.1
xdotool key space
sleep 0.1
xdotool keydown alt keydown d keyup d keyup alt
sleep 0.1
xdotool keydown ctrl key c keyup ctrl
sleep 0.1
url=$(xclip -o)
#url=$(echo $url2 | sed 'i/\n//g')
if [[ $url = *"youtube"* ]]; then
	$terminal -e "mpv \"$url\""
	exit 0
else
	echo "URL isn't right. URL: $url2"
	sleep 10s
	exit 1
fi
