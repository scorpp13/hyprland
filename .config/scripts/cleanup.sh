#!/bin/sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NONE='\033[0m'

echo -e "${YELLOW}"
cat <<"EOF"
┏┓┓ ┏┓┏┓┳┓
┃ ┃ ┣ ┣┫┃┃
┗┛┗┛┗┛┛┗┛┗
EOF

if gum confirm "Start CleanUp right now?" ;then
    echo -e "${GREEN}"
    echo "System CleanUp started..."
    echo -e "${NONE}"
    yay -Yc
    sudo pacman -Rsn $(pacman -Qqdt) --color always
    echo ""
    sudo journalctl --vacuum-size=20M --vacuum-time=5days
    echo ""
    sudo paccache -rvu -k 1
    echo ""
    sudo paccache -rv -k 3
    sleep 1
elif [ $? -eq 130 ]; then
        exit 130
else
    exit;
fi
notify-send "CleanUp finished"
