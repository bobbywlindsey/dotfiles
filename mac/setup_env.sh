# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade

# set up terminal
brew install iterm2
brew cask install caskroom/fonts/font-hack
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# install powerline fonts
pip install --user powerline-status
cd ~/Donwloads
git clone https://github.com/powerline/fonts
cd fonts
./install.sh

# install vim
brew install vim --with-override-system-vi --with-python3
brew install macvim --with-override-system-vim
brew linkapps
# install ultimate vim config
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/my_plugins
# install YouCompleteMe for Vim
git clone --recursive git@github.com:Valloric/YouCompleteMe.git ~/.vim_runtime/my_plugins
cd ~/.vim_runtime/my_plugins/YouCompleteMe
./install.py --clang-completer
# brew tap zegervdv/zathura
# brew install zathura
# brew install zathura-pdf-poppler
# brew install xdotool
# brew cask install skim
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/my_plugins/onedark.vim

# install Sublime Text
brew tap caskroom/versions
brew cask install sublime-text
mkdir ~/bin
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# install MiKTeX
brew tap miktex/miktex
brew install miktex
mpm --admin --package-level=basic --upgrade

# install misc tools
brew install curl
brew install global
brew install tree
brew install rename
brew install youtube-dl
brew install coreutils
brew install z
brew install node
brew install freeglut
brew install ack
brew install thefuck
brew install gcc6 --with-all-languages --with-java --with-jit --with-nls
npm install --global fast-cli
npm install --global emoj

# install R
brew install Caskroom/cask/xquartz
brew install r

# install OpenAI Gym dependencies
brew install cmake boost boost-python sdl2 swig wget
pip install 'gym[all]'
# install postgresql
brew install postgresql
sudo ln -s /usr/local/Cellar/postgresql /usr/local/opt/postgresql
# install database stuff
brew install unixODBC
brew install freetds@0.91
brew link --force freetds@0.91

# productivity apps
brew cask install bettertouchtool
brew cask install alfred
