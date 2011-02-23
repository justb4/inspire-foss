#!/bin/bash
#
# Transforms Dutch local Topo (Top10NL) to INSPIRE GN
#
# Author: Just van den Broecke
#

cd ..
./local-to-inspire-gn-sd.sh test/functioneel_gebied.gml  test/functioneel_gebied-gn.gml

./local-to-inspire-gn-sd.sh test/geografisch_gebied.gml  test/geografisch_gebied-gn.gml

./local-to-inspire-gn-sd.sh test/inrichtings_element.gml  test/inrichtings_element-gn.gml

./local-to-inspire-gn-sd.sh test/wegdeel.gml  test/wegdeel-gn.gml




