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
nag=~/.nag

if [ $1 = "ls" ]; then
	nl $nag
elif [ $1 = "rm" ]; then
	sed -i -e $2'd' $nag
	echo "nag $2 removed."
elif [ $1 = "add" ]; then
	echo -n "Add a nag: "
	read new
	echo $new >> $nag
	echo "Added: $new"
elif [ $1 = "clr" ]; then
	echo "This will clear your nag file."
	read -p "Press ctrl+c to cancel or any other key to continue."
	true > $nag
else
	echo "$1 is not a command. Usage: nag [ ls | add | rm # | clr ]"
fi
