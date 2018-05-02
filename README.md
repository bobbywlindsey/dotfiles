# dotfiles for Ubuntu and Mac OS

For Ubuntu:

```
cd linux/
sudo ./update_sys.sh
sudo ./setup_env.sh
```

For MacOS:

```
cd mac/
./setup_env.sh
```

For Windows:

1. Open PowerShell as admin and execute `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
2. Restart when prompted
3. Go to Windows App Store and install Ubuntu
4. Install [Hyper](https://hyper.is/).
5. Reboot Windows
6. `hyper i hypter-material-theme`
7. `hyper i hypterterm-1password`
8. `hyper i hyperterm-paste`
9. `hyper i hyperterm-tabs`
10. Copy `windows/.zshrc` file to home directory

For more hyper plugins, reference [this link](https://github.com/bnb/awesome-hyper).

Then install the following:

```
# install oh my zsh
sudo apt-get install zsh -y
sudo apt-get install git-core
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Save `.zshrc` file from `windows/.zshrc` in the home folder.

Finish installing packages for Jekyll

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

Install vim configs by using this repo and installing:

```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
git clone https://github.com/reedes/vim-pencil ~/.vim_runtime/my_plugins/vim-pencil
git clone https://github.com/vim-airline/vim-airline.git ~/.vim_runtime/my_plugins/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes.git ~/.vim_runtime/my_plugins/vim-airline-themes
git clone https://github.com/rakr/vim-one.git ~/.vim_runtime/my_plugins/vim-one
sudo apt-get install fonts-powerline -y
```
