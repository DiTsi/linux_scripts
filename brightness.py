#!/usr/bin/python
import sys

folder = '/sys/class/backlight/intel_backlight/'
file = 'brightness'

with open(folder + file, 'r') as f:
    brightness_cur = int(f.read())

brightness_new = brightness_cur

if sys.argv[1] == 'up':
    brightness_new = brightness_cur + 166
    if brightness_new > 4648:
        brightness_new = 4648

if sys.argv[1] == 'down':
    brightness_new = brightness_cur - 166
    if brightness_new < 0:
        brightness_new = 0

with open(folder + file, 'w') as f:
    f.write(str(brightness_new))

exit(0)
