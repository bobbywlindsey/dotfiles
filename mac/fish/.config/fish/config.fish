# Add locations to path variable
set -g -x PATH /usr/local/bin \
               /opt/homebrew/bin \
               ~/bin \
$PATH

# Set greeting message
set -g -x fish_greeting "Time to get shit done ᕦ(ò_óˇ)ᕤ"
# Some bug in theme so force echo fish greeting
echo $fish_greeting

# Aliases
alias v="nvim"
alias vim="nvim"
alias dls="cd ~/Downloads/"
alias projects="cd ~/GitProjects"
alias dotfiles="cd ~/GitProjects/dotfiles"
alias fs="source ~/.config/fish/config.fish"
alias efs="nvim ~/.config/fish/config.fish"
alias clipboard="pbcopy"
alias python="python3"
alias prettyjson='python -m json.tool'
