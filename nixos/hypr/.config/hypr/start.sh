#!/usr/bin/env bash

# Intialize wallpaper daemon
swww init &
# Set wallpaper
swww img ~/Pictures/wallpaper.jpg &

# Network manager outlet
nm-applet --indicator &

# Bar
waybar &

# Notification daemon
dunst
