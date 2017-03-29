source "/usr/local/opt/homeshick/homeshick.sh"

ANTIGEN="$HOME/kitchen/antigen/antigen.zsh"
source $ANTIGEN

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle djui/alias-tips
antigen bundle psprint/zsh-cmd-architect
antigen bundle colored-man-pages
antigen bundle gpg-agent
antigen apply

# Initialise nix for this user
NIX="$HOME/.nix-profile/etc/profile.d/nix.sh"
if [ -e $NIX ]; then source $NIX; fi

# Set up direnv
eval "$(direnv hook zsh)"

# Use zsh powerline prompt
powerline-daemon -q
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

#function powerline_precmd() {
#    PS1="$(~/kitchen/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
#}
#
#function install_powerline_precmd() {
#    for s in "${precmd_functions[@]}"; do
#        if [ "$s" = "powerline_precmd" ]; then
#            return
#        fi
#    done
#    precmd_functions+=(powerline_precmd)
#}

#if [ "$TERM" != "linux" ]; then
#    install_powerline_precmd
#fi

# Set up iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Miscellaneous
function clean() {
    find . -name "*~" -exec rm "{}" +
    find . -name "#*#" -exec rm "{}" +
}

alias emacs='emacsclient -nw'

#
autoload bashcompinit
bashcompinit
source ~/.bash_completion.d/python-argcomplete.sh

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(_TMUXP_COMPLETE=source tmuxp)"

acd () {
    cd $1 && [ -x autoexec ] && ./autoexec
}
export PATH="/usr/local/sbin:$PATH"
alias colourize="pygmentize -f console256 -O full,style=paraiso-dark"
