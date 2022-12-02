#!/bin/sh
#
# Authot: muhammed hussam
#

uid=$(id -u)
gid=$(id -g)

usbdev=$(ls -l /sys/dev/block/ | awk  -F"/" '{print $15}' | sed '/^$/d' | awk '{ print "/dev/"$1}')


if [ "$usbdev" ]
then
	select=$(lsblk -lo name,size,mountpoint -n "$usbdev" | \
		dmenu  -i -p "USBs drives: " | \
		awk '{print $1 }')
	if grep -qs "$select" /proc/mounts
	then
		doas sync
		doas umount /dev/"$select"
		grep -qs /mnt/"$select" /porc/mounts || doas rm -rf /mnt/"$select"
	else
		[ ! -d /mnt/"$select" ] && doas mkdir -p /mnt/"$select" &&
		doas mount -o uid="$uid",gid="$gid" /dev/"$select" /mnt/"$select" &&
		st nnn -H /mnt
	fi
else
	echo "No drives connected" | dmenu -i -p "USB drives: "

fi

