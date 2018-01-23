#!/bin/sh

set -e

# install paper theme
sudo apt-get install gnome-tweak-tool -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update
sudo apt-get install paper-icon-theme -y
sudo apt-get install paper-gtk-theme -y
sudo apt-get install paper-cursor-theme -y
# install fonts
sudo apt-get install fonts-inconsolata -y
sudo apt-get install fonts-hack-ttf -y
sudo fc-cache -fv
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# turn terminal cursor blinking off
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off
# swap escape and caps lock keys
sudo apt-get install dconf -y
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
