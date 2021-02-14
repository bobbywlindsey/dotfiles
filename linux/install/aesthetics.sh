#!/bin/sh

set -e

sudo apt install gnome-tweaks -y

# Install fonts
sudo apt install fonts-inconsolata -y
sudo apt install fonts-hack-ttf -y
sudo apt install fonts-powerline -y
sudo fc-cache -fv

# Install theme: install Dracula terminal profile from here: https://github.com/Mayccoll/Gogh
# Clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes
# Necessary on ubuntu
export TERMINAL=gnome-terminal
# Install themes
./dracula.sh
