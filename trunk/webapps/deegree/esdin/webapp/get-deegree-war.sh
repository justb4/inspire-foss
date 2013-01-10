#!/bin/sh
# ----------------------------------------------------------------------------
# Simple script to fetch and build deegree .war from ready-to-use distro from Maven repository
# TODO
# A cleaner way would be to use a pom.xml and rely on standard Maven deps
#
# Just van den Broecke

# for 3.1 and up
# e.g. http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-webservices/3.1-pre12/deegree-webservices-3.1-pre12.war

# change version whenever a new one is out
DISTRO_VERSION=3.2-pre6

DISTRO_BASE_URL=http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-webservices/
DISTRO_ZIP=deegree3.zip
DISTRO_NAME=deegree-webservices
DISTRO_DIR=${DISTRO_NAME}-${DISTRO_VERSION}
WAR_FILE=deegree3.war

/bin/rm -f ${DISTRO_ZIP}
/bin/rm -rf ${DISTRO_DIR}
/bin/rm -rf ${WAR_FILE}

wget -O ${WAR_FILE} ${DISTRO_BASE_URL}/${DISTRO_VERSION}/${DISTRO_NAME}-${DISTRO_VERSION}.war
# unzip ${DISTRO_ZIP}
# cd ${DISTRO_DIR}/webapps/root
# jar -cvf ../../../${WAR_FILE} *
# cd -
# ls




