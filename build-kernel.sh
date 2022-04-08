#!/bin/sh
echo "Preparing to build the kernel"
sudo apt update || echo Not a debian distro falling back to pacman; sudo pacman -Sy base-devel libelf || echo Will not install needed deps
sudo apt install -y libelf-dev bison bc flex gcc || true

mkdir -v workdir || echo "Was made"
cd workdir
wget -O - https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.15.32.tar.xz | xz -d | tar x
mv linux-5.15.32 linux
cp ../kconfig linux/.config
cd linux
make -j$(nproc) olddefconfig
make -j$(nproc) bzImage
cp arch/x86/boot/bzImage ../vmlinuz.gz
cd ..
