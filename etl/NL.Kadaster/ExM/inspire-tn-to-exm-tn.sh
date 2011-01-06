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
$REPSTR 'xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0"' 'xmlns:TN-RO="urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0" xmlns:XTN-RO="urn:x-exm:specification:gmlas:ExMRoadTransportNetwork:0.4"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/RoadTransportNetwork.xsd' 'urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/RoadTransportNetwork.xsd urn:x-exm:specification:gmlas:ExMRoadTransportNetwork:0.4 http:\/\/schemas.kademo.nl\/esdin\/exm\/v0.4-fixed\/ExMRoadTransportNetwork.xsd' $2
$REPSTR 'NL.KAD.TN' 'NL.KAD.EXM.TN' $2
$REPSTR 'TN-RO:RoadLink' 'XTN-RO:RoadLink' $2
$REPSTR 'TN-RO:RoadNode' 'XTN-RO:RoadNode' $2
$REPSTR 'TN-RO:RoadArea' 'XTN-RO:RoadArea' $2





