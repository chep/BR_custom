#!/bin/sh

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

DEVICE=/dev/mmcblk0p1 

if mount | grep $DEVICE
then 
	MOUNTPOINT=$(mount | grep $DEVICE | awk '{print $3}')
else
	MOUNTPOINT="/tmp/update_sd"
	mkdir $MOUNTPOINT
	mount $DEVICE $MOUNTPOINT 
fi

rm -rf $MOUNTPOINT/*
tar xvf output/images/rootfs.tar -C $MOUNTPOINT/
sync
umount $MOUNTPOINT

exit 0
