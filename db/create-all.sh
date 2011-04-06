#!/bin/sh

# does all: create new DB with all tables

./clear-tables.sh
./drop-database.sh
./create-database.sh
./create-tables.sh
