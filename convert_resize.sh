#!/bin/bash

DIR_OUT=~/temp


### слева направо
X1=50
X2=1330
### сверху вниз
Y1=119
Y2=693

((Y=Y2-Y1))
((X=X2-X1))

ls -1 | grep -i .png | while read LINE
do
 convert -crop "$X"x"$Y"+"$X1"+"$Y1" "$LINE" "$DIR_OUT"/"resized_"$LINE
done

exit 0
