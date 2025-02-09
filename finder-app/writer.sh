#!/bin/bash

if [ $# -lt 2 ]
then
	echo "Not enough arguments"

	exit 1
else
	directory=$( dirname $1 )
	if [ ! -d $directory ]
	then
		mkdir -p $directory
	fi

	echo $2 > $1

	if [ $? -eq 1 ]
	then
		echo "Couldn't create file"

		exit 1
	fi
fi
