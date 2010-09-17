#!/bin/sh
# ----------------------------------------------------------------------------
# Simple script to fetch deegree-tools ready-to-use distro from Maven repository
# TODO
# A cleaner way would be to use a pom.xml and rely on standard Maven deps
#
# Just van den Broecke

. ./deegree-tools-version.sh
wget http://artefacts.deegree.org/repo/org/deegree/deegree-tools/${DEEGREE_TOOLS_VERSION}/deegree-tools-${DEEGREE_TOOLS_VERSION}.zip
