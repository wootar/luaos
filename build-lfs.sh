#!/bin/sh
cd workdir || false
git clone https://github.com/keplerproject/luafilesystem.git lfs
cd lfs
cp ../../lfs-config ./config
make -j$(nproc)
cp src/lfs.so ../rootfs/usr/local/share/lua/5.4
echo "Done!"
cd ..
