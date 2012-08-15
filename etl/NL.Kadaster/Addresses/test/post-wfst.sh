#!/bin/sh
# . settings.sh

export AUTH="deegree:deegree"
export TARGET_BASE="http://localhost:8080/services"

TARGET=wfs-inspire-ad
RESOURCE=wfs-t-example.xml

curl -v -L -u $AUTH -X POST --header 'Content-type: text/xml' -d@$RESOURCE  $TARGET_BASE/$TARGET
