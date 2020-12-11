# add locations to path variable
set -g -x PATH /usr/local/bin \
               $HOME/anaconda3/bin \
$PATH

# aliases
alias dropbox="cd ~/Dropbox/"
alias notes="cd ~/Dropbox/personal/notes"
alias dls="cd ~/Downloads/"
alias projects="cd ~/git_projects"
alias dotfiles="cd ~/git_projects/dotfiles"
alias fs="source ~/.config/fish/config.fish"
alias efs="nvim ~/.config/fish/config.fish"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias mm="sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media"
alias wan="curl 'https://api.ipify.org'"
alias chrome="google-chrome"
alias v="nvim"
alias vconfig="cd ~/.config/nvim/"

set pure_color_mute white
