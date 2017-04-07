export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
export HOMESHICK_DIR=/usr/local/opt/homeshick

typeset -U path
path=(~/.local/bin /usr/local/sbin $path[@])
