#!/bin/bash
#
# Transform and load all test data
#
# Author: Just van den Broecke
#
#

../../shared/bin/delete-gml-objects.sh


# TN
cd ../TransportNetworks/test
./transform.sh
./load.sh
