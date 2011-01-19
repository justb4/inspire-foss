#!/bin/bash
#
# Transforms INSPIRE CP GML to ExM CP GML
#
# Author: Just van den Broecke
#
BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# Copy to target file and replace strings
cp $1 $2
$BASEDIR/bin/replace-string.sh 'xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"' 'xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0" xmlns:XCP="urn:x-exml:specification:gmlas:ExMLargeCadastralParcels:1.0"' $2
$BASEDIR/bin/replace-string.sh 'urn:x-inspire:specification:gmlas:CadastralParcels:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/CadastralParcels.xsd' 'urn:x-inspire:specification:gmlas:CadastralParcels:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/CadastralParcels.xsd urn:x-exml:specification:gmlas:ExMLargeCadastralParcels:1.0 http:\/\/schemas.kademo.nl\/esdin\/exmls\/1.0-fixed\/ExMLargeCadastralParcels.xsd' $2
$BASEDIR/bin/replace-string.sh 'CP:CadastralParcel' 'XCP:CadastralParcel' $2
$BASEDIR/bin/replace-string.sh 'NL.KAD.CP' 'NL.KAD.EXML.CP' $2




