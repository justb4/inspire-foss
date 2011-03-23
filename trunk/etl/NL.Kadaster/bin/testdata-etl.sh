#!/bin/bash
#
# Transform and load all test data
#
# Author: Just van den Broecke
#
#

../../shared/bin/delete-gml-objects.sh

# AU
cd ../AdministrativeUnits/test
./transform.sh
./load.sh

# CP
cd ../../CadastralParcels/test
./transform.sh
./load.sh

# GN
cd ../../GeographicalNames/test
./transform.sh
./load.sh

# HY
cd ../../Hydrography/test
./transform.sh
./load.sh

# TN
cd ../../TransportNetworks/test
./transform.sh
./load.sh

# ExM
cd ../../ExM/test
./transform.sh
./load.sh
