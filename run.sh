#!/bin/sh

cd workdir
echo "Now starting!"
qemu-system-x86_64 -kernel vmlinuz.gz -initrd out.cpio.gz -append "vga=784 loglevel=3" -monitor none -parallel none -display sdl -serial none || qemu-system-x86_64 -kernel vmlinuz -initrd out.cpio.gz -vga none -append "vga=784 loglevel=3" -monitor none -parallel none -serial none || echo "Please build the kernel and the rootfs"
exit 0