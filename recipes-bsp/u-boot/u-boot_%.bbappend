FILESEXTRAPATHS:prepend:elimo-initium := "${THISDIR}/files:"

SRC_URI:append:elimo-initium = " \
    file://0010-Initial-support-for-Elimo-Impetus.patch \
    file://0020-sun8i-emac-sun8i-v3s-compatibility-for-sun8i-emac.patch "
