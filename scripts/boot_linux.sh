#!/bin/bash

cd "${0%/*}"

cd ../bootloader/shofel2/exploit
./shofel2.py cbfs.bin ../../coreboot/build/coreboot.rom

cd ../usb_loader
../../u-boot/tools/mkimage -A arm64 -T script -C none -n "boot.scr" -d switch.scr switch.scr.img
sudo ../../imx_usb_loader/imx_usb -c .
