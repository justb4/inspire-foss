#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.
export PGPASSFILE=pgpass.conf
psql -a -U kadmin -d postgres -f create-tables.sql -v db_name=inspire_blob
