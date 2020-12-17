#!/bin/sh

set -e

# Mac OS keybindings for screenshots
#/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot "['<Shift><Alt>dollar']"
#/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Primary><Shift><Alt>dollar']"


/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
# Set keybinding for screenshots
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "'Area screenshot to clipboard'"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "'<Ctrl><Shift><Alt>dollar'"
/usr/bin/gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "'maim -s | xclip -selection clipboard -t image/png'"

# Set default location for screenshots to Pictures
/usr/bin/gsettings set org.gnome.gnome-screenshot auto-save-directory "/home/$USER/Desktop"

# Swap escape and caps lock keys
/usr/bin/gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"

# Set keybindings for switching tabs in the terminal
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ next-tab "'<Alt>braceright'"
/usr/bin/gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ prev-tab "'<Alt>braceleft'"
