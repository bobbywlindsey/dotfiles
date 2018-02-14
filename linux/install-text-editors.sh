#!/bin/sh

set -e

# install vim
sudo apt-get install vim vim-gnome -y
sudo apt-get install libsynctex-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install zathura -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/my_plugins/onedark.vim
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt update
sudo apt-get install sublime-text-installer
rm -rf ~/.config/sublime-text-3/Packages/User/
ln -t ~/.config/sublime-text-3/Packages/ -s ~/Dropbox/collections/dev/sublime-text/User
