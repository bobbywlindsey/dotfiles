# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade

# set up terminal
brew install iterm2
brew install zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
brew cask install caskroom/fonts/font-hack
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vim
brew tap zegervdv/zathura
brew install zathura
brew install zathura-pdf-poppler
brew install xdotool
brew cask install skim
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp ./my_configs.vim ~/.vim_runtime
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/lervag/vimtex.git ~/.vim_runtime/my_plugins/vimtek
git clone https://github.com/joshdick/onedark.vim.git ~/.vim_runtime/my_plugins/onedark.vim

# install Sublime Text
brew install sublime-text
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
brew tap homebrew/versions
brew install homebrew/versions/gcc6 --with-all-languages --with-java --with-jit --with-nls
npm install --global fast-cli
npm install --global emoj

# install R
brew tap homebrew/science
brew install Caskroom/cask/xquartz
brew install r

# install dev libraries
curl -sSL https://get.rvm.io | bash -s stable --ruby
# install OpenAI Gym dependencies
brew install cmake boost boost-python sdl2 swig wget
pip install 'gym[all]'
# install postgresql
brew install postgresql
sudo ln -s /usr/local/Cellar/postgresql /usr/local/opt/postgresql
# install ODBC dependency for R
brew install unixODBC
brew install freetds
conda install pymssql
pip install jupyterthemes
pip install spotipy
pip install gmusicapi
pip install luigi
conda install cudatoolkit

# productivity apps
brew cask install flux
brew cask install bettertouchtool
brew cask install alfred

# post install commads
# jt -t grade3
# conda install feedparser
# conda install -c r r-essentials

# download cuDNN (must login to Nvidia first): https://developer.nvidia.com/cudnn
# sudo cp include/cudnn.h /Developer/NVIDIA/CUDA-8.0/include
# sudo cp lib/libcudnn* /usr/local/cuda/lib
# create .theanorc file in home directory with contents:
# [global]
# device = gpu0
# floatX = float32

# if getting rvm error with oh my zsh
# rm ~/.zcomp*
