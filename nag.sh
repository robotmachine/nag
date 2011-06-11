#!/bin/bash

# nag
# Using the basic structure outlined here: http://onethingwell.org/post/4441662022/nag-ii-unix-boogaloo
# --
#
# If no parameter is entered, usage info will display.
[ $# -eq 0 ] && { echo "Usage: nag ls, rm, add, clr, 1"; exit 1; }

nag=$1
rav=$2

if [ $nag = "ls" ]; then
	nl ~/.nag
elif [ $nag = "rm" ]; then
	sed -i '$ravd' ~/.nag
elif [ $nag = "add" ]; then
	echo $rav >> ~/.nag
elif [ $nag = "1" ]; then
	head -1 ~/.nag
elif [ $nag = "clr" ]; then
	echo "This will clear your nag file."
	read -p "Press ctrl+c to cancel or any other key to continue."
	true > ~/.nag
else
	echo "$nag is not a command. Try just typing nag for usage info."
fi
