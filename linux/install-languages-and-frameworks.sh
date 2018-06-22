#!/bin/sh

set -e

# make node command compatible
sudo ln -s /usr/bin/nodejs /usr/bin/node
# install shell script to check internet speed
npm install --global fast-cli
# install shell script to find emojis
npm install --global emoj
# install pure prompt
npm install --global pure-prompt
