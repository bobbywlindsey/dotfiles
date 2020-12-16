# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade

# set up terminal
brew install iterm2
brew cask install caskroom/fonts/font-hack
git clone https://github.com/dracula/iterm.git ~/Downloads
# git clone git@github.com:MartinSeeler/iterm2-material-design.git
# Under the Colors tab, choose 'Dracula'
# Under the Text tab change the font for each type (Regular and Non-ASCII) to 'Inconsolata for Powerline'. (Refer to the powerline-fonts repo for help on font installation.)

# install Anaconda (web)

# install Rectangle
brew install --cask rectangle

# install powerline fonts
pip install --user powerline-status
cd ~/Downloads
git clone https://github.com/powerline/fonts
cd fonts
./install.sh

# install powerlevel9k
brew tap sambadevi/powerlevel9k
brew install powerlevel9k

# install vim
brew install vim
brew install cmake
# brew install macvim
# install ultimate vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
# brew tap zegervdv/zathura
# brew install zathura
# brew install zathura-pdf-poppler
# brew install xdotool
# brew cask install skim
cp my_configs.vim ~/.vim_runtime
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
git clone https://github.com/cespare/vim-toml.git ~/.vim_runtime/my_plugins/vim-toml
# install YouCompleteMe for Vim
git clone --recursive git@github.com:Valloric/YouCompleteMe.git ~/.vim_runtime/my_plugins/YouCompleteMe
cd ~/.vim_runtime/my_plugins/YouCompleteMe
./install.py --clang-completer

# install misc tools
brew install curl global tree rename youtube-dl coreutils z node
brew cask install xquartz
brew install freeglut ack thefuck
brew install maven
# brew install gcc6 --with-all-languages --with-java --with-jit --with-nls
npm install --global fast-cli
npm install --global emoj

# install postgresql
brew install postgresql
sudo ln -s /usr/local/Cellar/postgresql /usr/local/opt/postgresql
# install database stuff
# brew install unixODBC
# brew install freetds@0.91
# brew link --force freetds@0.91

# productivity apps
brew cask install alfred

# install fish
brew install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher add rafaelrinaldi/pure
