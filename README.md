EthRaspbian (ARM7) is a custom Linux image for the Raspberry Pi 4  that runs Geth or Parity Ethereum clients as a boot service and automatically turns the device into a full Ethereum node. The image includes other components of the Ethereum ecosystem such as Trinity, Status.im, Raiden, IPFS, Swarm and Vipnode as well as initial support for Eth2.0 clients.

It also runs on the Raspberry Pi 2/3 but due to hardware limitations these devices are not capable of syncing the blockchain. However, you can run Geth or Parity as light clients or support the Ethereum network by running other key software such as Status.im, Raiden, IPFS or Swarm.

For running a full Ethereum node on ARM64 devices (currently NanoPC-T4 [3] and Rockpro64 [4]), please see the EthArmbian project

https://github.com/diglos/userpatches

# Image features

EthRaspbian Image takes care of everything, from setting up the environment to installing and running the Ethereum software as well as synchronizing the blockchain.

These are the main features:

- Based on Raspbian [6] Debian Buster
- Automatically resizes the SD card
- Partitions and formats the USB SSD drive (in case is detected) and mount it as /home for storing the Ethereum blockchain
- Creates an Ethereum user account
- Changes the hostname to something like “ethnode-e2a3e6fe” (HEX chunk based on MAC hash)
- Enables SSH
- Automatically reboots once for hostname change, new /home mount point and MicroSD resize to take effect
- Runs Geth by default as a Systemd service and starts syncing the Blockchain. Systemd monitors the Ethereum client binary and respawns it in case it gets killed or something unexpected happens (such as a reboot)
- Includes Parity Ethereum client as well so you can switch between both clients
- Includes other components of the Ethereum framework such as Status.im, Raiden, IPFS and Swarm
- Includes an APT repository for upgrading Ethereum packages by running apt-get install command (e.g. sudo apt-get install geth)

# Software installed

- Geth: 1.9.7 (official binary)
- Parity: 2.5.10 (cross compiled)
- Swarm: 0.5.2 (official binary)
- Raiden Network: 0.200.0~rc1 (official binary)
- IPFS: 0.4.22 (official binary)
- Status.im: 0.34.0~beta3 (cross compiled)
- Vipnode: 2.3 (official binary)

# What you need

- Raspberry Pi 4 model B (4GB)
- Micro SD Card
- SSD disk with USB 3.0 (See USB SSD disk section)
- Power Supply
- Ethernet cable
- (Optional but strongly recommended) Case with a heatsink and a fan.
- (Optional but strongly recommended) 30303 Port forwarding
- (Optional) USB keyboard, Monitor and HDMI cable (micro-HDMI)

# USB SSD disk

There are 2 options for the SSD storage:

Use a USB portable SSD disk such as the Samsung T5 Portable SSD

Use a USB 3.0 External Hard Drive Case with a SSD Disk. In my case I used a Inateck 2.5 Hard Drive Enclosure FE2011 [8] with a Kingston SSD A400 (480 GB) [9]. Be sure to buy a case with an UAS compliant chip, particularly, one of these: JMicron (JMS567 or JMS578) or ASMedia (ASM1153E)

Keep in mind that you need to plug the disk to a USB 3.0 port (blue)

# Install instructions for Linux

## Gui install 

Update. If you are not comfortable with command line take a look at Etcher:

https://etcher.io

## Command line install

Insert the MicroSD in your SD adapter and plug it into your computer. It is recommended to umount partitions in case that you have a preformated card.

1. Download the EthRaspbian image (you can choose from Geth or Parity images):

https://ethraspbian.com/downloads/image_2019-10-26-EthRaspbian2.0-lite.zip

2. Unzip it (for instance):

`unzip image_2019-10-26-EthRaspbian2.0-lite.zip`

3. Check your MicroSD device name running:

`sudo fdisk -l`

You should see a device named `mmcblk0` or `sdd` (that matchs with the size of your card. This is a dangerous operation, be careful). For further info please visit:

https://www.raspberrypi.org/documentation/installation/installing-images/linux.md

4. Flash the MicroSD (mmcblk0 device and geth edition example):

`sudo dd bs=1M  if=2019-10-26-EthRaspbian2.0-lite of=/dev/mmcblk0 conv=fdatasync status=progress`

5. Extract the MicroSD card

You are done. Insert the MicroSD in your Raspberry and power it on. Login details (Raspbian defaults):
```
User: ethereum
Password: ethereum
```
For security reasons, you will be prompted to change the password on first login.

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
