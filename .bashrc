#!/bin/bash
export PATH=$PATH:$HOMEDIR/bin
[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
shopt -s histappend
PS1='\[\033[01;34m\]\w \[\033[00m\]\$ ' || PS1='\w \$ '
shrcdir=$HOMEDIR/.shrc/
for shrcfile in $(ls -p $shrcdir | grep -v / | grep .sh); do
  . $shrcdir"/"$shrcfile
done
