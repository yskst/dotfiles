function ssh() {
    host=$@[-1]
    echo -ne "\ek$host\e\\"
    command ssh $@
}

function gcd() {
    if ! git rev-parse --is-inside-work-tree >/dev/null; then
        return 1
    fi
    cd `git rev-parse --show-cdup`$1
}
