#Disclaimer

This is a fork of RPi-Distro/pi-gen repository to create an Ethereum node based on Raspbian. Please visit https://github.com/RPi-Distro/pi-gen for technical details about Raspbian customization.

#EthRaspbian

EthRaspbian is a custom Linux image for the Raspberry pi 2/3 that runs Geth or Parity Ethereum client as a boot service and automatically turns your Rasberrypi into an full Ethereum node.

If you have other ARM Soc please see:

https://github.com/diglos/userpatches

#What you need

1. Raspberry Pi 2/3 (didn't test Raspberry Pi 2 yet it but should work)
2. Micro SD Card and SD Adaptor (64GB Class 10 is recommended) 
3. Power Supply for specific Raspberrypi model
4. An ethernet cable
5. EthRaspbian Image (download link below)
6. (Optional) USB keyboard, Monitor and HDMI cable

#Install instructions for Linux

##Gui install 

Update. If you are not comfortable with command line take a look at Etcher:

https://etcher.io

##Command line install

Insert the MicroSD in your SD adapter and plug it into your computer. It is recommended to umount partitions in case that you have a preformated card.

1. Download the EthRaspbian image (you can choose from Geth or Parity images):

Geth edition

http://ethraspbian.com/downloads/image_2017-02-20-EthRaspbian-geth-1.5.9-lite.zip

Parity edition

http://ethraspbian.com/downloads/image_2017-02-20-EthRaspbian-parity-1.5.2-lite.zip

2. Unzip it (for instance):

`unzip image_2017-02-20-EthRaspbian-parity-1.5.2-lite.zip`

3. Check your MicroSD device name running:

`sudo fdisk -l`

You should see a device named `mmcblk0` or `sdd` (that matchs with the size of your card. This is a dangerous operation, be careful). For further info please visit:

https://www.raspberrypi.org/documentation/installation/installing-images/linux.md

4. Flash the MicroSD (mmcblk0 device and geth edition example example):

`sudo dd bs=1M if=2017-02-20-EthRaspbian-geth-1.5.9-lite.img of=/dev/mmcblk0 && sync`

5. Extract the MicroSD card

You are done. Insert the MicroSD in your Raspberry and power it on. Login details (Raspbian defaults):
```
User: pi
Password: raspberry
```
It is strongly recommended to change the default password by running:

`passwd`

#Install instructions for Windows

Use Etcher to flash the image:

https://etcher.io

#Install instructions for Mac

Use Etcher to flash the image:

https://etcher.io

#Further info

##Features

###Common features

- MicroSD partition is resized automatically on first boot (this is a default Raspbian feature)
- Unique hostname. The hostname is changed on first boot to ethnode-[hashed mac chunk] so every single installation has a unique hostname (ethnode-e2b3c551, for instance) for every single installation
- SSH is enabled by default so you can connect remotely to the Raspberry
- Video memory set to 16MB instead of 64MB for saving some RAM
- The default Ethereum client runs as a Systemd service (as "pi" user) and it is started right after the network goes up. The Systemd option "Restart=always" is enabled for keeping the daemon alive in case the process dies or gets killed

###Parity image

- Parity as default Ethereum client
- Warp mode enabled. Expect to have a node up and running in about 25 minutes
- Geth client included (disabled by default)

###Geth Image

- Geth as default Ethereum client
- Light server enabled by default
- Swarm binary included
- Parity client included (disabled by default)

##Switching clients

Both clients (Geth and Parity) are included in both images so if something goes wrong with one of them (security breach, DDoS attacks…) you can switch to the other. Let’s say you are running the parity image, by typing:

```
sudo systemctl stop parity && sudo systemctl disable parity
sudo systemctl enable geth && sudo systemctl start geth
```

Will disable parity and start the geth daemon.

##Parity instructions (Parity image installed)

###Managing the daemon

Parity runs as a bootup service so it wakes up automatically. You can stop, start, restart and check the console output using systemctl:

`sudo systemctl stop|start|restart|status parity`


###Changing settings

Settings are stored on /etc/geth/parity.conf so you just have to edit this file and restart the daemon, for instance (setting a cache value):

```
sudo echo ARGS="--cache 384" > /etc/geth/parity.conf
sudo systemctl restart parity
```

##Geth instructions (Geth Image installed)

###Managing the daemon

Geth runs as a bootup service so it wakes up automatically. You can stop, start, restart and check the console output using systemctl:

`sudo systemctl stop|start|restart|status geth`

###Changing settings

Settings are stored on /etc/geth/geth.conf so you just have to edit this file and restart the daemon, for instance (setting a cache value):

```
sudo echo ARGS="--cache 384" > /etc/geth/geth.conf
sudo systemctl restart geth
```
###Light client and Light server

Light client works great on the Pi but as the main goal of this image is to support the Ethereum network it makes more sense to run Geth in Light server mode (to support the devices connecting as Light clients). It seems to run quite well with a little cache. To do so type:

```
sudo echo ARGS="--lightserv 25 --lightpeers 50 --cache 384" > /etc/geth/geth.conf
sudo systemctl restart geth
```

###Swarm

Swarm binary is included in the Geth package (/usr/bin/bzzd) so you can play with it. Keep in mind that you need to run geth in another network (NOT in the main one) and that the code is highly experimental. Remember to report any issues you may encounter.


###Tip

If you want to support EthRaspbian you can drop some Ether here :-)

`0x7ce2950AD4Dba4B75564ed4a5c302743Bfd90Aeb`
