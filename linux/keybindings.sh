#!/bin/sh

set -e

# Mac OS keybindings for screenshots using default gnome screenshot
#/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Shift><Alt>dollar']"
#/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Primary><Shift><Alt>dollar']"

# Release the binding on `Prt Sc`
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'

# Set keybinding for screenshots
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Area screenshot to clipboard'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Ctrl><Shift><Alt>dollar'"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'flatpak run org.flameshot.Flameshot gui'"

# Set default location for screenshots to Pictures
gsettings set org.gnome.gnome-screenshot auto-save-directory "/home/$USER/Desktop"

# Swap escape and caps lock keys
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Set keybindings for switching tabs in the terminal
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab "'<Alt>braceright'"
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab "'<Alt>braceleft'"
