#!/bin/sh
# ----------------------------------------------------------------------------
# Simple script to fetch deegree .war ready-to-use distro from Maven repository
# TODO
# A cleaner way would be to use a pom.xml and rely on standard Maven deps
#
# Just van den Broecke

# for 3.1 and up
# e.g. http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-webservices/3.1-pre11/deegree-webservices-3.1-pre11.war

WAR_BASE_URL=http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-webservices/
WAR_VERSION=3.1-pre11
WAR_FILE=deegree3.war

/bin/rm ${WAR_FILE}
wget -O ${WAR_FILE} ${WAR_BASE_URL}/${WAR_VERSION}/deegree-webservices-${WAR_VERSION}.zip



