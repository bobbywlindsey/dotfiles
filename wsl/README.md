Install prereqs

```sh
sudo apt install xclip
```

Install fish

```sh
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt update
sudo apt install fish -y
chsh -s /usr/bin/fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fish
fisher add rafaelrinaldi/pure
bash
mkdir -p ~/.config/fish/functions
cp ./fish/config.fish ~/.config/fish
cp -R ./fish/functions/. ~/.config/fish/functions/
```

Copy over jupyter config files.

Setup ssh keys, gitconfig, and aws profile.
