# add locations to path variable
set -g -x PATH /usr/local/bin \
               $HOME/anaconda3/bin \
               $HOME/opt \
$PATH

# aliases
alias dropbox="cd ~/Dropbox/"
alias notes="cd ~/Dropbox/personal/notes"
alias dls="cd ~/Downloads/"
alias projects="cd ~/git_projects"
alias dotfiles="cd ~/git_projects/dotfiles"
alias blog="cd ~/git_projects/bobbywlindsey"
alias fs="source ~/.config/fish/config.fish"
alias efs="nvim ~/.config/fish/config.fish"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias mm="sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media"
alias wan="curl 'https://api.ipify.org'"
alias chrome="google-chrome"
alias v="nvim"
alias vconfig="cd ~/.config/nvim/"
alias sudo="sudo "
alias links="python ~/opt/get_links.py"
alias llinks="python ~/opt/get_links_of_links.py"
alias search="python ~/opt/search.py"
alias clean_image="exiftool -all= "

set pure_color_mute white
