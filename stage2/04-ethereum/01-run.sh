#!/bin/bash -e

install -m 755 files/geth_1.8.23-0_armhf.deb                ${ROOTFS_DIR}/root/

on_chroot sh -e - <<EOF
dpkg -i /root/geth_1.8.23-0_armhf.deb
rm -f /root/geth_1.8.23-0_armhf.deb
EOF

