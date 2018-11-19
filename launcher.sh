#!/bin/bash

if [ "$1" == "ps2" ]; then
	xfreerdp /u:"dmitrii.tsybus" /v:mowps002.horsgroup.com /p:`zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text`
fi
if [ "$1" == "ad" ]; then
	xfreerdp /u:"dmitrii.tsybus" /v:xcsdc03.horsgroup.com /p:`zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text`
fi
if [ "$1" == "rdp" ]; then
	xfreerdp /u:"dmitrii.tsybus" /v:`zenity --entry --title="Host" --text="Enter hostname:"`.horsgroup.com /p:`zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text`
fi
if [ "$1" == "tshors" ]; then
	xfreerdp /u:"dmitrii.tsybus" /v:ts-hors.horsgroup.com /p:`zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text`
fi

exit 0
