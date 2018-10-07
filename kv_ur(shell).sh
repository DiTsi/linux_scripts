#!/bin/bash
clear
echo "Введите a, b, c, если квадратное уравнение выглядит как ax^2+bx+c=0"
echo
echo -e "a = \c"; read a
echo -e "b = \c"; read b
echo -e "c = \c"; read c
echo
d=$((b*b-4*a*c))
if [ $d -gt 0 ]; then
d1=$((d^(1/2)))
x1=$(((-b+d1)/2/a))
x2=$(((-b-d1)/2/a))
echo "D>0. Корни квадратного уравнения:"
echo "     x1 = $x1"
echo "     x2 = $x2"
fi
if [ $d -eq 0 ]; then
x=$((-b/2/a))
echo "D=0. Уравнение имеет один корень:"
echo "     x = $x"
fi
if [ $d -lt 0 ];then
echo "D<0. Уравнение не имеет корней"
fi
echo
