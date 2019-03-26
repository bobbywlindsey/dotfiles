#!/bin/sh

set -e

# update everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

# install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}

# install image decreasing tool
sudo add-apt-repository ppa:atareao/nautilus-extensions
sudo apt update
sudo apt install nautilus-reduceimages

# install developer stuff
sudo apt install -y \
    xclip \
    git \
    filezilla \
    gnuplot \
    curl \
    npm \
    libtiff5-dev \
    libfftw3-dev \
    libcupti-dev \
    tmux \
    global \
    gdebi-core

# install media software
sudo apt install vlc -y
sudo apt install exfat-utils exfat-fuse -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# install iptables
sudo apt install iptables-persistent -y

# make available the latest Nvidia drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update

# install ssh server
sudo apt install openssh-server -y
# systemctl status ssh
# sudo service ssh restart
# config file located at /etc/ssh/sshd_config

# install utilities
sudo apt install htop -y
sudo apt install unrar -y
sudo apt install tree -y
sudo apt install network-manager-vpnc network-manager-vpnc-gnome network-manager-openconnect-gnome -y

# install vim
sudo apt install vim vim-gnome -y
sudo apt install libsynctex-dev -y
sudo apt install libgtk-3-dev -y
sudo apt install ack-grep -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime

# install vim plugins
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
git clone https://github.com/cespare/vim-toml.git ~/.vim_runtime/my_plugins/vim-toml

# install paper theme for Gnome
sudo apt install gnome-tweak-tool -y
sudo add-apt-repository ppa:snwh/pulp -y
sudo apt update
sudo apt install paper-icon-theme -y
sudo apt install paper-gtk-theme -y
sudo apt install paper-cursor-theme -y

# install fonts
sudo apt install fonts-inconsolata -y
sudo apt install fonts-hack-ttf -y
sudo apt install fonts-powerline
sudo fc-cache -fv

# enable reverse mouse scrolling
/usr/bin/gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

# turn terminal cursor blinking off
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

# Custom keybindings
BEGINNING="/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/', '$KEY_PATH/custom1/']"
# Screenshot to clipboard with Ctrl + Shift + Alt + 4
$BEGINNING/custom0/ name 'screenshot to clipboard'
$BEGINNING/custom0/ command 'gnome-screenshot -ac'
$BEGINNING/custom0/ binding '<Primary><Shift><Alt>dollar'
# Screenshot to Downloads folder with Shift + Alt + 4
$BEGINNING/custom1/ name 'screenshot to downloads'
$BEGINNING/custom1/ command 'gnome-screenshot -a'
$BEGINNING/custom1/ binding '<Shift><Alt>dollar'

# Set default location for screenshots to Downloads folder
/usr/bin/gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Downloads/"

# swap escape and caps lock keys
sudo apt install dconf-tools -y
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# install Signal desktop
sudo curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop -y

# install Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install spotify-client -y --allow-unauthenticated

# install DataGrip
sudo snap install datagrip --classic

# install fish
sudo apt-add-repository ppa:fish-shell/release-2 -y
sudo apt update
sudo apt install fish -y
chsh -s /usr/bin/fish
sudo chown -R bobby:bobby ~/.config/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish
fisher add rafaelrinaldi/pure
bash
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish
cp -R ./fish/functions/. ~/.config/fish/functions/

# install nodejs and npm
# curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
# sudo apt install -y nodejs
# sudo ln -s /usr/bin/nodejs /usr/bin/node

# install npm cli tools
# npm install --global emoj
# npm install --global fast-cli
# npm install --global pure-prompt

### POST SETUP ###
# install CUDA toolkit once choosing the latest Nvidia driver
# sudo apt install cuda
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
