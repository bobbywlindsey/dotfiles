# install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# update Homebrew
brew update
brew upgrade
brew install curl
brew install global
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install emacs
brew install emacs --HEAD --with-cocoa --srgb
brew linkapps emacs
brew install aspell --lang=en
brew install coreutils
brew install z
brew install node
# install meteor
curl https://install.meteor.com/ | sh
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
