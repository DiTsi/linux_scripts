#!/bin/bash

if [ $1 == 'powersave' ]; then
	echo powersave | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	dunstify -t 500 "Cpu Mode:" "$(printf "%s" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor))"
fi

if [ $1 == 'performance' ]; then
	echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
	dunstify -t 500 "Cpu Mode:" "$(printf "%s" $(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor))"
fi

exit 0
