#!/bin/bash -e

install -m 755 files/parity-rasp_1.3.0-0_armhf.deb		${ROOTFS_DIR}/root/

on_chroot sh -e - <<EOF
dpkg -i /root/parity-rasp_1.3.0-0_armhf.deb
rm -f /root/parity-rasp_1.3.0-0_armhf.deb
EOF
