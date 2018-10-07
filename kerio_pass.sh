#!/bin/sh
echo "Type password and press ENTER for XOR output:"
read -s PASSWORD
 
for i in `echo -n "$PASSWORD" | od -t d1 -A n`; do XOR=$(printf "%s%02x" "$XOR" $((i ^ 85))); done
echo $XOR
