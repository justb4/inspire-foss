#!/bin/sh
# Run this file on the database server host or edit the pgpass.conf file.
export PGPASSFILE=pgpass.conf

psql -a -d inspire -U inspire -f insert-test-data-ad.sql
psql -a -d inspire -U inspire -f insert-test-data-cp.sql

