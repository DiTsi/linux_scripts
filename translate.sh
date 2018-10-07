#!/bin/bash

case $1 in

"remember")

DIR=~/.translate_dict
DICT=$DIR/my_dict.txt

text_orig=$(xsel -o)
text_transl=$(wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$(xsel -o | sed "s/[\"'<>]//g")&sl=auto&tl=ru" | sed 's/\[\[\[\"//' | cut -d \" -f 1)

if [ ! -d $DIR ]; then
                mkdir $DIR
                echo "В домашнем каталоге создана папка $DIR"
fi

if [ ! -f $DICT ]; then
                touch $DICT
                echo "В папке $DIR создан ваш словарь $DICT"
fi

echo "$text_orig ---> $text_transl" >> $DICT

notify-send -u normal "> $text_orig" "$text_transl"

exit 0

;;

"translate")

##!/usr/bin/env bash
notify-send -u normal "> $(xsel -o)" "$(wget -U "Mozilla/5.0" -qO - "http://translate.google.com/translate_a/t?client=t&text=$(xsel -o | sed "s/[\"'<>]//g")&sl=auto&tl=ru" | sed 's/\[\[\[\"//' | cut -d \" -f 1)" -t 6000

exit 0

;;

esac
