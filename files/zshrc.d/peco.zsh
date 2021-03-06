if [ ! `which peco` ]; then
    return
fi

tac='tac'
if [ `uname` = 'Darwin' ];then
    tac='tail -r'
fi

function peco-history() {
    local BUFFER="`history -n 1 | eval $tac | peco`"
    local CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history
bindkey '^R' peco-history

function peco-ssh() {
    local h="`cut -d' ' -f1 $HOME/.ssh/known_hosts | eval $tac | tr ',' '\n'| peco --prompt 'ssh> '`"
    if [ -n $h ];then
        BUFFER="ssh $h"
    fi
    zle reset-prompt
}
zle -N peco-ssh
bindkey '^J' peco-ssh
