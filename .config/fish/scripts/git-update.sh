#!/usr/bin/env bash
packages="installed-packages.txt"

echo "writing packages into $packages"
pacman -Qqe > $packages
paru -Qqe >> $packages
echo "finished packages into $packages"
echo "copying files outside of home"
cp /etc/fstab $HOME/.root/etc/
cp -r /boot/grub/themes/* $HOME/.root/boot/grub/themes/
echo "finished copying files outside of home"
git add -u
git commit -m 'update'
git push
