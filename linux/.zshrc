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

new-project() {
    cp -r ~/GitProjects/data-science/project-template/helpers .
    cp -r ~/GitProjects/data-science/project-template/deeplearning .
    cp ~/GitProjects/data-science/project-template/project-template.ipynb .
}

build-prod-site() {
    cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey;
    JEKYLL_ENV=production bundle exec jekyll build;
}

build-dev-site() {
    cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey;
    bundle exec jekyll serve --drafts;
}

push-site() {
    rsync -v -rz -e ssh --checksum --delete ~/Dropbox/me/career/website-and-blog/bobbywlindsey/_site/ $1@bobbywlindsey.com:public_html
}

jarvis-connect() {
    ssh bobby@$1 -p 22222
}

jn-connect() {
    ssh -N -L localhost:8888:localhost:8889 bobby@$1 -p 22222
}

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

update-sys() {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
}

alias db="cd ~/Dropbox/"
alias dls="cd ~/Downloads/"
alias notes="cd ~/Dropbox/collections/notes"
alias blog="cd ~/Dropbox/me/career/website-and-blog/bobbywlindsey"
alias dsi="cd ~/Dropbox/me/career/technipfmc/dsi"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias projects="cd ~/GitProjects"
alias ds="cd ~/GitProjects/data-science/project-template"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias gum="git pull upstream master"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias pycharm="charm&"
alias mm="sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media"
alias jn-remote="jupyter-notebook --ip='*' --no-browser --port=8889"
alias update-sys="sudo ~/GitProjects/dotfiles/linux/update_sys.sh"
alias wan="curl 'https://api.ipify.org'"
alias create="touch"
alias vim="gvim -p --remote-tab-silent"
alias chrome="chromium-browser"

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
