#!/bin/bash -e

install -m 644 files/ethonarm.list			    ${ROOTFS_DIR}/etc/apt/sources.list.d/ 
install -m 755 files/init_resize.sh			    ${ROOTFS_DIR}/usr/lib/raspi-config	
install -m 644 files/dphys-swapfile			    ${ROOTFS_DIR}/etc/
install -m 644 files/zram-default/armbian-zram-config	    ${ROOTFS_DIR}/etc/default
install -D -m 755 files/zram-lib/armbian-zram-config	    ${ROOTFS_DIR}/usr/lib/armbian/armbian-zram-config
install -m 644 files/armbian-ramlog			    ${ROOTFS_DIR}/etc/default
install -m 644 files/armbian-zram-config.service	    ${ROOTFS_DIR}/etc/systemd/system/

cat <<EOF >> ${ROOTFS_DIR}/etc/bash.bashrc
alias update-ethereum='
sudo apt-get update
sudo apt-get install geth nethermind swarm ipfs parity raiden status.im-node vipnode'
EOF

on_chroot <<EOF
# Add EthRaspbian APT key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8A584409D327B0A5
# Install Ethereum packages
apt-get update && apt-get install geth
apt-get install swarm parity nethermind ipfs raiden status.im-node vipnode
# Force password change on Ethereum account
#chage -d 0 ethereum
# enable zram-service
systemctl enable armbian-zram-config
EOF

