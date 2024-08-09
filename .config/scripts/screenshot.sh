#!/bin/sh
#  ___                 ___ _        _   
# / __| __ _ _ ___ ___/ __| |_  ___| |_ 
# \__ \/ _| '_/ -_) -_)__ \ ' \/ _ \  _|
# |___/\__|_| \___\___|___/_||_\___/\__|
#                                       

DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option2="Selected area"
option3="Fullscreen (delay 3 sec)"
option4="Current display (delay 3 sec)"

options="$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-screenshot.rasi -i -no-show-icons -l 3 -width 30 -p "Take Screenshot")

case $choice in
    $option2)
        grim -g "$(slurp)" "$DIR$NAME"
        xclip -selection clipboard -t image/png -i "$DIR$NAME"
        notify-send "Screenshot created" "Mode: Selected area"
        swappy -f "$DIR$NAME"
    ;;
    $option3)
        sleep 3
        grim "$DIR$NAME"
        xclip -selection clipboard -t image/png -i "$DIR$NAME"
        notify-send "Screenshot created" "Mode: Fullscreen"
        swappy -f "$DIR$NAME"
    ;;
    $option4)
    	sleep3
    	monitor="$(hyprctl monitors | awk '/Monitor/{monitor=$2} /focused: yes/{print monitor; exit}')"
    	grim -o "$monitor" "$DIR$NAME"
    	xclip -selection clipboard -t image/png -i "$DIR$NAME"
    	notify-send "Screenshot created and copied to clipboard" "Mode: Fullscreen"
    	swappy -f "$DIR$NAME"
    ;;
esac
