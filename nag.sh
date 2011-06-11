#!/bin/bash

# nag
# Using the basic structure outlined here: http://onethingwell.org/post/4441662022/nag-ii-unix-boogaloo
# --
#
# If no parameter is entered, usage info will display.
[ $# -eq 0 ] && { echo "Usage: nag ls, add, rm, 1, clr"; exit 1; }

nag=$1

if [ $nag = "ls" ]; then
	nagls
elif [ $nag = "rm"; then
	nagrm $2
elif [ $nag = "add"; then
	nagadd $2
elif [ $nag = "1"; then
	nag1
elif [ $nag = "clr"; then
	echo "Clear nag list?"
	echo "y/n"
	read yn
	if test $yn y; then
	nagclr
else
	echo "$nag is not a command."
	echo "Try just typing nag for usage info."
fi
