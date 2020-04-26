This project aims to help getting started with yocto build for raspberry pi zero.

This README is a main documentation of all steps to make it working.

1) Clone the repo in convinient, empty direcoty.

*) $ mkdir sstate tmp build downloads yocto

*) $ cd yocto 

*) follow intstuctions in README.txt in that folder (cloning yocto repos)

*) in your main project folder run $ source yocto/poky/oe-init-build-env build/rpi0/

*) run $ bitbake core-image-base

*) The last operation will take few hours on the firt time. Next builds will be faster bacuase only changes will be compiled



To create SD card:
1) cd to /projDir/build/rpi0 (you should be there after build finishes)
*)check your SD card drive name with $ lsblk

*) $ sudo umount /dev/sdX*     <- sdX here is SD card name
*) $ sudo dd if=tmp/deploy/images/raspberrypi3-64/core-image-base-raspberrypi3-64.rpi-sdimg of=/dev/sdb bs=1M
*) $ sudo umount /dev/sdX*

*) eject SD card and insert it to your pi. Username: root with no password.
   To connect with ssh you need to follow enable wifi steps first. 
   Otherwise you can connect with USB-TTL cable and have fun. All of this will be described soon
*) To check that image is working you can connect led to PIN27. There is custom layer with  C++ program which blinks this led. This program and the way of merging it into linux image and systemd will be described soon.

Enable wi-fi
*) It will be described soon

Create new layer with your python or C++ (CMake app)
*) Coming soon

Brief description of local.conf and other aspects you should know abour yocto
*) Coming soon
