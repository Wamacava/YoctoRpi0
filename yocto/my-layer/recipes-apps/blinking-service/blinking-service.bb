SUMMARY = "blinking-service recipe"
DESCRIPTION = "Recipe of example cmake application which blinks LED connected to GPIO27"
LICENSE = "CLOSED"

SRC_URI = "\
    file://blinking.service \
    git://github.com/Wamacava/blinkingLedRpi0;protocol=https;branch=master;user=lukasz\
"

# SRCREV = "926cf79086392cbfa4d27b79f1da51c970c472d5"
SRCREV = "${AUTOREV}"
# PV = "1.0+git${SRCPV}"


#define source code path where the CMakeList.txt is
S = "${WORKDIR}/git/"


# thanks to inheriting cmake bbclass in this recipe, cmake will take care of 
# all configure, compile and install functionalities
inherit cmake systemd


# The cmake bbclass allows for recipes that need to 
# build software using the CMake build system. 
# You can use the EXTRA_OECMAKE variable to specify additional 
# configuration options to be passed on the cmake command line.
EXTRA_OECMAKE = ""


#not necesary, bitbake will run it by default
do_install() {
    install -d "${D}${bindir}"
    install -m 0755 ${WORKDIR}/build/blinkLed "${D}${bindir}"
}

REQUIRED_DISTRO_FEATURES = "systemd"

do_install_append() {
  install -d ${D}/etc/systemd/system/
  install -m 0644 ${WORKDIR}/blinking.service ${D}/etc/systemd/system/
}

#equivalent of systemctl enable blinking.service
SYSTEMD_SERVICE_${PN} = " \ 
    blinking.service "

