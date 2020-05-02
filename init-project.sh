#!/bin/bash

#This script downloads sources necessary to build linux image for raspberry pi

mkdir sstate tmp build downloads yocto

cd yocto/

git clone -b zeus git://git.yoctoproject.org/poky.git

git clone -b zeus git://git.openembedded.org/meta-openembedded

git clone -b zeus git://git.yoctoproject.org/meta-raspberrypi
