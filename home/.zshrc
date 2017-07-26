export TERM="xterm-256color"
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

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
source /usr/local/etc/bash_completion.d/python-argcomplete.sh

# Ensure gpg-agent starts
if ! pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
    gpg-connect-agent /bye >/dev/null 2>&1
fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(_TMUXP_COMPLETE=source tmuxp)"

acd () {
    cd $1 && [ -x autoexec ] && ./autoexec
}
colourize () {
    pygmentize -f console256 -O full,style=paraiso-dark "$1" | less -R
}
#alias colourize="pygmentize -f console256 -O full,style=paraiso-dark"

export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir anaconda virtualenv vcs)

docker-gc() {
    docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc:ro spotify/docker-gc
}

dir() {
    exa --long --git --extended $@
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/opt/elasticsearch@2.4/bin:$PATH"
alias diary="emacs ~/Documents/diary.org"
USER_EMAIL="$(git config user.email)"
lpass login "$USER_EMAIL"
