#!/bin/sh
LUAURL="https://www.lua.org/ftp/lua-5.4.4.tar.gz"
mkdir workdir
cd workdir
echo "=== Stage 0, Preparing ==="
mkdir -v rootfs
mkdir -v rootfs/{bin,dev,etc,lib,proc,sbin,sys,usr/local/share/lua/5.4,etc/init.d}
cp ../InitLuas/1.lua rootfs/etc/init.d/1
cp ../BusyCat/busycat.lib rootfs/usr/share/lua/5.4/busycat.lua
cp ../BusyCat/main.lua rootfs/bin/lua
cp ../InitLuas/initwrapper rootfs/init
echo "=== Stage 0, done ==="

echo "=== Stage 1, Building lua ==="
wget -O lua.tar.gz $LUAURL
mv "lua-5.4.4" "lua"
cd lua
echo "Applying patches"
cat src/Makefile | sed "s/MYCFLAGS=/MYCFLAGS=-static/g" | sed "s/MYLDFLAGS=/MYLDFLAGS=-static/g" | sed "s/CMCFLAGS=/CMCFLAGS=-static/g" > src/Makefile
echo "Now making!"
make -j$(nproc)
echo "Done, now copying the binary to the rootfs"
cp src/lua ../rootfs/bin/lua
cd ..
echo "=== Stage 1, done ==="

echo "=== Stage 2, compressing to a initrd."
# Copied from the gentoo wiki
cd rootfs
find . -print0 | cpio --null --create --format=newc | gzip --best > ../out.cpio.gz
cd ..
echo "=== Stage 2, done ==="
echo "You may now use the initrd with any kernel you wish."