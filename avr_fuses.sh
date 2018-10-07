#!/bin/bash
AVRDEVICE=m48

TERMINAL_WIDTH=$(tput cols)
avrdude -c usbasp -p m48 -U hfuse:r:/tmp/hfuse.bak:b -U lfuse:r:/tmp/lfuse.bak:b -F -U efuse:r:/tmp/efuse.bak:b
LFUSE=$(cat /tmp/lfuse.bak)
HFUSE=$(cat /tmp/hfuse.bak)
EFUSE=$(cat /tmp/efuse.bak)

LFUSE=$(printf "%08i" $(echo $LFUSE | sed 's/0b//'))
HFUSE=$(printf "%08i" $(echo $HFUSE | sed 's/0b//'))
EFUSE=$(printf "%08i" $(echo $EFUSE | sed 's/0b//'))

clear
tput cuf $((TERMINAL_WIDTH/2-8))
echo -e "\033[0;36mYOUR DEVICE: $AVRDEVICE\033[0m\n"
tput cuf $((TERMINAL_WIDTH-40))
echo -e '\033[0;31mREMEMBER!!  0 means "programmed"   (yes)'
tput cuf $((TERMINAL_WIDTH-28))
echo -e '1 means "unprogrammed" (no)\033[0m'

echo -e "LOW FUSE: (0b$LFUSE)\n"
echo $LFUSE | sed 's/\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)/ \1 - Divide clock by 8\
 \2 - Clock output\
 \3 - Select start-up time\
 \4 - Select start-up time\
 \5 - Select clock source\
 \6 - Select clock source\
 \7 - Select clock source\
 \8 - Select clock source\n/'
echo -e "HIGH FUSE: (0b$HFUSE)\n"
echo $HFUSE | sed 's/\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)/ \1 - External reset disable\
 \2 - debugWIRE enable\
 \3 - Enable serial program and data downloading\
 \4 - Watchdog timer always on\
 \5 - EEPROM memory is preserved through the chip erase\
 \6 - Brown-out detector trigger\
 \7 - Brown-out detector trigger\
 \8 - Brown-out detector trigger\n/'
echo -e "EXTENDED FUSE: (0b$EFUSE)\n"
echo $EFUSE | sed 's/\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)\([01]\)/ \1 - none\
 \2 - none\
 \3 - none\
 \4 - none\
 \5 - none\
 \6 - none\
 \7 - none\
 \8 - Self programming enable\n/'

echo -e "\033[1;30mcode for programming fuses:
avrdude -c usbasp -p $AVRDEVICE -U lfuse:w:0b${LFUSE}:m -F
avrdude -c usbasp -p $AVRDEVICE -U hfuse:w:0b${HFUSE}:m -F
avrdude -c usbasp -p $AVRDEVICE -U efuse:w:0b${EFUSE}:m -F\033[0m"

