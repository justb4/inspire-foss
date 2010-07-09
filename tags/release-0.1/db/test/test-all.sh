#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.

cd ..
./create-all.sh

cd -

./insert-test-data.sh

