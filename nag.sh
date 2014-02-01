#!/bin/bash

# nag
# Using the basic structure outlined here: http://onethingwell.org/post/4441662022/nag-ii-unix-boogaloo
# --
#
# Creates a nag file if one isn't found.
if [ ! -f ~/.nag ]; then
	touch ~/.nag
	echo "No nag file found. Creating ~/.nag"
fi
# If no parameter is entered, the latest nag will show.
 [ $# -eq 0 ] && { head -1 ~/.nag; exit 1; }
#
nag=$1
rav=$2

nagrm() {
	sed -i ${1:-1}d ~/.nag
	}

if [ $nag = "ls" ]; then
	nl ~/.nag
elif [ $nag = "rm" ]; then
	nagrm $rav
	echo "nag $rav removed."
elif [ $nag = "add" ]; then
	echo -n "Add a nag: "
	read new
	echo $new >> ~/.nag
	echo "Added: $new"
elif [ $nag = "clr" ]; then
	echo "This will clear your nag file."
	read -p "Press ctrl+c to cancel or any other key to continue."
	true > ~/.nag
else
	echo "$nag is not a command. Usage: nag [ ls | add | rm # | clr ]"
fi
