# add locations to path variable
set -g -x PATH /usr/local/bin \
               $HOME/anaconda3/bin \
$PATH

# aliases
alias notes="cd /mnt/c/Users/Bobby/Dropbox/personal/notes"
alias dls="cd ~/Downloads/"
alias projects="cd ~/GitProjects"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias fs="source ~/.config/fish/config.fish"
alias efs="nvim ~/.config/fish/config.fish"
alias clipboard="xclip -sel clip"
alias wan="curl 'https://api.ipify.org'"
alias v="nvim"
alias vconfig="cd ~/.config/nvim/"

set LS_COLORS "ow=01;36;40" && export LS_COLORS
