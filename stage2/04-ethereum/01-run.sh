#!/bin/bash -e

install -m 755 files/libssl1.1_1.1.0d-2_armhf.deb		${ROOTFS_DIR}/root/
install -m 755 files/parity-rasp_1.5.2-0_armhf.deb		${ROOTFS_DIR}/root/
install -m 755 files/geth-rasp_1.5.9-0_armhf.deb                ${ROOTFS_DIR}/root/
install -m 755 files/ipfs_0.4.5-0_armhf.deb			${ROOTFS_DIR}/root/
install -m 755 files/20auto-upgrades				${ROOTFS_DIR}/etc/apt/apt.conf.d/
install -m 644 files/10apt					${ROOTFS_DIR}/etc/apt/apt.conf.d/

on_chroot sh -e - <<EOF
dpkg -i /root/libssl1.1_1.1.0d-2_armhf.deb
rm -f /root/libssl1.1_1.1.0d-2_armhf.deb
dpkg -i /root/ipfs_0.4.5-0_armhf.deb
rm -f /root/ipfs_0.4.5-0_armhf.deb
dpkg -i /root/geth-rasp_1.5.9-0_armhf.deb
rm -f /root/geth-rasp_1.5.9-0_armhf.deb
dpkg -i /root/parity-rasp_1.5.2-0_armhf.deb
rm -f /root/parity-rasp_1.5.2-0_armhf.deb
EOF

