#!/bin/sh

set -e

# install developer stuff
sudo apt-get install xclip -y
sudo apt-get install git -y
sudo apt-get install filezilla -y
sudo apt-get install gnuplot -y
sudo apt-get install curl -y
sudo apt-get install npm -y
sudo apt-get install libtiff5-dev -y
sudo apt-get install libfftw3-dev -y
sudo apt-get install libcupti-dev -y
sudo apt-get install tmux -y
sudo apt-get install global -y
sudo apt-get install xserver-xorg-input-libinput -y
sudo apt-get install gdebi-core -y

# antivirus
sudo apt-get install clamav clamav-daemon -y
sudo freshclam

# install media software
sudo apt-get install chromium-browser -y
sudo apt-get install vlc -y

# install feedreader
sudo add-apt-repository ppa:eviltwin1/feedreader-stable -y
sudo apt update
sudo apt-get install feedreader-y

# install support for exfat
sudo apt-get install exfat-utils exfat-fuse -y

# install iptables
sudo apt-get install iptables-persistent -y

# make available the latest Nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# install ssh server
sudo apt-get install openssh-server -y
# systemctl status ssh
# sudo service ssh restart
# config file located at /etc/ssh/sshd_config

# install youtube-dl
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl