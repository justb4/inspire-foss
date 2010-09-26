#!/bin/bash
#
# Transforms Dutch local Cadastral Parcels to INSPIRE CP
#
# Author: Just van den Broecke
#


BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

# use the common script
$BASEDIR/bin/xslt.sh $BASEDIR/CadastralParcels/local-to-inspire-cp-sd.xsl $1  $2


