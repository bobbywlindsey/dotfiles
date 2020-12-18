#!/bin/sh

set -e

# Update everything
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade
pop-upgrade release upgrade

