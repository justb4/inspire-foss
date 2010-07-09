#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.
psql -a -U kadmin -d postgres -f drop-database.sql -v db_name=inspire
