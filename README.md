# dotfiles for Ubuntu and Mac OS

### Ubuntu

```
cd linux/
sudo ./update_sys.sh
sudo ./setup_env.sh
```

### For MacOS

```
cd mac/
./setup_env.sh
```

### Windows

**Install Windows Linux Subsystem**

1. Open PowerShell as admin and execute `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
2. Restart when prompted
3. Go to Windows App Store and install Ubuntu

**Setup terminal**

* Install [cmder](http://cmder.net/)
* Install powerline fonts:
    * `git clone https://github.com/powerline/fonts.git`
    * `cd fonts`
    * `.\install.ps1`
* Reboot Windows
* Copy `windows/.zshrc` file to home directory
* Change ls colors:
    * `git clone git@github.com:seebi/dircolors-solarized.git`
* Install oh my zsh
```
sudo apt-get install zsh -y
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
* Install packages for Jekyll
```
# install Ruby
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs software-properties-common -y
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install 2.5.1
rbenv global 2.5.1
# install Jekyll
gem install bundler
```
* Install vim configs by using this repo and installing the following
```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
sudo apt-get install fonts-powerline -y
```
* Install pure prompt
```
wget https://raw.githubusercontent.com/sindresorhus/pure/master/pure.zsh
wget https://raw.githubusercontent.com/sindresorhus/pure/master/async.zsh
sudo ln -s "$PWD/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
sudo ln -s "$PWD/async.zsh" /usr/local/share/zsh/site-functions/async
```

**Other Apps**

* MS Office
* Mathematica
* [Everything Search](https://www.voidtools.com/)
* [Wox](https://github.com/Wox-launcher/Wox) 
* [Plex](https://www.plex.tv/downloads/)
* [VS Code](https://code.visualstudio.com/)
* [GitKraken](https://www.gitkraken.com/)
* [Slack](https://slack.com/downloads/windows)
* [DataGrip](https://www.jetbrains.com/datagrip/download/#section=windows)
* Evernote
* Anki
