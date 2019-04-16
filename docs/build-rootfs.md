# Building the MANI rootfs

The current process was originally designed for the old l4t based on ubuntu
16.04 and can be optimized. But it still works for now.

## Requirements

All commands should be executed on a device with an arm64 cpu similar to the
one our TX2 uses since we don't do cross compiling at the moment. Ubuntu as an
OS is assumed for most commands but everything else should work to.

Most of the time the easiest way of achieving all this is by building the 
rootfs directly on the TX2.

## Creating a fresh ubuntu 18.04 base image

```bash
sudo debootstrap bionic ~/rootfs http://ports.ubuntu.com/ubuntu-ports/
cd ~/rootfs
sudo tar -cpzf ../ubuntu_18.04_aarch64.tar.gz .
```

This should create a archive called  `ubuntu_18.04_aarch64.tar.gz` in your 
home directory. This file contains an empty ubuntu 18.04 system and will be
used as a base for our next step.

## Installing MANI on the rootfs

Clone this repo and copy the ubuntu rootfs from the previous step into the
`scripts/` folder and run:

```bash
cd scripts/
sudo ./create_rootfs.sh ~/mani-fs
```

This command will generate a new rootfs with all the mani dependencies 
installed in your home directory.

## Flashing

The image can be flashed using the L4T flashing script as described there.

