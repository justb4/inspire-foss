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
$BASEDIR/bin/replace-string.sh 'xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"' 'xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0" xmlns:XCP="urn:x-exm:specification:gmlas:ExMCadastralParcels:0.4"' $2
$BASEDIR/bin/replace-string.sh 'urn:x-inspire:specification:gmlas:CadastralParcels:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/CadastralParcels.xsd' 'urn:x-inspire:specification:gmlas:CadastralParcels:3.0 http:\/\/schemas.kademo.nl\/inspire\/v3.0.1\/CadastralParcels.xsd urn:x-exm:specification:gmlas:ExMCadastralParcels:0.4 http:\/\/schemas.kademo.nl\/esdin\/exm\/v0.4\/ExMCadastralParcels.xsd' $2
$BASEDIR/bin/replace-string.sh 'CP:CadastralParcel' 'XCP:CadastralParcel' $2
$BASEDIR/bin/replace-string.sh 'NL.KAD.CP' 'NL.KAD.EXM.CP' $2




