#!/bin/bash
#
# Transforms Dutch local Addresses to INSPIRE AD
#
# Author: Just van den Broecke
#

cd ..
./local-to-inspire-ad-sd.sh test/bag-adres.gml  test/ad-address.gml
./local-to-inspire-ad-sd.sh test/bag-postcode.gml  test/ad-postcode.gml




