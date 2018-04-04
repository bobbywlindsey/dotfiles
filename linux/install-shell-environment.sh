#!/bin/sh

set -e

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