#!/bin/bash
#
# Transforms Dutch local Addresses to INSPIRE AD
#
# Author: Just van den Broecke
#

cd ..
CMD=./local-to-inspire-ad-sd.sh

$CMD test/nlx-bag-adres-vbo.gml  test/ad-address-vbo.gml
$CMD test/nlx-bag-adres-sp.gml  test/ad-address-sp.gml
$CMD test/nlx-bag-adres-lp.gml  test/ad-address-lp.gml
$CMD test/nlx-bag-openbareruimte.gml  test/ad-thoroughfare.gml
$CMD test/nlx-bag-woonplaats.gml  test/ad-addressarea.gml
$CMD test/nlx-bag-postcode.gml  test/ad-postcode.gml




