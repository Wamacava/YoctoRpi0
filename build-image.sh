#!/bin/bash

source yocto/poky/oe-init-build-env build/rpi0/
bitbake core-image-base
