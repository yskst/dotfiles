if [ ! `which peco` ];then
    return
fi

tac='tac'
if [ `uname` = 'darwin' ];then
    tac='tail -r'
fi

function peco-history() {
    local l=`history -n 1 | $tac | peco`
    READLINE_LINE=$l
    READLINE_POINT=${#l}
}
bind -x '"\C-r": peco-history'

function peco-ssh() {
    local h=`cut -d' ' -f 1 $HOME/.ssh/known_hosts | $tac | peco`
    READLINE_LINE="ssh $l"
    READLINE_POINT=${#READLINE_POINT}
}
bind -x '"\C-s": peco-ssh'
