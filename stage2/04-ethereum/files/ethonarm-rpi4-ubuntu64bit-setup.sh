#!/bin/bash
#
# Copyright (c) Ethereum on ARM
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.
#
# https://github.com/diglos/pi-gen

# Update kernel and firmware
apt-get update && apt-get dist-upgrade -y
rpi-update <<EOF
y
EOF
rpi-eeprom-update -a

# Format USB SSD and mount it as /home
echo Formatting USB disk. Please be patient
if stat  /dev/sda > /dev/null 2>&1;
then
        echo Formatting USB Drive...
        fdisk /dev/sda <<EOF
d
n
p
1


w
EOF
mkfs.ext4 -F /dev/sda1
else
        echo no SDD detected
fi

echo Done!, please flash James Chambers Ubuntu server image on this MicroSD card

exit 0
