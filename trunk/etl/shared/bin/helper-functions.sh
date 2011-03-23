#!/bin/bash
#
# Common helper functions for etl shell scripts.
#
# Author: Just van den Broecke
#


# Log message to stdout
pr() {
    if [ -z "${1:-}" ]; then
        return 1
    fi
    echo -n " $@"
}

# Util: error mesg and exit
function error() {
	echo "ERROR: $1"
	exit -1
}

# Util: usage and exit
function usage() {
	echo "Usage: zip2services <klic_zip_file>"
	exit -1
}

# Util: print info
function pr() {
	echo "INFO: $1"
}



# Util: check if file exists
function checkFile() {
    if [ ! -f $1 ]
    then
        error "The file  $1 does not exist"
    fi
}

# Util: check if dir exists
function checkDir() {
    if [ ! -d $1 ]
    then
        error "The dir $1 does not exist"
    fi
}

# Util: check if var is not empty
function checkVar() {
    if [ ! -n $1 ]
    then
        error "The var $1 is empty"
    fi
}

