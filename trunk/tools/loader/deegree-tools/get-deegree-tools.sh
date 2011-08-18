#!/bin/sh
# ----------------------------------------------------------------------------
# Simple script to fetch deegree-tools ready-to-use distro from Maven repository
# TODO
# A cleaner way would be to use a pom.xml and rely on standard Maven deps
#
# Just van den Broecke

. ./deegree-tools-version.sh

# for 3.1 and up
# e.g. http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-tools-base/3.1-pre11/deegree-tools-base-3.1-pre11.zip
wget http://artefacts.deegree.org/repo/org/deegree/deegree-tools-base/${DEEGREE_TOOLS_VERSION}/deegree-tools-base-${DEEGREE_TOOLS_VERSION}.zip

# pre 3.1
# e.g. http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-tools/3.0.4/deegree-tools-3.0.4.zip
# wget http://artefacts.deegree.org/libs-releases-local/org/deegree/deegree-tools/${DEEGREE_TOOLS_VERSION}/deegree-tools-${DEEGREE_TOOLS_VERSION}.zip