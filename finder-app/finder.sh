#!/bin/bash

if [ $# -lt 2 ]
then
	echo "need more parameters"

	exit 1
else
	if [ ! -d $1 ]
	then
		echo $1 is not a directory

		exit 1
	else
		file_count=$( find $1 -type f -printf x | wc -c )
		line_count=$( grep -r $2 $1 | wc -l )

		echo The number of files are $file_count and the number of matching lines are $line_count
	fi
fi
