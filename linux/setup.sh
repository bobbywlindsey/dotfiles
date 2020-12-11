#!/bin/sh

set -e

# Update everything
sudo apt update
sudo apt full-upgrade
pop-upgrade release upgrade

# Install developer stuff
sudo apt install -y \
    xclip \
    tmux \
    neovim \
    htop \
    unrar \
    tree
flatpak install flathub com.visualstudio.code -y

# Install media tools
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.dropbox.Client -y
sudo apt install exfat-utils exfat-fuse -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
mkdir ~/.aws

# Install fonts
sudo apt install fonts-inconsolata -y
sudo apt install fonts-hack-ttf -y
sudo apt install fonts-powerline -y
sudo fc-cache -fv

# Install theme: install Dracula terminal profile from here: https://github.com/Mayccoll/Gogh
# clone the repo into "$HOME/src/gogh"
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes
# necessary on ubuntu
export TERMINAL=gnome-terminal
# install themes
./dracula.sh

# Enable firewall
sudo ufw enable
# Install rootkit checker
sudo apt install chkrootkit
# Install graphical ufw
sudo apt install gufw

# Install fish
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt update
sudo apt install fish -y
chsh -s /usr/bin/fish
sudo chown -R $USER:$USER ~/.config/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish
fisher install rafaelrinaldi/pure
bash
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish
cp -R ./fish/functions/. ~/.config/fish/functions/

# Mac OS keybindings for screenshots
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Shift><Alt>dollar']"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Primary><Shift><Alt>dollar']"

# Set default location for screenshots to Pictures
/usr/bin/gsettings set org.gnome.gnome-screenshot auto-save-directory "/home/$USER/Desktop"

# Swap escape and caps lock keys
/usr/bin/gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Set keybindings for switching tabs in the terminal
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab "'<Alt>braceright'"
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab "'<Alt>braceleft'"

# Turn terminal cursor blinking off
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

# Enable reverse mouse scrolling
/usr/bin/gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

