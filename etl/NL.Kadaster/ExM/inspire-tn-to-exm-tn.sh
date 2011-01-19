#!/bin/bash
#
# Transforms INSPIRE TN GML to ExM TN GML
#
# Author: Just van den Broecke
#
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`
REPSTR=$BASEDIR/bin/replace-string.sh

# Copy to target file and replace strings
cp $1 $2
$REPSTR 'xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0"' 'xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0" xmlns:XLTN-R="urn:x-exml:specification:gmlas:ExMLargeRoadTransportNetwork:1.0"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/RoadTransportNetwork.xsd' 'urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/RoadTransportNetwork.xsd urn:x-exml:specification:gmlas:ExMLargeRoadTransportNetwork:1.0 http:\/\/schemas.kademo.nl\/esdin\/exmls\/1.0-fixed\/ExMLargeRoadTransportNetwork.xsd' $2
$REPSTR 'NL.KAD.TN' 'NL.KAD.EXML.TN' $2
$REPSTR 'TN-RO:RoadLink' 'XLTN-R:RoadLink' $2
$REPSTR 'TN-RO:RoadNode' 'XLTN-R:RoadNode' $2
$REPSTR 'TN-RO:RoadArea' 'XLTN-R:RoadArea' $2





