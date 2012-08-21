#!/bin/bash
#
# ETL Dutch BAG data from PostGIS to INSPIRE using sETL.
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

ETL_HOME=$INSPIRE_FOSS_HOME/etl/shared/python
cd $INSPIRE_FOSS_HOME/etl/NL.Kadaster/Addresses

$ETL_HOME/etl.py etl.cfg

cd -
