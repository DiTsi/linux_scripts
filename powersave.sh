#!/bin/bash

echo 5 | sudo tee /proc/sys/vm/laptop_mode
echo 10 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
echo 90 | sudo tee /proc/sys/vm/dirty_ratio
echo 1 | sudo tee /proc/sys/vm/dirty_background_ratio
echo 6000 | sudo tee /proc/sys/vm/dirty_writeback_centisecs
