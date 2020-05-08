This project aims to help getting started with yocto build for raspberry pi zero.

This README is a main documentation of all steps to make it working.

1) Clone this repo in convinient, empty direcoty. Cd to this directory

$ cd ~ && git clone https://github.com/Wamacava/YoctoRpi0.git
$ cd YoctoRpi0

2) in your main project folder run 
   $ ./build-image.sh


3) The last operation will take few hours on the firt time. Next builds will be faster bacuase only changes will be compiled

To create SD card:
1) cd to your main project directory
2)check your SD card drive name with 
   $ lsblk

3) Run:
   $./make-sdcard.sh DRIVENAME(e.g.sdb)

4) eject SD card and insert it to your pi. Username: root with no password.
   To connect with ssh you need to follow enable wifi steps first. 
   Otherwise you can connect with USB-TTL cable and have fun. All of this will be described soon
5) To check that image is working you can connect led to PIN27. There is custom layer with  C++ program which blinks this led. This program and the way of merging it into linux image and systemd will be described soon.

Enable wi-fi
*) Coming soon

Create new layer with your python or C++ (CMake app)
*) Coming soon

Brief description of local.conf and other aspects you should know about yocto
*) Coming soon


