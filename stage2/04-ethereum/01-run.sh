#!/bin/bash -e

install -m 755 files/geth_1.8.23-0_armhf.deb                ${ROOTFS_DIR}/root/
install -m 755 files/raiden_0.100.2-0_armhf.deb		    ${ROOTFS_DIR}/root/
install -m 755 files/parity_2.3.5-0_armhf.deb		    ${ROOTFS_DIR}/root/
install -m 755 files/status.im-node-0.23.0-beta8_armhf.deb  ${ROOTFS_DIR}/root/
install -m 755 files/ipfs_0.4.19-0_armhf.deb		    ${ROOTFS_DIR}/root/
install -m 755 files/update-ethereum			    ${ROOTFS_DIR}/usr/local/bin

on_chroot <<EOF
dpkg -i /root/geth_1.8.23-0_armhf.deb
rm -f /root/geth_1.8.23-0_armhf.deb
dpkg -i /root/parity_2.3.5-0_armhf.deb
rm -f /root/parity_2.3.5-0_armhf.deb
dpkg -i /root/raiden_0.100.2-0_armhf.deb
rm -f /root/raiden_0.100.2-0_armhf.deb
dpkg -i /root/status.im-node-0.23.0-beta8_armhf.deb
rm -f /root/status.im-node-0.23.0-beta8_armhf.deb
dpkg -i /root/ipfs_0.4.19-0_armhf.deb
rm -f /root/ipfs_0.4.19-0_armhf.deb
EOF

