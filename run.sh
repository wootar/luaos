#!/bin/sh

cd workdir
echo "Now starting!"
qemu-system-x86_64 -kernel vmlinuz.gz -initrd out.cpio.gz -vga none -append "console=ttyS0 loglevel=3" -monitor none -parallel none -display sdl || qemu-system-x86_64 -kernel vmlinuz -initrd out.cpio.gz -vga none -append "console=ttyS0 loglevel=3" -monitor none -parallel none || echo "Please build the kernel and the rootfs"
exit 0