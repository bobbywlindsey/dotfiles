# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/bobby/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="clean"

sn() {
    grep -rnwi "/mnt/c/Users/Bobby/Dropbox/collections/notes" -e "$1" | sed s_$HOME'/Dropbox/collections/'__ | grep -i "$1"
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
    cp -r /mnt/c/Users/Bobby/GitProjects/data-science/project-template/helpers .
    cp -r /mnt/c/Users/Bobby/GitProjects/data-science/project-template/deeplearning .
    cp /mnt/c/Users/Bobby/GitProjects/data-science/project-template/project-template.ipynb .
}

build-prod-site() {
    cd /mnt/c/Users/Bobby/Dropbox/Me/Career/website-and-blog/bobbywlindsey;
    JEKYLL_ENV=production bundle exec jekyll build;
}

build-dev-site() {
    cd /mnt/c/Users/Bobby/Dropbox/Me/Career/website-and-blog/bobbywlindsey;
    bundle exec jekyll serve --drafts;
}

push-site() {
    rsync -v -rz -e ssh --checksum --delete mnt/c/Users/Bobby/Dropbox/me/career/website-and-blog/bobbywlindsey/_site/ $1@bobbywlindsey.com:public_html
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

alias db="cd /mnt/c/Users/Bobby/Dropbox/"
alias dls="cd /mnt/c/Users/Bobby/Downloads/"
alias notes="cd /mnt/c/Users/Bobby/Dropbox/collections/notes"
alias blog="cd /mnt/c/Users/Bobby/Dropbox/Me/Career/website-and-blog/bobbywlindsey"
alias dsi="cd /mnt/c/Users/Bobby/Dropbox/Me/Career/technipfmc/dsi"
alias dotfiles="cd /mnt/c/Users/Bobby/GitProjects/dotfiles"
alias projects="cd /mnt/c/Users/Bobby/GitProjects"
alias ds="cd /mnt/c/Users/Bobby/GitProjects/data-science/project-template"
alias zs="source ~/.zshrc"
alias ezs="vim ~/.zshrc"
alias gum="git pull upstream master"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias jn-remote="jupyter-notebook --ip='*' --no-browser --port=8889"
alias update-sys="sudo /mnt/c/Users/Bobby/GitProjects/dotfiles/linux/update_sys.sh"
alias wan="curl 'https://api.ipify.org'"
alias create="touch"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"
