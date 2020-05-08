#!/bin/bash


#if this project is ran for the first time yocto and BSP must be cloned
if [ ! -d "yocto" ]
then
    ./init-project.sh
fi

source yocto/poky/oe-init-build-env build/rpi0/
bitbake core-image-base
