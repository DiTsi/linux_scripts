#!/bin/bash

searchstring=$(zenity --entry --text='Type Search String (regex):' --entry-text='filename.*\.pdf')
#zenity --forms --add-list="hthth" --list-values='hello|world'

clear
locate -ir $searchstring

