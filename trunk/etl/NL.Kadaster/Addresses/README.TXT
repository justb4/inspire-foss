This is the ETL to transform Dutch Addresses (BAG) from PostGIS to a deegree Blob-based PostGIS database.

The ETL uses Stetl, a Streaming ETL framework, see www.stetl.org.

The core is the Stetl config file: etl.cfg

This file needs various parameters that can be passed to the stetl command.
See test/etl.sh for an example.

to run:

cd test
./etl.sh

Prerequisites:

- source database: the above script assumes that there is a source database named 'bag' with
  postgres schema 'bagaveen'. This should be filled with tables and data according to the
  NLExtract BAG schema.   https://github.com/opengeogroep/NLExtract/blob/master/bag/db/script/bag-db.sql
  A PG dump of bagaveen can be found at:  http://www.kademo.nl/public/bag-amstelveen-pg-300512.sql

- target database: assumed is target db named 'pdok' with 'inspire_ad' schema.
  The 'inspire_ad' schema should have been initialized using the deegree console.
  This will create and fill the table feature_types.

- See also test/etl.sh for all required parameters

- Stetl: you may install stetl and its dependencies via Python 'pip' or 'easy_install'
  see http://www.stetl.org/en/latest/install.html. If you install stetl via Python then
  you should be able to run the command 'stetl' (usually in /usr/local/bin)
  anywhere from the commandline. See ./etl.sh in test dir.
  i.s.o. ../../shared/stetl/bin/stetl -c etl.cfg -a "$args" you may run
  stetl -c etl.cfg -a "$args"  if you installed stetl via Python

- this has been tested with PostgreSQL 8.3 and PostGIS 1.5.

- XSL: the Stetl transformation uses the XSLT script local-to-inspire-ad-sd.xsl
  (sd=spatial dataset). This script in turn uses local-to-inspire-ad.xsl.
  Input parameters are extracted via OGR PostGIS input queries within the
  Stetl chain.

- Alternative outputs: can be set via etl.cfg by enabling e.g. [output_std] or [output_wfst] within
  the [etl] section. So e.g. i.s.o.
  input_pg_woonplaats|gml_splitter|transformer_xslt|output_deegree_blobstore use
  input_pg_woonplaats|gml_splitter|transformer_xslt|output_std



