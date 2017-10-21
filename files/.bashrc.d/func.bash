ssh() {
    domain=${@:-1:1}
    echo -en "\033];$domain\007"
    command ssh $@
}
