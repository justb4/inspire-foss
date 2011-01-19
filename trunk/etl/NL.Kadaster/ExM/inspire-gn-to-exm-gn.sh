#!/bin/bash
#
# Transforms INSPIRE GN GML to ExM GN GML
#
# Author: Just van den Broecke
#
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`
REPSTR=$BASEDIR/bin/replace-string.sh

# Copy to target file and replace strings
cp $1 $2
$REPSTR 'xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"' 'xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0" xmlns:XGN="urn:x-exml:specification:gmlas:ExMLargeGeographicalNames:1.0"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/GeographicalNames.xsd' 'urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/GeographicalNames.xsd urn:x-exml:specification:gmlas:ExMLargeGeographicalNames:1.0 http:\/\/schemas.kademo.nl\/esdin\/exmls\/1.0-fixed\/ExMLargeGeographicalNames.xsd' $2
$REPSTR 'GN:NamedPlace' 'XGN:NamedPlace' $2
$REPSTR 'NL.KAD.GN' 'NL.KAD.EXML.GN' $2




