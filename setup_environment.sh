#!/bin/sh

# copy .bash_aliases to ~/
cp ~/GitProjects/environment-setup/.bash_aliases ~/
# copy .gitconfig to ~/
cp ~/GitProjects/environment-setup/.gitconfig ~/

# get packages
apt-get update
apt-get upgrade -y
apt-get install xclip -y
apt-get install vim -y
apt-get install filezilla -y
apt-get install git -y
apt-get install gnuplot -y
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# install chrome via web browser
apt-get install chromium-browser

cd ~/Downloads
# install Atom text editor
wget https://atom.io/download/deb
dpkg -i deb

# install meteor
curl https://install.meteor.com/ | sh

# install Anaconda (do this last as install takes user input)
wget http://repo.continuum.io/archive/Anaconda3-4.1.0-Linux-x86_64.sh
bash Anaconda3-4.1.0-Linux-x86_64.sh

# change default editor to vim
#3 | sudo update-alternatives --config editor

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"
