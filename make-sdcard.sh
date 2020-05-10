#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Pass your sd card drive as an argument."
    echo "Example call: $0 sdb" 
    exit
fi

DRIVE="$1"

umount /dev/$DRIVE*

echo -e "\033[33;7;5mWritting the image\033[0m"

dd if=build/rpi0/tmp/deploy/images/raspberrypi0-wifi/core-image-base-raspberrypi0-wifi.rpi-sdimg of=/dev/$DRIVE bs=1M

if [ "$?" -ne 0 ]
then
    echo -e "\nWritting to the specified drive failed"
    echo "Try to run script with sudo or make sure you pass correct drive name"
    echo -e "You can check drive name with lsblk command \n"
fi
umount /dev/$DRIVE*

