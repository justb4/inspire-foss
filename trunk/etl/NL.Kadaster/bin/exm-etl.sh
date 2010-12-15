#!/bin/sh
#
# Main ETL for Dutch ESDIN ExM themes
#
# Author: Just van den Broecke
#

./au-etl.sh
./exm-cp-etl.sh
./gn-etl.sh
# ./hy-etl.sh
# ./tn-etl.sh
