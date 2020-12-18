#!/bin/sh

set -e

# Install media tools
flatpak install flathub org.flameshot.Flameshot -y
flatpak install flathub org.signal.Signal -y
flatpak install flathub org.videolan.VLC -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub com.dropbox.Client -y
sudo apt install exfat-utils exfat-fuse -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
