export TERM="xterm-256color"
source "/usr/local/opt/homeshick/homeshick.sh"

ANTIGEN="$HOME/kitchen/antigen/antigen.zsh"
source $ANTIGEN

antigen use oh-my-zsh

# Set up direnv
eval "$(direnv hook zsh)"

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle djui/alias-tips
antigen bundle psprint/zsh-cmd-architect
antigen bundle colored-man-pages
antigen bundle gpg-agent
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

# Use zsh powerline prompt
powerline-daemon -q
source "$(pip show powerline-status | grep Location | awk '{ print $2}')/powerline/bindings/zsh/powerline.zsh"

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
alias colourize="pygmentize -f console256 -O full,style=paraiso-dark"

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir anaconda virtualenv vcs)

