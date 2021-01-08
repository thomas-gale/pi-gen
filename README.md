Ethereum on ARM for Raspberry Pi 4 is a custom Linux image for the device that runs Ethereum clients as a boot service and automatically turns the Raspberry Pi 4 into a full Ethereum 1.0 node or a Ethereum 2.0 node. The image includes other components of the Ethereum ecosystem such as Status.im, Raiden, IPFS, Swarm and Vipnode.

# Source build modification for Geth and Prysm (and as many other binaries as possible...)
- Planning on making this pi-gen build fully build all geth and prysm code from source on device.

**TL;DR:** **Flash your Raspberry Pi 4, plug in an ethernet cable, connect the SSD disk and power up the device to turn the Raspberry Pi 4 into a full Ethereum 1.0 node or an Ethereum 2.0 node (beacon chain / validator)**

Some background first. As you know, we’ve been running into some memory issues \[1\] with the Raspberry Pi 4 image as Raspbian OS is still on 32bits \[2\] (at least the userland). While we prefer to stick with the official OS we came to the conclusion that, in order to solve these issues, we need to migrate to a native 64 bits OS

Besides, Eth 2.0 clients don’t support 32 bits binaries so using Raspbian would exclude the Raspberry Pi 4 from running an Eth 2.0 node (and the possibility of staking).

So, after several tests we are now releasing 2 different images based on Ubuntu 20.04 64bit \[3\]: Eth 1.0 and Eth 2.0 editions.

Basically, both are the same image and include the same features of the Raspbian based images. But they are setup for running Eth 1.0 or Eth 2.0 software by default

**Images take care of all the necessary steps**, from setting up the environment and formatting the SSD disk to installing and running the Ethereum software as well as starting the blockchain synchronization.

# Main features

* Based on Ubuntu 20.04 64bit
* Automatic USB disk partitioning and formatting
* Adds swap memory (ZRAM kernel module + a swap file) based on Armbian work \[7\]
* Changes the hostname to something like “ethnode-e2a3e6fe” based on MAC hash
* Runs software as a systemd service and starts syncing the Blockchain
* Includes an APT repository for installing and upgrading Ethereum software
* Includes a monitoring dashboard based on Grafana / Prometheus

# Software included

Both images include the same packages, the only difference between them is that Eth 1.0 runs Geth by default and Eth 2.0 runs Prysm beacon chain by default.

**Ethereum 1.0 clients**

* Geth \[8\]: 1.9.13 (official binary)
* Parity \[9\]: 2.7.2 (cross compiled)
* Nethermind \[10\]: 1.8.28 (cross compiled)
* Hyperledger Besu \[11\]: 1.4.4 (compiled)

**Ethereum 2.0 clients**

* Prysm \[12\]: 1.0.0-alpha6 (official binary)
* Lighthouse \[13\]: 0.1.1 (compiled)

**Ethereum framework**

* Swarm \[14\]: 0.5.7 (official binary)
* Raiden Network \[15\]: 0.200.0\~rc1 (official binary)
* IPFS \[16\]: 0.5.0 (official binary)
* Statusd \[17\]: 0.52.3 (compiled)
* Vipnode \[18\]: 2.3.3 (official binary)

# INSTALLATION GUIDE AND USAGE

# Recommended hardware and setup

* Raspberry 4 (model B) - 4GB
* MicroSD Card (16 GB Class 10 minimun)
* SSD USB 3.0 disk (see storage section)
* Power supply
* Ethernet cable
* 30303 Port forwarding (Eth 1.0) and 13000 port forwarding (Eth 2.0) \[4\]
* A case with heatsink and fan (Optional but strongly recommended)
* USB keyboard, Monitor and HDMI cable (micro-HDMI) (Optional)

# Storage

You will need and SSD to run the Ethereum clients (without an SSD drive there’s absolutely no chance of syncing the Ethereum blockchain). There are 2 options:

* Use a USB portable SSD disk such as the Samsung T5 Portable SSD.
* Use a USB 3.0 External Hard Drive Case with a SSD Disk. In our case we used a Inateck 2.5 Hard Drive Enclosure FE2011. Make sure to buy a case with an UAS compliant chip, particularly, one of these: JMicron (JMS567 or JMS578) or ASMedia (ASM1153E).

In both cases, avoid getting low quality SSD disks as it is a key component of you node and it can drastically affect the performance (and sync times)

Keep in mind that you need to plug the disk to an USB 3.0 port (blue)

# Image download & installation

**1.- Download Eth 1.0 or Eth 2.0 images:**

[ubuntu-20.04-preinstalled-server-arm64+raspi-eth1.img.zip](https://ethraspbian.com/downloads/ubuntu-20.04-preinstalled-server-arm64+raspi-eth1.img.zip)

sha256 7fa9370d13857dd6abcc8fde637c7a9a7e3a66b307d5c28b0c0d29a09c73c55c 

[ubuntu-20.04-preinstalled-server-arm64+raspi-eth2.img.zip](https://ethraspbian.com/downloads/ubuntu-20.04-preinstalled-server-arm64+raspi-eth2.img.zip)

sha256 74c0c15b708720e5ae5cac324f1afded6316537fb17166109326755232cd316e

**2.- Flash the image**

Insert the microSD in your Desktop / Laptop and download the file (Eth 1.0, for instance):

    wget https://ethraspbian.com/downloads/ubuntu-20.04-preinstalled-server-arm64+raspi-eth1.img.zip

Note: If you are not comfortable with command line or if you are running Windows, you can use Etcher ([https://etcher.io](https://etcher.io/))

Open a terminal and check your MicroSD device name running:

    sudo fdisk -l

You should see a device named mmcblk0 or sdd. Unzip and flash the image:

    unzip https://ethraspbian.com/downloads/ubuntu-20.04-preinstalled-server-arm64+raspi-eth1.img.zip
    sudo dd bs=1M if=ubuntu-20.04-preinstalled-server-arm64+raspi-eth1.img of=/dev/mmcblk0 && sync

**3.- Insert de MicroSD into the Raspberry Pi 4. Connect an Ethernet cable and attach the USB SSD disk** (make sure you are using a blue port).

**4.- Power on the device**

The Ubuntu OS will boot up in less than one minute but **you will need to wait approximately 10 minutes** in order to allow the script to perform the necessary tasks to turn the device into an Ethereum node and reboot the Raspberry.

Depending on the image, you will be running:

* Eth 1.0: Geth as the default client syncing the blockchain
* Eth 2.0: Prysm as default client syncing the beacon chain (Topaz testnet)

**5.- Log in**

You can log in through SSH or using the console (if you have a monitor and keyboard attached)

    User: ethereum
    Password: ethereum

You will be prompted to change the password on first login, so you will need to login twice.

**6.- Open 30303 port for Geth and 13000 if you are running Prysm beacon chain.** If you don’t know how to do this, google “port forwarding” followed by your router model.

**7.- Getting console output**

You can see what’s happening in the background by typing:

    sudo tail -f /var/log/syslog

Congratulations. You are now running a full Ethereum node on your Raspberry Pi 4.

# Syncing the Blockchain

Now you need to wait for the blockchain to be synced. In the case of Eth 1.0 This will take a few days depending on several factors but you can expect up to about 5-7 days.

If you are running the Eth 2.0 Topaz tesnet you can expect 1-2 days of Beacon chain synchronization time. Remember that you will need to setup the validator later in order to start the staking process (see “How to run the Eth 2.0 validator” section below).

# Monitoring dashboards

For this first release, we included 3 monitoring dashboards based on Prometheus \[5\] / Grafana \[6\] in order to monitor the node and clients’ data (Geth and Besu). You can access through your web browser:

    URL: http://your_raspberrypi_IP:3000
    User: admin
    Password: ethereum

# Switching clients

All clients run as a systemd service. This is important because in case of some problem arises the system will respawn the process automatically.

Geth and Prysm beacon chain run by default (depending on what you are synchronizing, Eth 1.0 or Eth 2.0) so, if you want to switch to other clients (from Geth to Nethermind, for instance), you need to stop and disable Geth first, and enable and start the other client:

    sudo systemctl stop geth && sudo systemctl disable geth

Commands to enable and start each Eth 1.0 client:

    sudo systemctl enable besu && sudo systemctl start besu
    sudo systemctl enable nethermind && sudo systemctl start nethermind
    sudo systemctl enable parity && sudo systemctl start parity

Eth 2.0:

    sudo systemctl stop prysm-beacon && sudo systemctl disable prysm-beacon
    sudo systemctl start lighthouse-beacon && sudo systemctl enable lighthouse-beacon

# Changing parameters

Clients’ config files are located in the /etc/ethereum/ directory. You can edit these files and restart the systemd service in order for the changes to take effect. The only exception is Nethermind which, additionally, has a mainnet config file located here:

    /etc/nethermind/configs/mainnet.cfg

Blockchain clients’ data is stored on the ethereum home account as follows (note the dot before the directory name):

Eth 1.0

    /home/ethereum/.geth
    /home/ethereum/.parity
    /home/ethereum/.besu
    /home/ethereum/.nethermind

Eth2.0

    /home/ethereum/.eth2
    /home/ethereum/.eth2validators
    /home/ethereum/.lighthouse
    Hyperledger Besu and Nethermind

# Nethermind and Hyperledger Besu

These 2 great Eth 1.0 clients have become a great alternative to Geth and Parity. The more diversity in the network, the better, so you may give them a try and contribute to the network health.

Both need further testing so feel free to play with them and report back your feedback.

# How to run the Eth 2.0 validator (staking)

Once the Topaz testnet beacon chain is synchronized you can run a validator in the same device. You will need to follow the steps described here:

[https://prylabs.net/participate](https://prylabs.net/participate)

The first time, you need to create manually an account by running the “validator” binary and setup a password. Once you completed this step you can add the password to /etc/ethereum/prysm-validator.conf and start the validator as a systemd service

# Feeback appreciated

We put a lot of work trying to setup the Raspberry Pi 4 as a full Ethereum node as we know the massive user base of this device may have a very positive impact in the network.

Please, take into account that this is the first image based on Ubuntu 20.04 so there may be some bugs. If so, open an issue on Github or reach us on twitter ([https://twitter.com/EthereumOnARM](https://twitter.com/EthereumOnARM)).
