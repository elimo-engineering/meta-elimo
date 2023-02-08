# The brcmfmac driver looks for NVRAM files using the first entry in board
# compatible since kernel >= 5.0:
# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ad4b55b2f29784f93875e6231bf57cd233624a2
#
FILESEXTRAPATHS:prepend:elimo-initium := "${THISDIR}/files:"
SRC_URI += " \
    file://brcmfmac43455-sdio-elimo-initium.txt \
    file://brcmfmac43456-sdio.bin \
    file://brcmfmac43456-sdio.clm_blob \
    file://brcmfmac43456-sdio-elimo-initium.txt \
"

# add the NVRAM config for the *455
FILES:${PN}-bcm43455:append = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio-elimo-initium.txt"
# add a whole new firmware package for the *456
PACKAGES:append = " ${PN}-bcm43456 "
FILES:${PN}-bcm43456 = "${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.*"
LICENSE:${PN}-bcm43456 = "Firmware-broadcom_bcm43xx"
RDEPENDS:${PN}-bcm43456 += "${PN}-broadcom-license"


do_install:append() {
    install -m 0644 ${WORKDIR}/brcmfmac4345?-sdio* ${D}${nonarch_base_libdir}/firmware/brcm/
	ln -sf -r ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.elimo,initium.bin
	ln -sf -r ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio-elimo-initium.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43455-sdio.elimo,initium.txt
	ln -sf -r ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.bin ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.elimo,initium.bin
	ln -sf -r ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio-elimo-initium.txt ${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43456-sdio.elimo,initium.txt
}
