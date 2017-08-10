# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cobalt2"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

sn() {
    grep -rnwi "$HOME/Dropbox/Collections/notes" -e "$1" | sed s_$HOME'/Dropbox/Collections/'__ | grep -i "$1"
}

apply-naming-scheme() {
    # lowercase all folders
    find . -depth -type d -execdir rename -f 'y/A-Z/a-z/' {} \;
    # lowercase all files
    find . -depth -type f -execdir rename -f 'y/A-Z/a-z/' {} \;
    # replace spaces with hyphens for all folders
    find . -depth -type d -execdir rename 's/ /-/g' {} \;
    # replace spaces with hyphens for all files
    find . -depth -type f -execdir rename 's/ /-/g' {} \;
}

push-site() {
    rsync -v -rz -e ssh --checksum --delete _site/ $1@bobbywlindsey.com:public_html
}

jarvis-connect() {
    ssh bobby@$1 -p 22222
}

jn-connect() {
    ssh -N -L localhost:8888:localhost:8889 bobby@$1 -p 22222
}

alias db="cd ~/Dropbox/"
alias dls="cd ~/Downloads/"
alias notes="cd ~/Dropbox/Collections/notes"
alias blog="cd ~/GitProjects/bobbywlindsey"
alias dsi="cd ~/Dropbox/me/career/technipfmc/dsi"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias gum="git pull upstream master"
alias clipboard="pbcopy"
alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"

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

# override default Python
export PATH="$HOME/anaconda/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
