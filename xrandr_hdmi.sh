#!/bin/bash

NOTEBOOK_RESOLUTION=1366x768
MONITOR_RESOLUTION=1280x1024

#xrandr --output LVDS1 --mode $LAPTOP_RESOLUTION --left-of VGA1 --output VGA1 --mode $VGA_RESOLUTION

xrandr --output HDMI1 --mode $MONITOR_RESOLUTION --right-of LVDS1
