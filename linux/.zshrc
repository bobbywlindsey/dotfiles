# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

sn() {
    grep -rnwi "$HOME/Dropbox/collections/notes" -e "$1" | sed s_$HOME'/Dropbox/collections/'__ | grep -i "$1"
}

apply-naming-scheme() {
    # lowercase all folders
    find . -depth -type d -execdir rename 'y/A-Z/a-z/' {} \;
    # lowercase all files
    find . -depth -type f -execdir rename 'y/A-Z/a-z/' {} \;
    # replace spaces with hyphens for all folders
    find . -depth -type d -execdir rename 's/ /-/g' {} \;
    # replace spaces with hyphens for all files
    find . -depth -type f -execdir rename 's/ /-/g' {} \;
}

push-site() {
    rsync -v -rz --checksum --delete _site/ $1@bobbywlindsey.com:public_html
}


alias db="cd ~/Dropbox/"
alias dls="cd ~/Downloads/"
alias notes="cd ~/Dropbox/collections/notes"
alias blog="cd ~/GitProjects/bobbywlindsey"
alias dsi="cd ~/Dropbox/me/career/technipfmc/dsi"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias gum="git pull upstream master"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias pycharm="charm&"
alias mm="sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media"
alias jn-remote="jupyter-notebook --ip='*' --no-browser --port=8889"
alias update-sys="sudo ~/GitProjects/dotfiles/linux/update_sys.sh"

# include Z, yo
. $HOME/z.sh

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git extract copydir brew npm)

# User configuration
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

# load rbenv automatically
eval "$(rbenv init -)"
