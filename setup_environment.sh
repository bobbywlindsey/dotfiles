#!/bin/sh

# update everything
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get autoremove

# copy .bash_aliases to ~/
cp ./.bash_aliases ~/
# copy .gitconfig to ~/
cp ./.gitconfig ~/

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
sudo apt-get install npm -y
sudo apt-get install texlive-full -y
sudo apt-get install texstudio -y
sudo apt-get install clamav clamav-daemon -y
sudo freshclam
sudo apt-get install xserver-xorg-input-libinput -y
sudo apt-get install exfat-utils exfat-fuse -y
sudo apt-get install vlc -y
sudo apt-get install gdebi-core
sudo apt-get install emacs24
# install Julia
sudo add-apt-repository ppa:staticfloat/juliareleases
sudo add-apt-repository ppa:staticfloat/julia-deps
sudo apt-get update
sudo apt-get install julia -y
# install inconsolata
sudo apt-get install fonts-inconsolata -y
sudo fc-cache -fv
# install R Open
sudo apt-get install MRO-3.3.0-Ubuntu-15.4.x86_64.deb -y
# download MLK (install later in script)
curl -O https://mran.microsoft.com/install/mro/3.3.0/RevoMath-3.3.0.tar.gz

# install RStudio
curl -O https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
sudo gdebi -n rstudio-0.99.903-amd64.deb
rm rstudio-0.99.903-amd64.deb
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# install Atom text editor
curl -O https://atom.io/download/deb
dpkg -i deb
# copy Atom files over
cp -rf ./.atom ~/

# install meteor
curl https://install.meteor.com/ | sh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install z
curl -o ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
chsh -s `which zsh`

# install Anaconda (follow prompts)
curl -O http://repo.continuum.io/archive/Anaconda3-4.1.1-Linux-x86_64.sh
bash Anaconda3-4.1.1-Linux-x86_64.sh
# install MLK (follow prompts)
tar -xzf RevoMath-3.3.0.tar.gz
rm RevoMath-3.3.0.tar.gz
cd RevoMath/
sudo ./RevoMath.sh
cd ..
rm -rf RevoMath/

# setup for tern to work in emacs
git clone https://github.com/ternjs/tern.git
cd tern/
npm install
mv tern/ ~/.emacs.d/
sudo ln -s /usr/bin/nodejs /usr/bin/node

# (install these Python packages after Anaconda installation)
# pip install mkdoc mkdoc-material python-markdown-math

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"
