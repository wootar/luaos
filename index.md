
A pointless yet toy/commodore 64 style os

What ever you do with this, just please don't use it for production because it's buggy 

Usage:

Download the initrd and the kernel from https://github.com/wooter6928196219911/luaos/actions

Once done, you may run it with `qemu-system-x86_64 -kernel vmlinuz.gz -initrd out.cpio.gz` and have fun!

How to compile:

First we need to get the source via git: `git clone https://github.com/wooter6928196219911/luaos.git`

Then install GCC, libelf-dev if your on ubuntu or debian

Once done, cd into the repo and run `make` then `make kernel`