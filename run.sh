#!/bin/sh

cd workdir
echo "Downloading the tiny core linux kernel"
wget -nc -O vmlinuz http://tinycorelinux.net/13.x/x86_64/release/distribution_files/vmlinuz64
echo "Now starting!"
qemu-system-x86_64 -kernel vmlinuz -initrd out.cpio.gz -vga none -append "console=ttyS0 loglevel=3" -monitor none -parallel none -display sdl || qemu-system-x86_64 -kernel vmlinuz -initrd out.cpio.gz -vga none -append "console=ttyS0 loglevel=3" -monitor none -parallel none 
exit 0