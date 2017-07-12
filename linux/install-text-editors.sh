#!/bin/sh

set -e

# install vim
sudo apt-get install vim -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
# install Hack font
sudo apt-get install fonts-hack-ttf
# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt update
sudo apt-get install sublime-text-installer
rm -rf ~/.config/sublime-text-3/Packages/User/
ln -t ~/.config/sublime-text-3/Packages/ -s ~/Dropbox/collections/dev/sublime-text/User
# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp .spacemacs ~/
