#!/bin/sh

cd workdir
echo "Downloading the tiny core linux kernel"
wget -nc -O vmlinuz http://tinycorelinux.net/13.x/x86_64/release/distribution_files/vmlinuz64
echo "Now starting!"
qemu-system-x86_64 -kernel vmlinuz -initrd out.cpio.gz
exit 0