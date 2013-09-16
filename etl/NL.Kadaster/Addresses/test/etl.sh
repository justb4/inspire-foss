#!/bin/sh

# All of the above is now:
cd ..

# Substitute the symbolic arguments in Stetl ETL config file
# Adapt for your local config
# out_srs = +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs
# in_srs = +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +towgs84=565.2369,50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,4.0812 +no_defs <>
# in_srs = +proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889 +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +units=m +nadgrids=/Users/just/project/customers/kadaster/svn/research/rdnaptrans/lennard/grid_nl_spaced.gsb

# NB there is an error in the INSPIRE AD XSD Addresses.xsd v3.0 that is distributed
# The problem is in a naming in ThouroughfareName. The JRC AD PDF spec and v3.0.1 are right, v3.0 is in error.
args="\
	in_srs=EPSG:28992\
	out_srs=EPSG:4258\
	in_db_name=bag\
	in_db_host=localhost\
	in_db_port=5432\
	in_db_user=postgres\
	in_db_password=postgres\
	in_db_schema=bagaveen\
	out_db_name=pdok
	out_db_host=localhost\
	out_db_port=5432\
	out_db_user=pdok_owner\
	out_db_password=pdok_owner\
	out_db_schema=inspire_ad\
	gml_split_at=10000\
	wfst_host=localhost\
	wfst_port=8080\
	wfst_path=deegree/wfs\
	wfst_idgen=GenerateNew\
	validator_xsd=../../../schemas/inspire/v3.0.1/Addresses-3.0.1.xsd\
"
../../shared/stetl/bin/stetl -c etl.cfg -a "$args"