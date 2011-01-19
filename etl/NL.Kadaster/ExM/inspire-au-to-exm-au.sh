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
$REPSTR 'xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0"' 'xmlns:AU="urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0" xmlns:XLAU="urn:x-exml:specification:gmlas:ExMLargeAdministrativeUnits:1.0"' $2
$REPSTR 'urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/AdministrativeUnits.xsd' 'urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/AdministrativeUnits.xsd urn:x-exml:specification:gmlas:ExMLargeAdministrativeUnits:1.0 http:\/\/schemas.kademo.nl\/esdin\/exmls\/1.0-fixed\/ExMLargeAdministrativeUnits.xsd' $2
$REPSTR 'AU:AdministrativeUnit' 'XLAU:AdministrativeUnit' $2
$REPSTR 'NL.KAD.AU' 'NL.KAD.EXML.AU' $2




