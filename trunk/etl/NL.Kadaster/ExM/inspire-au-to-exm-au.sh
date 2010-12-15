#!/bin/bash
#
# Transforms INSPIRE GN GML to ExM AU GML
#
# Author: Just van den Broecke
#
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`
REPSTR=$BASEDIR/bin/replace-string.sh

# Copy to target file and replace strings
cp $1 $2
$REPSTR 'xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0"' 'xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0" xmlns:XAU="urn:x-exm:specification:gmlas:ExMAdministrativeUnits:0.4"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/AdministrativeUnits.xsd' 'urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/AdministrativeUnits.xsd urn:x-exm:specification:gmlas:ExMAdministrativeUnits:0.4 http:\/\/schemas.kademo.nl\/esdin\/exm\/v0.4\/ExMAdministrativeUnits.xsd' $2
$REPSTR 'AU:AdministrativeUnit' 'XAU:AdministrativeUnit' $2
$REPSTR 'NL.KAD.AU' 'NL.KAD.EXM.AU' $2




