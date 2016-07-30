#!/bin/sh

# copy .bash_aliases to ~/
cp ~/Downloads/environment-setup-master/.bash_aliases ~/
# copy .gitconfig to ~/
cp ~/Downloads/environment-setup-master/.gitconfig ~/

# get packages
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install xclip -y
sudo apt-get install vim -y
sudo apt-get install filezilla -y
sudo apt-get install git -y
sudo apt-get install gnuplot -y
sudo apt-get install chromium-browser -y
sudo apt-get install curl -y
sudo apt-get install texlive-full -y
sudo apt-get install clamav clamav-daemon -y
sudo freshclam
sudo apt-get install xserver-xorg-input-libinput -y
sudo apt-get install exfat-utils exfat-fuse
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

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
