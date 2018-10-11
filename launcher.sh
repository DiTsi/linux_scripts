#!/bin/bash

if [ "$1" == "ad" ]; then
	xfreerdp /u:"dmitrii.tsybus" /v:xcsdc03.horsgroup.com /p:`zenity --entry --title="Domain Password" --text="Enter your password:" --hide-text`
fi

exit 0
