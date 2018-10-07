#!/bin/bash

query=$(xsel)
#notify-send "Google Translate" "Query is ${query}"
translation=$(/usr/scripts/translate_2 "$query" ru)
#zenity --info --title "Translation" --text "$translation"
dunstify "Google Translate" "> $query\n\n$translation"

exit
