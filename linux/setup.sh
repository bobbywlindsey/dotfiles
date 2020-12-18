#!/bin/sh

set -e

bash update-system.sh 
bash developer.sh
bash media.sh
bash keybindings.sh
bash security.sh
bash aesthetics.sh
