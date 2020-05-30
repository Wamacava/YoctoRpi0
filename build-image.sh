#!/bin/bash

function updateNetworkCredentials() {
  TIMEOUT=5

  read -t $TIMEOUT -p "Do you want to update network credentials in the image? (Y/N)"
 
  case $REPLY in
  [yY]*)
    doUpdateNetworkCredentials
    ;;
  *) echo "Skipping credentials update"
     ;;
  esac
}

function doUpdateNetworkCredentials() {
  read -p "Type network SSID, hit enter and type your password: "
  wpa_passphrase "$REPLY" > wpa_supplicant-nl80211-wlan0.conf
  #Delete commented password for security reasons
  sed -i '/#/d' ./wpa_supplicant-nl80211-wlan0.conf
  #Move credentials file to the network recipe
  mv ./wpa_supplicant-nl80211-wlan0.conf yocto/meta-custom-layer/recipes-connectivity/wpa-supplicant/files/
}

function initRepo() {
  #if this project is ran for the first time yocto and BSP must be cloned
  if [ ! -d "yocto" ]
  then
    ./init-project.sh
  fi
}

function buildImage {
  source yocto/poky/oe-init-build-env build/rpi0/
  bitbake core-image-base
}

initRepo

updateNetworkCredentials

buildImage

