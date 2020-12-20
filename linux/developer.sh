#!/bin/sh

set -e

# Install developer stuff
sudo apt install -y \
    xclip \
    tmux \
    neovim \
    htop \
    unrar \
    tree \
    alacritty \
    hugo

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
mkdir ~/.aws

# Install fish
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt update
sudo apt install fish -y
sudo chsh -s `which fish`
mkdir -p ~/.config/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
/usr/bin/fish -c "fisher install rafaelrinaldi/pure"
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish
cp -R ./fish/functions/. ~/.config/fish/functions/

# Turn terminal cursor blinking off
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

# Enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# Clone nvim settings
git clone https://github.com/bobbywlindsey/nvim.git ~/.config/nvim

# Copy git config
cp ../.gitconfig ~/
