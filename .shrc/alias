IFS=$'\n'

defaultsdir=~/.shrc/aliases/defaults/
[[ -d "$defaultsdir" ]]&& for a in $(ls -1 "$defaultsdir");do
	for L in $(sed "s/\s*#.*//g; /^$/ d" "$defaultsdir$a");do 
		alias $L="$L $a"
	done
done

other=~/.shrc/aliases/other
[[ -f "$other" ]]&& for L in $(sed "s/\s*#.*//g; /^$/ d" "$other");do 
	alias $(echo $L |cut -d'=' -f 1 )="$(echo $L |cut -d'=' -f 2- )"
done

unset IFS
unset other
unset defaultsdir
