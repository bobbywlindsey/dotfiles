#!/bin/sh

set -e

# install vim
sudo apt-get install vim vim-gnome -y
sudo apt-get install libsynctex-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install zathura -y
sudo apt-get install ack-grep -y
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# install YouCompleteMe for Vim
sudo apt-get install build-essential cmake
sudo apt-get install python-dev python3-dev
git clone --recursive git@github.com:Valloric/YouCompleteMe.git ~/.vim_runtime/my_plugins
cd ~/.vim_runtime/my_plugins/YouCompleteMe
./install.py --clang-completer
~/.fzf/install
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
# install powerline fonts
sudo apt-get install fonts-powerline
