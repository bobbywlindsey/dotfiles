#!/bin/sh

set -e

# Install ham radio software
sudo apt install gpsd -y # So we can get GPS from radio
flatpak install flathub com.w1hkj.flrig -y # To control the radio
sudo apt install js8call -y

# References
# https://www.youtube.com/watch?v=5mDHKcLASKU

