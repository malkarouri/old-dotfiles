export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
export HOMESHICK_DIR=/usr/local/opt/homeshick

# Set up Python paths
typeset -U path
path=(~/.local/bin ~/miniconda3/bin $path[@])

# Set up Rust path
path=(~/.cargo/bin $path[@])

# Set up Nim paths
path=(~/apps/nim/bin ~/.nimble/bin $path[@])
