#!/bin/bash
time=20m
while :; do
read level < /sys/class/power_supply/BAT0/charge_now
read status < /sys/class/power_supply/BAT0/status
if [ "$status" = "Discharging" ]; then
    if [ "$level" -lt "1160250" ] && [ "371280" -lt "$level" ]; then
    time="5m"
    notify-send "Ноутбук разряжается!!! (менее 25%)"
    else
    time="10m"
    fi
    while [ "$level" -lt "371280" ]; do
    sleep 6s &&
    notify-send -t 3000 "Сохраняй! Вырубай! (менее 8%)" "Зарядка заканчивается!"
    done
fi
sleep $time &&
:
done
exit 0
