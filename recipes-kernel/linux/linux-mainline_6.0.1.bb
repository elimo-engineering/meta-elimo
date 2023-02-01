FILESEXTRAPATHS:prepend:elimo-initium := "${THISDIR}/${PN}:"

require recipes-kernel/linux/linux-mainline.inc

DESCRIPTION = "Mainline Linux kernel 6.0.1 with Elimo Initium patches"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI[sha256sum] = "8ede745a69351ea0f27fe0c48780d4efa37ff086135e129358ce09694957e8f9"

# override the SRC_URI from linux-mainline.inc, it assumes the kernel is in the v5.x series
SRC_URI = "https://www.kernel.org/pub/linux/kernel/v6.x/linux-${PV}.tar.xz"

SRC_URI:append:elimo-initium = " \
    file://elimo-initium-defconfig \
    file://0001-ARM-dts-sun8i-s3-impetus-AP6255-support.patch \
    file://0002-support-ntw-simple-panel-lcd.patch \
    file://0003-sram-video-engine.patch \
    file://0004-sram-video-engine-devicetree.patch \
    file://0005-v3s-lcd-pins.patch \
    file://0006-elimo-initium-enable-audio-codec.patch \
    file://0007-v3s-pwm-pins.patch \
    file://0008-support-elimo-initium-video-lcd-backlight.patch \
    file://0009-support-v3s-ehci-ohci-usb.patch \
    file://0010-elimo-initium-use-ehci-ohci.patch \
    file://0011-hacky-fix-for-AP6255-PLL-bringup.patch \
    "
