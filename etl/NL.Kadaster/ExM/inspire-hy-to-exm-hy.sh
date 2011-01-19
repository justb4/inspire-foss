#!/bin/bash
#
# Transforms INSPIRE HY GML to ExM HY GML
#
# Author: Just van den Broecke
#
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`
REPSTR=$BASEDIR/bin/replace-string.sh

# Copy to target file and replace strings
cp $1 $2
$REPSTR 'xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0"' 'xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0" xmlns:XHY-P="urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/HydroPhysicalWaters.xsd' 'urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/HydroPhysicalWaters.xsd urn:x-exml:specification:gmlas:ExMLargePhysicalWaters:1.0 http:\/\/schemas.kademo.nl\/esdin\/exmls\/1.0-fixed\/ExMLargePhysicalWaters.xsd' $2
$REPSTR 'NL.KAD.HY' 'NL.KAD.EXML.HY' $2
$REPSTR 'HY-P:Lock' 'XHY-P:Lock' $2
$REPSTR 'HY-P:Watercourse' 'XHY-P:Watercourse' $2
$REPSTR 'HY-P:DamOrWeir' 'XHY-P:DamOrWeir' $2
$REPSTR 'HY-P:StandingWater' 'XHY-P:StandingWater' $2





