psql -a -c "TRUNCATE TABLE ad_address,ad_component,ad_admin_unit,ad_postal,\
ad_thoroughfare,ad_locator,ad_locator_designator,gn_spelling,gn_name CASCADE" -U kadmin -d inspire


./import-sql.sh /var/kademo/data/inspire/ad.sql > import-ad-err.txt 2>&1

