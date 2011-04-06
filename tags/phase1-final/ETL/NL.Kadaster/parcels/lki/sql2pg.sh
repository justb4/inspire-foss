#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.
export PGPASSFILE=../../../../db/pgpass.conf
echo "psql: insert $1"

psql -a -U kadmin -d inspire -f $1
