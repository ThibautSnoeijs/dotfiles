#!/bin/sh
IFS=$'\n'
git pull
echo Updating home from git repo
for i in $(diff -q -r ./ ~ | awk '{ if ($1 != "Only") {print $2, $4} }'); do bash -c "diff -y $i; cp -i $i"; done
echo Updating git repo from home
for i in $(diff -q -r ./ ~ | awk '{ if ($1 != "Only") {print $4, $2} }'); do bash -c "diff -y $i; cp -i $i"; done
git add --all .
git commit
git push
