# Install Homebrew as MacOS package manager
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Update
brew update
brew upgrade

# Install packages
brew install \
    --cask alacritty \
    stow \
    neovim \
    font-meslo-lg-nerd-font \
    ripgrep \
    --cask rectangle \
    fish \
    python \
    --cask karabiner-elements \
    tmux \

# Stow
stow -t ~/ nvim
stow -t ~/ alacritty
stow -t ~/ fish

# Fish config
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher add rafaelrinaldi/pure

# Install Alacritty themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmuxifier
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
