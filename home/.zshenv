export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
export HOMESHICK_DIR=/usr/local/opt/homeshick
export TTC_APIKEYS=false
export TTC_REPOS=~/Projects
export MONO_GAC_PREFIX="/usr/local"

typeset -U path
path=(~/.local/bin ~/bin /usr/local/sbin $path[@])
path=($path[@] /usr/local/opt/go/libexec/bin)
