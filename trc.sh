#!/bin/bash
transmission-remote-cli $1

echo Remove \"$1\" file? \(Press Enter for remove\)
read -s -n1 ans
if [ "$ans" = "" ]; then
	rm $1
fi

exit 0
