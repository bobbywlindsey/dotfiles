#!/usr/bin/env bash

# Bar
waybar &

# Intialize wallpaper daemon
swww init &
# Set wallpaper
swww img ~/Pictures/wallpaper.jpg &

# Set mouse theme
hyprctl setcursor "Catppuccin Mocha Dark" 24

# Notification daemon
dunst &

# Automount external storage
udiskie &

# Launch gnome-keyring-daemon
/usr/bin/gnome-keyring-daemon --start --components=secrets,ssh,pcks11

# Idle daemon
hypridle &

# Network manager outlet
nm-applet --indicator &

# Get playerctl to work with MPD
mpDris2 --music-dir=~/Music &
