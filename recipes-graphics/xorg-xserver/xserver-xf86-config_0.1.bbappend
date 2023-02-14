FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://50-ts-transformation.conf"
FILES:${PN} = "/usr/share/X11/xorg.conf.d/50-ts-transformation.conf"

do_install:append() {
    mkdir -p ${D}/usr/share/X11/xorg.conf.d/
    install -m 644 ${WORKDIR}/50-ts-transformation.conf ${D}/usr/share/X11/xorg.conf.d/
}
