# meta-elimo

Elimo Initium EVK BSP Layer for OpenEmbedded/Yocto.

## Description

This is the hardware specific BSP overlay for the Initium EVK and, more generally, Elimo Impetus based devices; it provides hardware support to build a complete image, but is not sufficient by itself to get a final image by. 

This layer can be used:

- as a template to create your own BSP layer for your custom board based on the Elimo Impetus SoM
- as a BSP layer for the Initium EVK, as part of a build that also brings in a distro layer, e.g.
	+ the official Elimo [meta-elimo-distro](https://github.com/elimo-engineering/meta-elimo-distro) distro layer
	+ the `poky` reference image by the Yocto project 
	+ your own custom distro layer

:warning: TL;DR: if you just want to build an image to get started with your Initium, these are not the droids you're looking for. What you need is [elimo-yocto-manifest](https://github.com/elimo-engineering/elimo-yocto-manifest). :warning:

## Dependencies

This layer depends on:

* URI: git@github.com:linux-sunxi/meta-sunxi.git
  * branch: kirkstone
  * revision: HEAD


## Adding meta-elimo to your build

Follow the usual steps to setup OpenEmbedded and bitbake.

For example, if you use poky it would go like this: 

```shell
git clone git://git.yoctoproject.org/poky && cd poky
git clone https://github.com/elimoengineering/meta-elimo.git
git clone https://git.openembedded.org/meta-openembedded.git
. oe-init-build-env 
bitbake-layers add-layer ../meta-openembedded/meta-oe/
bitbake-layers add-layer ../meta-openembedded/meta-python/
bitbake-layers add-layer ../meta-sunxi/
bitbake-layers add-layer ../meta-elimo/
```

### Elimo Initium

You can build for the Elimo Initium EVK by either exporting the `MACHINE` variable:

```shell
export MACHINE=elimo-initium
```

or setting it in your `conf/local.conf`


### Defining your own machine

If you are using the Impetus SoM on your own carrier board, you will most likely want to create a custom `MACHINE` to support the specific hardware on your carrier board. The approach we suggest to this end is to create your own BSP layer based on `meta-elimo`, either by:

- forking `meta-elimo` and modifying your fork. This is quicker and probably more convenient for small changes.
- creating a new layer altogether and making it depend on `meta-elimo`. You can model this on how `meta-elimo` depends on `meta-sunxi`. This approach is probably more flexible, but requires a bit more initial work.


### Using systemd instead of SysVinit

To use systemd add this to your `local.conf`:

```
INIT_MANAGER = "systemd"
```

### Changing the kernel boot parameters

To change the kernel boot parameters, you can initially edit `recipes-bsp/u-boot/files/boot.cmd` in the ``meta-sunxi` layer. The significant line is:

```
setenv bootargs console=${console} console=tty1 root=/dev/${rootdev} rootwait panic=10 ${extra}
```

Once you have a stable parameters set, we suggest you use a bbappend recipe in your own layer (e.g. a BSP layer for your board, or an application layer) to define your custom `boot.cmd`


## Deploying to SD card

If you're doing this in a Linux environment, you can use the following process to transfer the image to an SD Card.
In this example we're using the `core-image-sato-elimo-initium.wic` image, if you have built a different image, update the paths accordingly.

First check your SD card path using `lsblk`; in the following commands, replace <X> with your results from `lsblk`.

### Using `dd`

`dd` is already installed on most systems, so this is probably the quickest way to go:

```shell
tmp/deploy/images/elimo-initium
sudo dd if=core-image-sato-elimo-initium.wic of=/dev/sd<X> bs=4M iflag=fullblock oflag=direct conv=fsync status=progress
```

### Using `bmaptool`

[BMAP Tools](https://github.com/intel/bmap-tools) is a tool specifically designed by Intel to flash embedded system images to mass storage. It has several advantages over `dd`, including efficiency over sparse images, built-in verification and the ability to fetch images remotely over HTTPS, ssh and other protocols.
It is available on Debian based systems to be installed with a simple `sudo apt install bmap-tools`

```shell
cd tmp/deploy/images/elimo-initium
sudo umount /dev/sd<X>
sudo bmaptool copy core-image-sato-elimo-initium.wic.gz --bmap core-image-sato-elimo-initium.wic.bmap /dev/sd<X>
```

## Submitting patches
Please submit any patches against the `meta-elimo` layer to the [GitHub repo](https://github.com/elimo-engineering/meta-elimo) as a PR.

Maintainer: Matteo Scordino <matteo@elimo.io>
