#!/bin/sh
#
# Install the deegree-tools - must be executed in this dir
#

. ./deegree-tools-version.sh

# for 3.1+
NAME=deegree-tools-base-${DEEGREE_TOOLS_VERSION}

# < 3.1
# NAME=deegree-tools-${DEEGREE_TOOLS_VERSION}
/bin/rm -rf ${NAME}
unzip ${NAME}.zip
/bin/rm -rf bin repo

mv ${NAME}/bin ${NAME}/repo .

chmod +x bin/*
/bin/rm -rf ${NAME}



