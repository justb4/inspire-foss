#!/bin/sh
if(test -z $1) then
  echo "Usage: post-xml.sh <server> <files>"
  return
fi

for file
do
  if(test "$1" = "$file") then
    continue
  fi
  curl -d@"$file" -H"Content-Type: text/xml" "$1" | xmllint --format -
done
