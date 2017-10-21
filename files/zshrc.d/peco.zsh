if [ ! `which peco` ]; then
    return
fi


function peco-history() {
    local BUFFER=`history -n 1 | tail -r  | peco`
    local CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-ssh() {
    local HOST=`cut -d' ' -f1 $HOME/.ssh/known_hosts | tail -r | peco`
    if [ -n $HOST ];then
        BUFFER="ssh $HOST"
    fi
    zle reset-prompt
}
zle -N peco-ssh
bindkey '^S' peco-ssh
