#!/bin/sh

set -e

basedir=$(dirname "$0")

# Get wireless adapter name
wireless_name=$(ls /sys/class/net | grep w)
# Turn off wireless
sudo ifconfig $wireless_name down
# Change mac address to random mac address
sudo macchanger -r $wireless_name
# Turn on wireless again
sudo ifconfig $wireless_name up

# Get random name from first-names.txt file
first_name=$(shuf -n 1 $basedir/first-names.txt | sed -e 's/[^a-z]//g')

sudo hostnamectl set-hostname $first_name
