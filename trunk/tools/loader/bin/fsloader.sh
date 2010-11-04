#!/bin/sh
if(test -z $5) then
  echo "Usage: fsloader.sh <fsName> <jdbcName> <gmlVersion> <idGenMode> <dataset>"
  return
fi

BASEDIR=`dirname $0`/..
BASEDIR=`(cd "$BASEDIR"; pwd)`

WORKSPACE=$BASEDIR/../../webapps/deegree3/src/main/webapp/WEB-INF/workspace
FS_CONFIG_FILE=${WORKSPACE}/datasources/feature/${1}.xml
JDBC_CONFIG_FILE=${WORKSPACE}/jdbc/${2}.xml
GML_VERSION=${3}
IDGEN_MODE=${4}
DATASET=${5}

export JAVA_OPTS="-Xms128m -Xmx1024m"

echo $FS_CONFIG_FILE $JDBC_CONFIG_FILE $GML_VERSION $IDGEN_MODE $DATASET

$BASEDIR/deegree-tools/bin/d3toolbox FeatureStoreLoader -action insert -dataset ${DATASET} -format ${GML_VERSION} -fsconfig ${FS_CONFIG_FILE} -idgen ${IDGEN_MODE} -jdbcconfig ${JDBC_CONFIG_FILE}
