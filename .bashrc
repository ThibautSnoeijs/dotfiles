#!/bin/bash
export PATH=$PATH:~/.local/bin
[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
shopt -s histappend
PS1='\[\033[01;34m\]\w \[\033[00m\]\$ '
shrcdir=~/.shrc/
for shrcfile in $(ls -p $shrcdir | grep -v / | grep .sh);do
. $shrcdir"/"$shrcfile
done
HISTFILESIZE=
HISTSIZE=
HISTFILEFORMAT="[%F %T] "
unset MAILCHECK
eval "$(dircolors ~/.dircolors)"
if pstree -s -p $$ | grep -c '\-sshd(' >/dev/null; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[00m\]\$ '
else
    PS1='\[\033[01;34m\]\w \[\033[00m\]\$ '
fi

