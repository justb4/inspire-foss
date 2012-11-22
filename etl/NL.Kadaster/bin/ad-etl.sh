#!/bin/bash
#
# ETL Dutch BAG data from PostGIS to INSPIRE using sETL.
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

ETL_HOME=$INSPIRE_FOSS_HOME/etl/shared/setl
ETL_HOME=/Users/just/project/setl/git
cd $INSPIRE_FOSS_HOME/etl/NL.Kadaster/Addresses
PYTHONPATH=${PYTHONPATH}:$ETL_HOME

$ETL_HOME/setl/main.py -c etl.cfg

cd -
