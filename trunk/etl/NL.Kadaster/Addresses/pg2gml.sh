#!/bin/sh
#
# Generates GML from BAG data in PostGIS database
# Database tables are structured according to NLExtract BAG DB schema
# For schema see: https://github.com/opengeogroep/NLExtract/blob/master/bag/db/script/bag-db.sql
# Just van den Broecke

# Convert postgis to GML
pg2gml() {
	# Alleen feature types met geo-kolom hebben een geo_type
	nlt=";"
	geo_type=$3
	if [ "$geo_type" != "" ]
	then
	  nlt="-nlt $geo_type"
	fi

	# De feitelijke ogr2ogr aanroep
	ogr2ogr \
	-t_srs "EPSG:4258" \
	-s_srs "EPSG:28992" \
	-f "GML" "/vsistdout/" \
	-dsco "FORMAT=GML3" \
	-lco "DIM=2" \
	PG:"host=localhost dbname=bag active_schema=public user=postgres password=postgres port=5432"  \
	-sql "$1"  \
	-nln "$2" \
	$nlt
}

# SQL voor Adresseerbaarobject subtypen
sql_addresseerbaarobj() {
	# INSPIRE adressen hebben punt geometrie
	# Alleen VBO heeft punt geometrie, voor LP en SP gebruik centroide van vlak
	ao_type=$1
	geom="ST_Centroid(ao.geovlak)"
	if [ "$ao_type" == "verblijfsobjectactueelbestaand" ]
	then
		geom="ao.geopunt"
	fi

	# Query hele tabel Adresseerbaarobject (VBO,LP of SP) joined met Nummeraanduiding tabel
	echo "SELECT na.identificatie,na.huisnummer,na.huisletter,na.huisnummertoevoeging,na.gerelateerdeopenbareruimte,na.postcode,na.gerelateerdewoonplaats,translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid,ST_Force_2D($geom) FROM $1 as ao INNER JOIN nummeraanduidingactueelbestaand as na ON (ao.hoofdadres = na.identificatie)"
}

# BAG component naam
bag_comp=$1

# Niet alle BAG feature typen hebben een geometrie
layer_geo_type=

case "$bag_comp" in
	verblijfsobject)
		sql=`sql_addresseerbaarobj verblijfsobjectactueelbestaand`;
		layer_geo_type=POINT;
	    layer_name="adres";;

	ligplaats)
		sql=`sql_addresseerbaarobj ligplaatsactueelbestaand`;
		layer_geo_type=POINT;
	    layer_name="adres";;

	standplaats)
		sql=`sql_addresseerbaarobj standplaatsactueelbestaand`;
		layer_geo_type=POINT;
	    layer_name="adres";;

	openbareruimte)
		sql="SELECT orn.identificatie,orn.openbareruimtenaam,translate(to_char(orn.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(orn.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM openbareruimteactueelbestaand as orn";
	    layer_name="openbareruimte";;

	woonplaats)
		sql="SELECT wp.identificatie,wp.woonplaatsnaam,translate(to_char(wp.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(wp.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM woonplaatsactueelbestaand as wp";
	    layer_name="woonplaats";;

	postcode)
		# Postalcode for PostalDescriptor FT
		sql="SELECT DISTINCT na.postcode,translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM nummeraanduidingactueelbestaand as na";
	    layer_name="postcode";;

	*) echo "Usage: $0 verblijfsobject | postcode"
		exit 1;;
	esac

# Aanroep ogr2ogr met juist SQL, laagnaam en geometrie type
pg2gml "$sql" $layer_name $layer_geo_type
