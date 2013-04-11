#!/bin/bash
#
# ETL Dutch BAG data from PostGIS to INSPIRE using stetl.
#
# Author: Just van den Broecke
#

SETTINGS_SCRIPT="settings-`hostname`.sh"
. $SETTINGS_SCRIPT

ETL_HOME=$INSPIRE_FOSS_HOME/etl/shared/stetl
ETL_HOME=/Users/just/project/stetl/git
cd $INSPIRE_FOSS_HOME/etl/NL.Kadaster/Addresses
PYTHONPATH=${PYTHONPATH}:$ETL_HOME

$ETL_HOME/stetl/main.py -c etl.cfg

cd -
