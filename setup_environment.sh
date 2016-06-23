#!/bin/sh

cd ~/GitProjects
# get working directory up to date
git pull --rebase --prune
git submodule update --init --recursive

# copy Bobby.profile to ~/.local/share/konsole
cp ~/GitProjects/environment-setup/Bobby.profile ~/.local/share/konsole
# copy .bash_aliases to ~/
cp ~/GitProjects/environment-setup/.bash_aliases ~/
# copy .gitconfig to ~/
cp ~/GitProjects/environment-setup/.gitconfig ~/

# get packages
apt-get update
apt-get upgrade
apt-get install fonts-inconsolata -y
apt-get install xclip -y
apt-get install vim -y
apt-get install filezilla -y
apt-get install thunderbird -y
apt-get install enigmail -y
apt-get install kgpg -y
apt-get install git -y
apt-get install gnuplot -y
# change default editor to vim
sudo update-alternatives --config editor
3
# install meteor
curl https://install.meteor.com/ | sh

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"

# install chrome via web browser
# install Anaconda via web browser
# install sublime text 3 via web browser
# install windows decorations "ghost" theme
# change KDE workspace theme to "Breeze Dark"