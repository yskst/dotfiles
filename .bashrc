# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1='\[\e\\\][\u@\h \W]\$ '

case "${OSTYPE}" in
darwin*) # For BSD
  alias ls='ls -BG'
  alias ll='ls -hGl'
  alias la='ls -aG'
  ;;
linux*) # For Gnu.
  alias ls='ls -B  --color=auto'
  alias ll='ls -lh --color=auto'
  alias la='ls -a  --color=auto'
esac

alias df='df -h'
alias du='du -h'
alias diff='diff -u -s'

if [ -f /usr/bin/gnome-terminal ]; then
    alias xterm='/usr/bin/gnome-terminal'
fi

source ~/.bashrc.d/func.bash
