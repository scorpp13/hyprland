#    _             _           
#   | |__  __ _ __| |_  _ _ __ 
#  _| '_ \/ _` (_-< ' \| '_/ _|
# (_)_.__/\__,_/__/_||_|_| \__|
#                              
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
PS1='
\e[1;35m\u\e[0;37m@\e[2;37m\h\e[0;37m: \e[0;36m\w
\e[1;34m=> \e[m'

# Aliases
if [ -f ~/.my_aliases ]; then
    . ~/.my_aliases
fi

# Run fastfetch on wm
echo ""
if [[ $(tty) == *"pts"* ]]; then
    fastfetch -c /usr/share/fastfetch/presets/examples/8.jsonc
fi

# Setting history file rules:
HISTCONTROL=ignorespace:ignoredups:erasedups

# history length and filesize
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# Enable bash to check the terminal size when it regains control
shopt -s checkwinsize
