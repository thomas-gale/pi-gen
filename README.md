#NOTE

This is a fork of RPi-Distro/pi-gen repository to create a custom Raspbian image to support the Ethereum Network. Please visit https://github.com/RPi-Distro/pi-gen for technical details about Raspbian customization.

#EthRasbian

EthRaspbian is a Custom Raspbian Image with the parity ethereum client installed to run as a Ethereum blockchain full node. This is intended to be Flash and Play

#What you need

1. Raspberry Pi 2/3 (Raspberrypi 2 not tested yet but should work)
2. 64GB micro SD Card and SD Adaptor
3. Power Supply for specific Raspberrypi model
4. An ethernet cable
5. EthRaspbian Image

#Install instructions for Linux

Insert the MicroSD in your SD adapter and plug it into your computer. It is recommended to umount partitions in case they've been automonted (you can do it through your file browser or the command line)

1. Download the custom Raspbian image:

http://www.ethraspbian.com/downloads/2016-09-09-ethraspbian.img.zip

2. Unzip it:

`unzip http://www.ethraspbian.com/downloads/2016-09-09-ethraspbian.img.zip`

3. Check your MicroSD device by running:

`sudo fdisk -l`

You should see a device named `mmcblk0` or `sdd` (this is a dangerous operation, be careful). For further info please visit:

4. Flash it (mmcblk0 example):

`dd bs=1M if=2016-09-09-ethraspbian.img of=/dev/mmcblk0 && sync`

5. Extract the MicroSD card

You are done. Insert the MicroSD in your Raspberry and turn it on.

Instructions for Windows

Please read:

https://www.raspberrypi.org/documentation/installation/installing-images/windows.md

