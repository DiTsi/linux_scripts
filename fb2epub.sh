#!/bin/bash

FULL_PATH=$1
OUT_DIR=$2

if [ "`echo $FULL_PATH | grep -i .fb2$`" != "" ]; then
	if [ "$OUT_DIR" != "" ]; then
		T=$(basename $FULL_PATH)
	        T="`echo $T | sed -e 's/....$//'`"
		fb2toepub "$FULL_PATH" "$OUT_DIR"/"$T".epub
	else
	        T="`echo $FULL_PATH | sed -e 's/....$//'`"
		fb2toepub "$FULL_PATH" "$T".epub
	fi
else
	echo Unrecognized file format
fi
