#!/bin/sh   
#   ___ _           _   _   _          _      _          
#  / __| |_  ___ __| |_| | | |_ __  __| |__ _| |_ ___ ___
# | (__| ' \/ -_) _| / / |_| | '_ \/ _` / _` |  _/ -_|_-<
#  \___|_||_\___\__|_\_\\___/| .__/\__,_\__,_|\__\___/__/
#                            |_|                         

threshhold_zero=-1
threshhold_green=0
threshhold_yellow=20
threshhold_red=100

# Requires pacman-contrib & trizen
# Calculate available updates
if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi
if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
    updates_aur=0
fi
updates=$(("$updates_arch" + "$updates_aur"))

# Output .json format for Waybar Module custom-updates
css_class="zero"
if [ "$updates" -gt $threshhold_green ]; then
    css_class="green"
fi
if [ "$updates" -gt $threshhold_yellow ]; then
    css_class="yellow"
fi
if [ "$updates" -gt $threshhold_red ]; then
    css_class="red"
fi
if [ "$updates" -gt $threshhold_zero ]; then
    printf '{"text": "%s", "alt": "%s", "tooltip": "%s Updates", "class": "%s"}' "$updates" "$updates" "$updates" "$css_class"
else
    printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "zero"}'
fi
