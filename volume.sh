#!/bin/bash

DEST=$1
DRIVER=$2
if [ $DRIVER = 'alsa' ]; then
	CUR_STATE=$(amixer get Master | egrep 'Playback.*?\[o' | egrep -o '\[o.+\]' | sed 's/\[// ; s/\]//')
else
	temp=$(pamixer --get-mute)
	if [ $temp = 'false' ]; then
		CUR_STATE="on"
	else
		CUR_STATE="off"
	fi
fi

case "$DEST" in
	'up')
		if [ $DRIVER = 'alsa' ]; then
			if [ $CUR_STATE = 'off' ]; then
				amixer sset Master,0 2+ && dunstify -t 500 "Volume:" "`amixer get Master,0|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'`% [mute]" -r 215
			else
				amixer sset Master,0 2+ && dunstify -t 500 "Volume:" "`amixer get Master,0|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'`%" -r 215
			fi
		fi

		if [ $DRIVER = 'pulse' ]; then
			if [ $CUR_STATE = 'off' ]; then
				pamixer -i 2 && dunstify -t 500 "Volume:" "`pamixer --get-volume`% [mute]" -r 215
			else
				pamixer -i 2 && dunstify -t 500 "Volume:" "`pamixer --get-volume`%" -r 215
			fi
		fi
	;;

	'down')
		if [ $DRIVER = 'alsa' ]; then
			if [ $CUR_STATE = 'off' ]; then
				amixer sset Master,0 2- && dunstify -t 500 "Volume:" "`amixer get Master,0|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'`% [mute]" -r 215
			else
				amixer sset Master,0 2- && dunstify -t 500 "Volume:" "`amixer get Master,0|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'`%" -r 215
			fi
		fi

		if [ $DRIVER = 'pulse' ]; then
			if [ $CUR_STATE = 'off' ]; then
				pamixer -d 2 && dunstify -t 500 "Volume:" "`pamixer --get-volume`% [mute]" -r 215
			else
				pamixer -d 2 && dunstify -t 500 "Volume:" "`pamixer --get-volume`%" -r 215
			fi
		fi
	;;
	
	'mute')
		if [ $DRIVER = 'alsa' ]; then
			amixer sset Speaker mute
			amixer sset Master mute && dunstify -t 500 "Volume:" "[mute]" -r 215
		fi
		if [ $DRIVER = 'pulse' ]; then
			pamixer -m && dunstify -t 500 "Volume:" "[mute]" -r 215
		fi
	;;
	
	'unmute')
		if [ $DRIVER = 'alsa' ]; then
			amixer sset Speaker unmute
			amixer sset Master unmute && dunstify -t 500 "Volume:" "[unmute]" -r 215
		fi
		if [ $DRIVER = 'pulse' ]; then
			pamixer -u && dunstify -t 500 "Volume:" "[unmute]" -r 215
		fi
	;;
esac

exit
