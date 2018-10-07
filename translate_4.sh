#!/bin/bash

query=$(xsel)
xterm -geometry 120x40 -e "trans en:ru $query; read -s -n1 vybor"

exit
