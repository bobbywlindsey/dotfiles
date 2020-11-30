# add locations to path variable
set -g -x PATH /usr/local/bin \
               /anaconda3/bin \
               ~/bin \
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
alias clipboard="pbcopy"
alias blog="cd ~/GitProjects/bobbywlindsey"
alias prettyjson='python -m json.tool'
thefuck --alias fuck | source

source /anaconda3/etc/fish/conf.d/conda.fish
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# eval (eval /anaconda3/bin/conda "shell.fish" "hook" $argv)
# <<< conda initialize <<<

