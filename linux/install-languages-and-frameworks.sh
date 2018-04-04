#!/bin/sh

# NOTE: update hardcoded links before running script to get latest version of software

set -e

# install Ruby via RVM
sudo apt-get remove ruby -y
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs software-properties-common -y
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm -y
# change your terminal window with these directions https://github.com/rvm/ubuntu_rvm
# after a reboot, install Ruby: rvm install ruby-2.5.0
#git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# install Julia
sudo add-apt-repository ppa:staticfloat/juliareleases -y
sudo add-apt-repository ppa:staticfloat/julia-deps -y
sudo apt update
sudo apt-get install julia -y

# install support for LaTeX
sudo apt-get install texlive-full -y
sudo apt-get install texstudio -y
sudo apt-get install texlive-math-extra -y

# install R dependencies
sudo apt-get install libgmp3-dev
sudo apt-get install wajig -y
sudo apt update
wajig install libgtk2.0-dev
# install R Open (HARDLINK)
sudo apt-get install MRO-3.3.0-Ubuntu-15.4.x86_64.deb -y
# install RStudio (HARDLINK)
curl -O https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
sudo gdebi -n rstudio-0.99.903-amd64.deb
rm rstudio-0.99.903-amd64.deb

# install meteor
curl https://install.meteor.com/ | sh
# make node command compatible
sudo ln -s /usr/bin/nodejs /usr/bin/node
# install js node packages for spacemacs support
npm install -g tern
npm install -g js-beautify
npm install -g jshint
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
# install js node packages for react dev
npm install -g browserify
npm install -g gulp
npm install -g jshint
npm install -g uglify-js
npm install -g static-server
# install shell script to check internet speed
npm install --global fast-cli
# install shell script to find emojis
npm install --global emoj

# install Anaconda (follow prompts) (HARDLINK)
curl -O https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh
bash Anaconda3-4.3.1-Linux-x86_64.sh
# install jupyter notebook theme
# pip install jupyterthemes lesscpy
# jt -t grade3
# install MS SQL support
sudo apt-get install freetds-dev -y
conda install pymssql
# install MLK (follow prompts) (HARDLINK)
tar -xzf RevoMath-3.3.0.tar.gz
rm RevoMath-3.3.0.tar.gz
cd RevoMath/
sudo ./RevoMath.sh
cd ..
rm -rf RevoMath/
