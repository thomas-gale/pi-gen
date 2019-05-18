#!/bin/bash -e

install -m 644 files/ethonarm.list			    ${ROOTFS_DIR}/etc/apt/sources.list.d/ 
cat <<EOF >> ${ROOTFS_DIR}/etc/bash.bashrc
alias update-ethereum='
sudo apt-get update
sudo apt-get install geth ipfs parity raiden status.im-node'
EOF

on_chroot <<EOF
# Add EthRaspbian APT key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8A584409D327B0A5
# Install Ethereum packages
apt-get update && apt-get install geth parity ipfs raiden status.im-node
# Force password change on Ethereum account
chage -d 0 ethereum
EOF

