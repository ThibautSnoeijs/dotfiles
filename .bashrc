#!/bin/bash
export PATH=$PATH:~/.local/bin
[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
shopt -s histappend
PS1='\[\033[01;34m\]\w \[\033[00m\]\$ ' || PS1='\w \$ '
shrcdir=~/.shrc/
for shrcfile in $(ls -p $shrcdir | grep -v / | grep .sh);do
. $shrcdir"/"$shrcfile
done
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="[%F %T] "
