# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade
brew install curl
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install emacs
brew install emacs --HEAD --with-cocoa --srgb
brew linkapps emacs
brew install aspell --lang=en
brew install coreutils
brew install z
