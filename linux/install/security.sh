#!/bin/sh

set -e

# Enable firewall
sudo ufw enable
# Install rootkit checker
sudo apt install chkrootkit -y
# Install graphical ufw
sudo apt install gufw -y
sudo apt install macchanger -y
# Install exiftool to wipe metadata from images: exiftool -all= my-image.jpg
sudo apt install libimage-exiftool-perl -y
# Install Vorta
flatpak install flathub com.borgbase.Vorta -y
