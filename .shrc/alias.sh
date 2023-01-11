#!/bin/bash
IFS=$'\n'

aliasesdir=$shrcdir/aliases

# This is for commands that you want to have the same flags by default
# Example: "ls" is in "--color=auto" so an alias will be "alias ls=ls --color=auto"
defaultsdir=$aliasesdir/defaults
[[ -d "$defaultsdir" ]]&& for a in $(ls -1 "$defaultsdir");do
	for L in $(sed "s/\s*#.*//g; /^$/ d" "$defaultsdir/$a");do 
		alias $L="$L $a"
	done
done

unset IFS
unset defaultsdir
unset aliasesdir

# Put other aliases here
alias boottime='cowsay $( echo boottime is && sudo dmesg | grep "New seat" | cut -d"]" -f 1 | rev | cut -d" " -f 1 | rev && echo seconds ) | lolcat'
