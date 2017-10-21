function ssh() {
    host=$@[-1]
    echo -ne "\ek$host\e\\"
    command ssh $@
}
