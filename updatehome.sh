#!/bin/sh

OLDIFS=$IFS
IFS=$'
'

diffcommand="diff -rwB"

updatedifs() {
	for files in $(
			bash -c "$diffcommand $@" |
			grep -P "^\Q$diffcommand" |
			sed "s/$diffcommand //"
		)
		do bash -c "
			echo $files;
			diff -yd $files;
			cp -i $files"
		 done
}

echo Pulling git
git pull

echo Updating home from git repo
updatedifs "./ ~"

echo Updating git repo from home
updatedifs "~ ./"

git add --all .
git commit
git push

IFS=$OLDIFS
