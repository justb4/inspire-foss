#!/bin/bash
#
# Replace strings in file.
#
# Author: Just van den Broecke
#
targetFile=$3
tempFile=/tmp/repl.$$

echo "Replace $1 with $2 in $targetFile"
sed -e "s/$1/$2/g" $targetFile > $tempFile

mv $tempFile $targetFile

