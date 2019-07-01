EthRaspbian is a custom Linux image for the Raspberry pi 2/3/4 that runs Geth or Parity Ethereum clients as a boot service in light mode and includes other Ethereum components to support the network.

Due to hardware limits, Raspberry Pi is not capable of Syncing the blockchain. If you want to run an Ethereum full node with an ARM board please visit:

https://github.com/diglos/userpatches

# Image features

- Based on Debian Buster
- Automatically resizes the SD card
- Changes the hostname to something like “ethnode-e2a3e6fe” (HEX chunk based on the MAC hash)
- All binaries run as systemd services and are restarted in case any problem arises

The board may be particularly useful for the following of tasks:

- Support other key components of the Ethereum network (Swarm, IPFS, Status, Raiden Network)
- Run an Ethereum light node
- Run testnets
- Run private networks
- Use it as a development environment
- Other (Sidechains, Ethereum 2.0 tests…)

# Software installed

## Ethereum clients
- Geth 1.8.23 (runs by default in light mode)
- Parity 2.3.8

## Ethereum framework
- Ipfs 0.4.19
- Swarm 0.3.11
- Raiden_0.100.2_armhf.deb 
- Status.im 0.23.8 Beta8 Chaos (runs by default)


# What you need
1. Raspberry Pi 2/3
2. Micro SD Card and SD Adaptor (64GB Class 10 is recommended) 
3. Power Supply for specific Raspberrypi model
4. An ethernet cable
5. EthRaspbian Image (download link below)
6. (Optional) USB keyboard, Monitor and HDMI cable

# Install instructions for Linux

## Gui install 

Update. If you are not comfortable with command line take a look at Etcher:

https://etcher.io

## Command line install

Insert the MicroSD in your SD adapter and plug it into your computer. It is recommended to umount partitions in case that you have a preformated card.

1. Download the EthRaspbian image (you can choose from Geth or Parity images):

http://ethraspbian.com/downloads/image_2019-03-26-ethraspbian2.0-lite.zip

2. Unzip it (for instance):

`unzip image_2019-03-26-ethraspbian2.0-lite.zip`

3. Check your MicroSD device name running:

`sudo fdisk -l`

You should see a device named `mmcblk0` or `sdd` (that matchs with the size of your card. This is a dangerous operation, be careful). For further info please visit:

https://www.raspberrypi.org/documentation/installation/installing-images/linux.md

4. Flash the MicroSD (mmcblk0 device and geth edition example):

`sudo dd bs=1M if=2019-03-26-ethraspbian2.0-lite.img of=/dev/mmcblk0 && sync`

5. Extract the MicroSD card

You are done. Insert the MicroSD in your Raspberry and power it on. Login details (Raspbian defaults):
```
User: ethereum
Password: ethereum
```
It is strongly recommended to change the default password by running:

`passwd`

# Other operating systems

## Install instructions for Windows

Use Etcher to flash the image:

https://etcher.io

## Install instructions for Mac

Use Etcher to flash the image:

https://etcher.io


For further information regarding usage and Ethereum nodes please see:

https://github.com/diglos/userpatches

# Tip

If you want to support EthArmbian you can drop some Ether here :-)

`0x10BE809ad5F8Da1C675A26344E05cD9b56De6306`
