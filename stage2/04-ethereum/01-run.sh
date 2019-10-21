#!/bin/bash -e

install -m 644 files/ethonarm.list			    ${ROOTFS_DIR}/etc/apt/sources.list.d/ 
install -m 755 files/init_resize.sh			    ${ROOTFS_DIR}/usr/lib/raspi-config	
install -m 644 files/dphys-swapfile			    ${ROOTFS_DIR}/etc/
cat <<EOF >> ${ROOTFS_DIR}/etc/bash.bashrc
alias update-ethereum='
sudo apt-get update
sudo apt-get install geth swarm ipfs parity raiden status.im-node vipnode'
EOF

on_chroot <<EOF
# Add EthRaspbian APT key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8A584409D327B0A5
# Install Ethereum packages
apt-get update && apt-get install geth
apt-get install swarm parity ipfs raiden status.im-node vipnode
# Force password change on Ethereum account
#chage -d 0 ethereum
EOF

