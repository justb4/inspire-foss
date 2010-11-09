#!/bin/bash
#
# Transforms Dutch local Hydrography to INSPIRE HY
#
# Author: Just van den Broecke
#

cd ..
./local-to-inspire-hy-sd.sh test/top10-waterdeel-vlak.gml  test/hydrography-surfaces.gml
./local-to-inspire-hy-sd.sh test/top10-waterdeel-lijn.gml  test/hydrography-curves.gml
./local-to-inspire-hy-sd.sh test/top10-inrichtingselement-lijn.gml  test/hydrography-elms-lines.gml
./local-to-inspire-hy-sd.sh test/top10-inrichtingselement-punt.gml  test/hydrography-elms-points.gml




