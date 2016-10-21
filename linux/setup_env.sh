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
sudo apt-get install gdebi-core -y
sudo apt-get install emacs24 -y
sudo apt-get install global -y
sudo apt-get install libtiff5-dev
sudo apt-get install libfftw3-dev
sudo apt-get install wajig -y
sudo apt-get update
wajig install libgtk2.0-dev
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
# turn terminal cursor blinking off
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default|tr -d \')/ cursor-blink-mode off
# swap escape and caps lock keys
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# install Atom text editor
curl -O https://atom.io/download/deb
dpkg -i deb
# copy Atom files over
cp -rf ./.atom ~/

# install meteor
curl https://install.meteor.com/ | sh

# install oh my zsh
sudo apt-get install zsh -y
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install z
curl -o ~/z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
#chsh -s `which zsh`

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
npm install gulp-jshint jshint-stylish --save-dev
npm install gulp-sass --save-dev
npm install gulp-sourcemaps --save-dev
npm install gulp-concat --save-dev
npm install gulp-react --save-dev
npm install gulp-html-replace --save-dev
npm install react react-dom babelify babel-preset-react --save-dev
npm install bootstrap-sass --save-dev
npm install jquery --save-dev
npm install browserify --save-dev
npm install babel-preset-es2015 --sav-dev
npm install react-dom --save-dev
npm install browser-sync gulp --save-dev
npm install browser-sync --save-dev
npm install del --save-dev
npm install watchify --save-dev
npm install gulp-notify --save-dev
npm install superagent --save-dev
npm install glob --save-dev
npm install co --save-dev
npm install react-router --save-dev
npm install react-validate-decorator --save-dev
npm install classnames --save-dev

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp .spacemacs ~/

# (install these Python packages after Anaconda installation)
# pip install mkdoc mkdoc-material python-markdown-math
#conda install -c r r-essentials

# set global default editor (already in .gitconfig)
# git config --global core.editor "subl -n -w"
