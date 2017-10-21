if [ ! `which peco` ];then
    return
fi

function peco-history() {
    local l=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
    READLINE_LINE=$l
    READLINE_POINT=${#l}
}
bind -x '"C-r": peco-history'

function peco-ssh() {
    local h=`cut -d' ' -f 1 $HOME/.ssh/known_hosts | tail -r | peco`
    READLINE_LINE="ssh $l"
    READLINE_POINT=${#READLINE_POINT}
}
bind -x '"C-s": peco-ssh'
