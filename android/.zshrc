# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

create-post() {
    title="$1"
    date="$(date +'%Y-%m-%d')"
    time="$(date +'%H:%M:%S') -0600"
    hyphened_title=${title// /-}
    lower_case_hyphened_title="$(echo $hyphened_title | tr '[A-Z]' '[a-z]')"
    file_name=$date-$lower_case_hyphened_title.md
    touch $file_name
    echo "---\nlayout: post\ncomments: true\ntitle: $title\ndescription: $2\ndate: $date $time\ncategories: [\"$3\"]\n---\n\n" >> $file_name
}

sn() {
    grep -rnwi "$HOME/storage/Android/data/com.dropbox.android/files/u21602247/scratch/collections/notes" -e "$1" | sed s_$HOME'/storage/Android/data/com.dropbox.android/files/u21602247/scratch/collections/'__ | grep -i "$1"
}

build-prod-site() {
    JEKYLL_ENV=production bundle exec jekyll build
}

build-dev-site() {
    bundle exec jekyll serve --drafts
}

push-site() {
    rsync -v -rz -e ssh --checksum --delete ~/Dropbox/me/career/website-and-blog/bobbywlindsey/_site/ $1@bobbywlindsey.com:public_html
}

alias dls="cd ~/Downloads/"
alias notes="cd ~/storage/Android/data/com.dropbox.android/files/u21602247/scratch/collections/notes"
alias blog="cd ~/storage/Android/data/com.dropbox.android/files/u21602247/scratch/me/career/website-and-blog/bobbywlindsey"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias projects="cd ~/GitProjects"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias gum="git pull upstream master"
alias clipboard="termux-clipboard-set"
alias update-sys="apt update && apt upgrade"
alias wan="curl 'https://api.ipify.org'"
alias create="touch"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
