#!/bin/sh

set -e

# Update everything
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y

# Install developer stuff
sudo apt install -y \
    xclip \
    git \
    gnuplot \
    curl \
    libtiff5-dev \
    libfftw3-dev \
    libcupti-dev \
    tmux \
    global \
    gdebi-core

#----- MEDIA TOOLS -----#

# Install image decreasing tool
sudo add-apt-repository ppa:atareao/nautilus-extensions
sudo apt update
sudo apt install nautilus-reduceimages

# Install media software
sudo apt install vlc -y
sudo apt install exfat-utils exfat-fuse -y
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# Install Spotify
snap install spotify

#----- UTILITIES -----#

sudo apt install iptables-persistent -y
sudo apt install htop -y
sudo apt install unrar -y
sudo apt install tree -y

#----- VIM -----#

# Install vim
sudo apt install vim vim-gtk3 -y
sudo apt install libsynctex-dev -y
sudo apt install libgtk-3-dev -y
sudo apt install ack-grep -y
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime

# Install vim plugins
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
git clone https://github.com/cespare/vim-toml.git ~/.vim_runtime/my_plugins/vim-toml

#----- THEMES, ICONS, AND FONTS -----#

# Install themes for Gnome
sudo apt install arc-theme -y
curl -LO https://github.com/rtlewis88/rtl88-Themes/archive/Arc-ICONS.zip
mkdir ~/.icons/
unzip Arc-ICONS.zip
cp -R rtl88-Themes-Arc-ICONS/Arc-ICONS/ ~/.icons/
rm -rf rtl88-Themes-Arc-ICONS/
rm Arc-ICONS.zip

sudo apt install gnome-shell-extensions -y
sudo apt install chrome-gnome-shell -y
sudo apt install gnome-tweak-tool -y

# Install fonts
sudo apt install fonts-inconsolata -y
sudo apt install fonts-hack-ttf -y
sudo apt install fonts-powerline -y
sudo fc-cache -fv

# Install Dracula terminal profile from here: https://github.com/Mayccoll/Gogh

#----- TERMINAL SETTINGS -----#

# Turn terminal cursor blinking off
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off

# Install fish
sudo apt-add-repository ppa:fish-shell/release-3 -y
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

#----- KEY BINDINGS -----#

# Custom keybindings
BEGINNING="/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
"['$KEY_PATH/custom0/', '$KEY_PATH/custom1/']"

# Screenshot to clipboard with Ctrl + Shift + Alt + 4
$BEGINNING/custom0/ name 'screenshot to clipboard'
$BEGINNING/custom0/ command 'gnome-screenshot -ac'
$BEGINNING/custom0/ binding '<Primary><Shift><Alt>dollar'

# Screenshot to Desktop folder with Shift + Alt + 4
$BEGINNING/custom1/ name 'screenshot to desktop'
$BEGINNING/custom1/ command 'gnome-screenshot -a'
$BEGINNING/custom1/ binding '<Shift><Alt>dollar'

# Set default location for screenshots to Desktop
/usr/bin/gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/Desktop/"

# Swap escape and caps lock keys
sudo apt install dconf-editor -y
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# Minimize windows like in MacOS
dconf write /org/gnome/desktop/wm/keybindings/minimize "['<Super>m']"

# Set keybindings for switching tabs in the terminal
dconf write /org/gnome/terminal/legacy/keybindings/next-tab "'<Super>braceright'"
dconf write /org/gnome/terminal/legacy/keybindings/prev-tab "'<Super>braceleft'"
dconf write /org/gnome/terminal/legacy/keybindings/copy "'<Super>c'"
dconf write /org/gnome/shell/keybindings/toggle-message-tray "['<Super>b']"
dconf write /org/gnome/terminal/legacy/keybindings/paste "'<Super>v'"
dconf write /org/gnome/terminal/legacy/keybindings/new-tab "'<Super>t'"
dconf write /org/gnome/terminal/legacy/keybindings/close-tab "'<Super>w'"

# Enable reverse mouse scrolling
/usr/bin/gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true

#----- REMOVE UNNECESSARY PACKAGES -----#
sudo ./ubuntu-bloat-removal.sh

# After installing nvidia driver
# sudo apt install nvidia-cuda-toolkit -y
# Then see which version of cuda you have: nvcc --version
# Then install cuDNN: https://developer.nvidia.com/rdp/cudnn-download
# Then download TensorRT: https://developer.nvidia.com/tensorrt
