#!/bin/sh

set -e

# Enable firewall
sudo ufw enable
# Install rootkit checker
sudo apt install chkrootkit -y
# Install graphical ufw
sudo apt install gufw -y
