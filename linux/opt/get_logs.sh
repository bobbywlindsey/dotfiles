#!/bin/sh

set -e

# Remove directory if exists
rm -rf ~/mylogs
mkdir ~/mylogs
sudo journalctl > ~/mylogs/journal.log
sudo dmesg > ~/mylogs/dmesg.log
cp ~/.local/share/xorg/Xorg.1.log ~/mylogs/Xorg.1.log
sudo dmidecode > ~/mylogs/demidecode
sudo lspci -vv > ~/mylogs/lscpi.log
sudo lsusb -vv > ~/mylogs/lsusb.log
uname -a > ~/mylogs/uname.log
cp /etc/os-release ~/mylogs/os-release
tar czf mylogs-log.tgz ~/mylogs/*
rm ~/mylogs/*
rmdir ~/mylogs
