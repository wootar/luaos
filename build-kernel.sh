#!/bin/sh
echo "Preparing to build the kernel"
sudo apt update || echo Cannot install elf
sudo apt install -y libelf-dev || true

mkdir -v workdir || echo "Was made"
cd workdir
git clone https://github.com/torvalds/linux linux
cp ../kconfig linux/.config
cd linux
make -j2 olddefconfig
make -j2 bzImage
cp arch/x86/boot/bzImage ../vmlinuz.gz
cd ..
