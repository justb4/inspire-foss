#!/bin/bash
#
# Transforms Dutch local Hydrography to INSPIRE TN
#
# Author: Just van den Broecke
#

cd ..
./local-to-inspire-tn-ro-sd.sh test/top10-wegdeel-lijn.gml  test/tn-roadnetwork-curves.gml
./local-to-inspire-tn-ro-sd.sh test/top10-wegdeel-punt.gml  test/tn-roadnetwork-points.gml





