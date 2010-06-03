#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.
export PGPASSFILE=pgpass.conf

psql -a -U kadmin -d inspire -f create-tables.sql
