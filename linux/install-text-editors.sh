#!/bin/sh

set -e

# install vim
sudo apt-get install libsynctex-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install zathura -y
sudo apt-get install neovim -y
pip install neovim
# install Hack font
sudo apt-get install fonts-hack-ttf -y
# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt update
sudo apt-get install sublime-text-installer
rm -rf ~/.config/sublime-text-3/Packages/User/
ln -t ~/.config/sublime-text-3/Packages/ -s ~/Dropbox/collections/dev/sublime-text/User
