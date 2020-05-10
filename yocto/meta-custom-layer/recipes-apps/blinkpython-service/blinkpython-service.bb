SUMMARY = "blinking-service recipe"
DESCRIPTION = "Recipe of example cmake application which blinks LED connected to GPIO27"
LICENSE = "CLOSED"

SRC_URI = "\
    file://blinkpython.service \
    file://blinkpython.py \
"

SRCREV = "${AUTOREV}"
# PV = "1.0+git${SRCPV}"

RDEPENDS_${PN} += " \
                   python3 \
                  "

inherit systemd

#define source code path where the CMakeList.txt is
S = "${WORKDIR}/"


#not necesary, bitbake will run it by default
do_install() {
    install -d "${D}/etc/python"
    install -m 0755 ${WORKDIR}/blinkpython.py "${D}${sysconfdir}/python/"
}

REQUIRED_DISTRO_FEATURES = "systemd"

do_install_append() {
  install -d ${D}${systemd_system_unitdir}
  install -m 0644 ${WORKDIR}/blinkpython.service ${D}${systemd_system_unitdir}
}

#equivalent of systemctl enable blinkpython.service
SYSTEMD_SERVICE_${PN} = " \ 
    blinkpython.service "

