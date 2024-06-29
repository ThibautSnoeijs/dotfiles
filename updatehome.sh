#!/bin/bash
IFS=$'\n'
for i in $(diff -q -r ./ ~ | awk '{ if ($1 != "Only") {print $2, $4} }'); do bash -c "diff -y $i; cp -i $i"; done
