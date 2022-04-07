#!/bin/sh
LUAURL="https://www.lua.org/ftp/lua-5.4.4.tar.gz"
mkdir workdir
cd workdir
echo "=== Stage 0, Preparing ==="
mkdir -v rootfs
mkdir -vp rootfs/bin
mkdir -vp rootfs/dev
mkdir -vp rootfs/etc
mkdir -vp rootfs/lib
mkdir -vp rootfs/proc
mkdir -vp rootfs/sbin
mkdir -vp rootfs/sys
mkdir -vp rootfs/usr
mkdir -vp rootfs/usr/local/share/lua/5.4
mkdir -vp rootfs/etc/init.d
cp ../InitLuas/1.lua rootfs/etc/init.d/1
cp ../BusyCat/busycat.lib rootfs/usr/local/share/lua/5.4/busycat.lua
cp ../BusyCat/main.lua rootfs/bin/busycat
cp ../InitLuas/initwrapper rootfs/init
echo "=== Stage 0, done ==="

echo "=== Stage 1, Building lua ==="
wget -nc -O lua.tar.gz $LUAURL
tar zxf lua.tar.gz
mv "lua-5.4.4" "lua"
cd lua
echo "Applying patches"
cp src/Makefile src/Makefile.org
cat src/Makefile.org | sed "s/MYCFLAGS=/MYCFLAGS=-static/g" | sed "s/MYLDFLAGS=/MYLDFLAGS=-static/g" | sed "s/CMCFLAGS=/CMCFLAGS=-static/g" > src/Makefile
echo "Now making!"
make -j$(nproc)
echo "Done, now copying the binary to the rootfs"
sleep 1
cp src/lua ../rootfs/bin/lua
cd ..
echo "=== Stage 1, done ==="

echo "=== Stage 2, compressing to a initrd."
# Copied from the gentoo wiki
cd rootfs
find . -print0 | cpio --null --create --format=newc | gzip --best > ../out.cpio.gz
cd ..
echo "=== Stage 2, done ==="
echo "You may now build the kernel"
