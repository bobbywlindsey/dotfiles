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
# install meteor
curl https://install.meteor.com/ | sh
# install js node pacakges for spacemacs support
npm install -g tern
npm install -g js-beautify
npm install -g jshint
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
cp .spacemacs ~/
