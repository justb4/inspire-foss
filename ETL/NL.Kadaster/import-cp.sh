psql -a -c "TRUNCATE TABLE cp_parcel" -U kadmin -d inspire

./import-sql.sh /var/kademo/data/inspire/cp.sql > import-cp-err.txt 2>&1

psql -a -c "ALTER TABLE cp_parcel OWNER TO inspire" -U kadmin -d inspire
