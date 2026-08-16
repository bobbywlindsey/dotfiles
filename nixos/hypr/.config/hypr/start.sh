#!/usr/bin/env bash

# Initialize wallpaper daemon
awww-daemon &
# Set wallpaper
awww img ~/Pictures/wallpaper.jpg &

# Initialize app launcher
elephant &
walker --gapplication-service > /dev/null 2>&1 &

# Export portal env vars
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_DATA_DIRS PATH

# Set mouse theme
hyprctl setcursor "Adwaita" 24

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

# Initialize voice-to-text daemon
#voxtype -q &

# Bar
waybar &
