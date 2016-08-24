# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias db="cd ~/Dropbox/"
alias zs="source ~/.zshrc"
alias gum="git pull upstream master"
alias emacs="/usr/local/opt/emacs/Emacs.app/Contents/MacOS/Emacs"

# include Z, yo
if [[ `uname` == 'Darwin' ]]; then
    . `brew --prefix`/etc/profile.d/z.sh
else
    . $HOME/z.sh
fi

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract osx copydir brew npm)

# User configuration
if [[ `uname` == 'Darwin' ]]; then
    export PATH="/Users/lindseb/anaconda/bin:/Users/lindseb/.rvm/gems/ruby-2.2.1/bin:/Users/lindseb/.rvm/gems/ruby-2.2.1@global/bin:/Users/lindseb/.rvm/rubies/ruby-2.2.1/bin:/Users/lindseb/anaconda/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/Users/lindseb/scripts_in_path:/Users/lindseb/.rvm/bin:/Users/lindseb/Dropbox/Me/University/Grad\ School/mathematics/stochastic_modeling"
else
    export PATH=""
fi

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
