# add locations to path variable
set -g -x PATH /usr/local/bin \
               $HOME/anaconda/bin \
$PATH

# set greeting message
set -g -x fish_greeting "Time to get shit done ᕦ(ò_óˇ)ᕤ"
# some bug in theme so force echo fish greeting
echo $fish_greeting

# aliases
alias dropbox="cd ~/Dropbox/"
alias dls="cd ~/Downloads/"
alias dsi="cd ~/Dropbox/me/career/technipfmc/dsi"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias projects="cd ~/GitProjects"
alias fs="source ~/.config/fish/config.fish"
alias efs="vim ~/.config/fish/config.fish"
alias clipboard="xclip -sel clip"
alias open="xdg-open > /dev/null 2>&1"
alias pycharm="charm&"
alias mm="sudo mount -t ntfs-3g -o ro /dev/sdd1 /media/Media"
alias jn-remote="jupyter-notebook --ip='*' --no-browser --port=8889"
alias wan="curl 'https://api.ipify.org'"
alias chrome="google-chrome"
alias github="google-chrome github.com/bobbywlindsey"

