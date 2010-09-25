#!/bin/bash
#
# Transforms with XSLT
#
# Author: Just van den Broecke
#

# Transformation
function transform() {
    echo "xsltproc $1 $2 $3"

    # do the work
    # xsltproc -v --timing local-to-inspire-au-sd.xsl $1
    # may use "nice"
    
    xsltproc $1 $2  > $3
    echo "xsltproc $1 $2 $3 DONE"
}


transform $1 $2 $3



