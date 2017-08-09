#!/bin/sh

# NOTE: first run "zs" then open up new terminal before running this script
# NOTE: update hardcoded links before running script to get latest version of software

set -e

# install Ruby
rbenv install 2.4.0
rbenv global 2.4.0
gem install jekyll bundler

conda update conda
conda update --all
# (install these Python packages after Anaconda installation)
pip install mkdoc mkdoc-material python-markdown-math
conda install -c r r-essentials
conda install mysql-connector-python
conda install theano
conda install pygpu=0.6.2
conda install feedparser
pip install tensorflow-gpu

pip install spotipy
pip install gmusicapi

# download MLK (HARDLINK)
curl -O https://mran.microsoft.com/install/mro/3.3.0/RevoMath-3.3.0.tar.gz

# install CUDA toolkit once choosing the latest Nvidia driver
sudo apt-get install cuda
# to fix any screen tearing with Ubuntu 16.04 and Nvidia GTX 1070
# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
# then go into Nvidia X Server, click on X Server Display Configuration, and
# click Save to X Configuration File
# download cuDNN 5.1 (must login to Nvidia first): https://developer.nvidia.com/cudnn
# run the following commands:
# sudo cp -P include/cudnn.h /usr/include
# sudo cp -P lib64/libcudnn* /usr/lib/x86_64-linux-gnu/
# sudo chmod a+r /usr/lib/x86_64-linux-gnu/libcudnn*
# sudo cp -P include/cudnn.h /usr/local/cuda-8.0/include
# sudo cp -rP lib64 /usr/local/cuda-8.0/lib64
# create .theanorc file in home directory with contents:
# [global]
# device = cuda
# floatX = float32

# set up iptables for remote Jupyter Notebook
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8888 -j ACCEPT
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 443 -j ACCEPT
# sudo netfilter-persistent save
# sudo netfilter-persistent reload
# saved rules are stored below
# sudo vim /etc/iptables/rules.v4

# manually mount Plex drive
# sudo parted -l
# sudo mkdir /media/Media
# sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media

# configure keyboard shortcuts for media:
# settings --> Keyboard --> Sound and Media
# disable "Play (or play/pause)", "Previous Track", and "Next Track"
