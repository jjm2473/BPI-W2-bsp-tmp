# BPI-W2-bsp

This is a fork from [BPI-SINOVOIP/BPI-W2-bsp](https://github.com/BPI-SINOVOIP/BPI-W2-bsp) kernel and u-boot for Banana-Pi W2 SBC.

The modifications are mainly to port the (minhng99/BPI-W2-bsp-4.4_public)[https://github.com/minhng99/BPI-W2-bsp-4.4_public] OpenWRT drivers for the HWNAT GMAC LAN port.

Code still in test mode. So use with THIS_MIGHT_CRASH option.

## Building and doing my own shbangs

### Toolchain

The toolchain and other non-related code will be phased out. I suggest using up-to-date aarch64 gcc toolchains. This code is known to work with [Linaro's 7.5.0 Aarch64 Linux GCC](https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz). To install and use the toolchain:

```
$ wget -P /tmp/gcc-linaro/ https://releases.linaro.org/components/toolchain/binaries/latest-7/aarch64-linux-gnu/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz
$ sudo tar xvf /tmp/gcc-linaro/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu.tar.xz -C /opt/
```

You can delete the tarball after decompressing.

### Building

For Linux Kernel:

1. Enter the linux-rtk folder and type the folowing:

```
$ export CROSS_COMPILE=/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
$ export ARCH=arm64
$ make distclean
$ make mrproper
$ make rtd129x_bpi_hwnat_defconfig
$ make -j{number of CPUs on your machine} Image dtbs modules
(Wait centuries)
```

## Installing this amazing porting to your beloved Banana-Pi W2

The SD partition schema is a big TODO. So for now use a pre-pressed, fresh from the oven, SD card with one of the out-there images (SD card must have 100MB unpartitioned space and u-boot written with offset 0xa000). You gonna have two partitions *BPI-BOOT* and *BPI-ROOT*. Assuming mount point as */media/{your user}/* (your *BPI-BOOT* only needs the path *bananapi/bpi-w2/linux/*) do the following to install this marvelous kernel:

```
$ cp arch/arm64/boot/Image /media/{your user}/bananapi/bpi-w2/linux/uImage
$ cp arch/arm64/boot/dts/realtek/rtd129x/rtd-1296-bananapi-w2-2GB.dtb /media/{your user}/BPI-BOOT/bananapi/bpi-w2/linux/bpi-w2.dtb
$ sudo make INSTALL_MOD_PATH=/media/{your user}/BPI-ROOT modules_install ARCH=arm64 CROSS_COMPILE=/opt/gcc-linaro-7.5.0-2019.12-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
```

Umount those those partitions, BUDDY! And enjoy the unlimited world of double LAN. Party, enjoy, live, eat cake.

On the releases I've shared an Debian Buster image. Is very lean, with some useful tools.

## HANDBONNING capabilities

Not available!
