#!/bin/sh
IFS=$'
'
echo Pulling git
git pull
echo Finding difs
diffcommand="diff -rewB"
echo Updating home from git repo
difs=$(bash -c "$diffcommand ./ ~" | grep -P "^\Q$diffcommand" | sed "s/$diffcommand //")
for files in $difs; do bash -c "echo $files; diff -y $files; cp -i $files"; done
echo Updating git repo from home
for files in $(echo $difs | awk '{print $2, $1}'); do bash -c "echo $files; diff -y $files; cp -i $files"; done
git add --all .
git commit
git push
