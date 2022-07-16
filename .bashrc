#!/bin/bash
HISTCONTROL=ignoreboth
shopt -s histappend
PS1='\[\033[01;34m\]\w \[\033[00m\]\$ ' || PS1='\w \$ '
. ~/.shrc/alias
