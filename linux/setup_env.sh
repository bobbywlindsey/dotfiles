#!/bin/sh

# NOTE: update hardcoded links before running script to get latest version of software

set -e

# update everything
sudo apt update
sudo apt upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# setup environment
sudo ./install-other-utilities-and-apps.sh
sudo ./install-shell-environment.sh
sudo ./install-text-editors.sh
sudo ./install-theme.sh
sudo ./install-languages-and-frameworks.sh
