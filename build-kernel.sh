#!/bin/sh
echo "Preparing to build the kernel"
sudo apt update || echo Cannot install elf
sudo apt install -y libelf-dev || true

mkdir -v workdir || echo "Was made"
cd workdir
wget -O linux.tar.gz https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.32.tar.xz
tar xvf linux.tar.gz
mv linux-5.15.32 linux
cp ../kconfig linux/.config
cd linux
make -j$(nproc) olddefconfig
make -j$(nproc) bzImage
cp arch/x86/boot/bzImage ../vmlinuz.gz
cd ..
