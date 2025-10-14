#!/usr/bin/env bash

# Intialize wallpaper daemon
swww init &
# Set wallpaper
#swww img ~/wallpapers/image.png &

# Network manager outlet
nm-applet --indicator &

# Bar
waybar &

# Notification daemon
dunst
