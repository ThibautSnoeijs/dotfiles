#!/bin/bash
IFS=$'\n'

aliasesdir=$shrcdir/aliases

# This is for commands that you want to have the same flags by default
# Example: "ls" is in "--color=auto" so an alias will be "ls=ls --color=auto"
defaultsdir=$aliasesdir/defaults
[[ -d "$defaultsdir" ]]&& for a in $(ls -1 "$defaultsdir");do
	for L in $(sed "s/\s*#.*//g; /^$/ d" "$defaultsdir/$a");do
		alias $L="$L $a"
	done
done
unset defaultsdir

# This is for commands that you want to have run by other programs such as doas or sudo
# Example: "reboot" is in "sudo" so an alias will be "reboot=sudo reboot"
dodir=$aliasesdir/do
[[ -d "$dodir" ]]&& for a in $(ls -1 "$dodir");do
	for L in $(sed "s/\s*#.*//g; /^$/ d" "$dodir/$a");do
		alias $L="$a $L"
	done
done
unset dodir

unset IFS
unset aliasesdir

alias cls="clear"
