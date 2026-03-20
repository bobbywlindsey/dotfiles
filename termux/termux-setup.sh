#!/bin/bash

pkg update && pkg upgrade

# Install packages
pkg install -y git stow curl wget neovim imagemagick autoconf automake libtool make clang

# Build libtexprintf
git clone https://github.com/bartp5/libtexprintf
cd libtexprintf
./autogen.sh
./configure --prefix=$PREFIX
make
make install

# Get neovim config
cd ..
git clone https://github.com/bobbywlindsey/dotfiles
cp -rf dotfiles/nixos/nvim/.config/nvim ~/.config/nvim

# Move files
mv .bashrc ~/
mv colors.properties ~/.termux/
mv font.ttf ~/.termux/

# Reload configs
source ~/.bashrc
termux-reload-settings

# Cleanup
rm -rf dotfiles
rm -rf libtexprintf
