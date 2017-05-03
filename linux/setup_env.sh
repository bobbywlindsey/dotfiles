#!/bin/sh

# NOTE: update hardcoded links before running script to get latest version of software

# update everything
sudo apt update
sudo apt upgrade -y
sudo apt-get dist-upgrade
sudo apt-get autoremove

# install oh my zsh
sudo apt-get install zsh -y
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install z
curl -o ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
#chsh -s `which zsh`
# copy .zshrc to ~/
cp ./.zshrc ~/
# copy .zshenv to ~/
cp ./.zshenv ~/

# install developer stuff
sudo apt-get install xclip -y
sudo apt-get install emacs24 -y
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

# install vim
sudo apt-get install vim -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
# install Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt update
sudo apt-get install sublime-text-installer
# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp .spacemacs ~/

# install support for LaTeX
sudo apt-get install texlive-full -y
sudo apt-get install texstudio -y

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

# set up iptables for remote Jupyter Notebook
sudo apt-get install iptables-persistent -y
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8888 -j ACCEPT
# sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 443 -j ACCEPT
# sudo netfilter-persistent save
# sudo netfilter-persistent reload
# saved rules are stored below
sudo vim /etc/iptables/rules.v4

# install R dependencies
sudo apt-get install libgmp3-dev
sudo apt-get install wajig -y
sudo apt update
wajig install libgtk2.0-dev
# install R Open
sudo apt-get install MRO-3.3.0-Ubuntu-15.4.x86_64.deb -y
# download MLK (install later in script)
curl -O https://mran.microsoft.com/install/mro/3.3.0/RevoMath-3.3.0.tar.gz
# install RStudio
curl -O https://download1.rstudio.org/rstudio-0.99.903-amd64.deb
sudo gdebi -n rstudio-0.99.903-amd64.deb
rm rstudio-0.99.903-amd64.deb

# install Julia
sudo add-apt-repository ppa:staticfloat/juliareleases -y
sudo add-apt-repository ppa:staticfloat/julia-deps -y
sudo apt update
sudo apt-get install julia -y

# install paper theme
sudo apt-get install gnome-tweak-tool -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update
sudo apt-get install paper-icon-theme -y
sudo apt-get install paper-gtk-theme -y
sudo apt-get install paper-cursor-theme -y
sudo apt-get install tree
# install inconsolata
sudo apt-get install fonts-inconsolata -y
sudo fc-cache -fv
# enable reverse mouse scrolling
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
# turn terminal cursor blinking off
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off
# swap escape and caps lock keys
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# make available the latest Nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
# install CUDA toolkit once choosing the latest Nvidia driver
#sudo apt-get install cuda
# to fix any screen tearing with Ubuntu 16.04 and Nvidia GTX 1070
# nvidia-settings --assign CurrentMetaMode="nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
# then go into Nvidia X Server, click on X Server Display Configuration, and
# click Save to X Configuration File
# download cuDNN (must login to Nvidia first): https://developer.nvidia.com/cudnn
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

# install meteor
curl https://install.meteor.com/ | sh

# install Anaconda (follow prompts)
curl -O https://repo.continuum.io/archive/Anaconda3-4.3.1-Linux-x86_64.sh
bash Anaconda3-4.3.1-Linux-x86_64.sh
# install MLK (follow prompts)
tar -xzf RevoMath-3.3.0.tar.gz
rm RevoMath-3.3.0.tar.gz
cd RevoMath/
sudo ./RevoMath.sh
cd ..
rm -rf RevoMath/

# make node command compatible
sudo ln -s /usr/bin/nodejs /usr/bin/node

# install js node pacakges for spacemacs support
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

# confgiure ssh server
sudo apt-get install openssh-server -y
# systemctl status ssh
# sudo service ssh restart
# config file located at /etc/ssh/sshd_config

# (install these Python packages after Anaconda installation)
# pip install mkdoc mkdoc-material python-markdown-math
#conda install -c r r-essentials
#conda install theano pygpu
#pip install tensorflow-gpu

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"

# manually mount Plex drive
# sudo parted -l
# sudo mkdir /media/Media
# sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media

