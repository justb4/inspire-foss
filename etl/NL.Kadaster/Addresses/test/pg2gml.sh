#!/bin/sh
#
# Generates GML from BAG data in PostGIS database
# Database tables are structured according to NLExtract BAG DB schema
# For schema see: https://github.com/opengeogroep/NLExtract/blob/master/bag/db/script/bag-db.SQL
# Just van den Broecke
# THIS SCRIPT IS OBSOLETE, see etl/shared/python
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
	-SQL "$1"  \
	-nln "$2" \
	$nlt
}

# SQL voor Adresseerbaarobject subtypen
sql_addresseerbaarobj() {
	# INSPIRE adressen hebben punt geometrie
	# Alleen VBO heeft punt geometrie, voor LP en SP gebruik centroide van vlak
	ao_type=$1
	geom="ST_Centroid(ao.geovlak)"
	if [ "$ao_type" = "verblijfsobjectactueelbestaand" ]
	then
		geom="ao.geopunt"
	fi

	# Query hele tabel Adresseerbaarobject (VBO,LP of SP) joined met Nummeraanduiding tabel
#	echo "SELECT na.identificatie,na.huisnummer,na.huisletter,na.huisnummertoevoeging,na.gerelateerdeopenbareruimte,na.postcode,na.gerelateerdewoonplaats,translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid,ST_Force_2D($geom) FROM $1 as ao INNER JOIN nummeraanduidingactueelbestaand as na ON (ao.hoofdadres = na.identificatie)"
#  SELECT
#    na.identificatie,
#    na.huisnummer,
#    na.huisletter,
#    na.huisnummertoevoeging,
#    na.gerelateerdeopenbareruimte,
#    na.postcode,
#    (CASE
#      WHEN wp2.woonplaatsnaam IS NULL THEN w.identificatie ELSE wp2.identificatie END) as woonplaats,
#translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T')
#  as begindatumtijdvakgeldigheid,
#translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T')
# as einddatumtijdvakgeldigheid,
#ST_Force_2D(v.geopunt) as geom
#   FROM verblijfsobjectactueelbestaand v
#    JOIN nummeraanduidingactueelbestaand na
#    ON (na.identificatie = v.hoofdadres)
#    JOIN openbareruimteactueelbestaand o
#    ON (na.gerelateerdeopenbareruimte = o.identificatie)
#    JOIN woonplaatsactueelbestaand w
#    ON (o.gerelateerdewoonplaats = w.identificatie)
#    LEFT OUTER JOIN woonplaatsactueelbestaand wp2
#    ON (na.gerelateerdewoonplaats = wp2.identificatie)
# ;
  echo "SELECT
    na.identificatie,
    na.huisnummer,
    na.huisletter,
    na.huisnummertoevoeging,
    na.gerelateerdeopenbareruimte,
    na.postcode,
    (CASE
      WHEN wp2.woonplaatsnaam IS NULL THEN w.identificatie ELSE wp2.identificatie END) as woonplaats,
translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T')
  as begindatumtijdvakgeldigheid,
translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T')
 as einddatumtijdvakgeldigheid,
ST_Force_2D($geom)
   FROM $1 ao
    JOIN nummeraanduidingactueelbestaand na
    ON (na.identificatie = ao.hoofdadres)
    JOIN openbareruimteactueelbestaand o
    ON (na.gerelateerdeopenbareruimte = o.identificatie)
    JOIN woonplaatsactueelbestaand w
    ON (o.gerelateerdewoonplaats = w.identificatie)
    LEFT OUTER JOIN woonplaatsactueelbestaand wp2
    ON (na.gerelateerdewoonplaats = wp2.identificatie)"

}

# BAG component naam
bag_comp=$1

# Niet alle BAG feature typen hebben een geometrie
layer_geo_type=

case "$bag_comp" in
	verblijfsobject)
		SQL=`sql_addresseerbaarobj verblijfsobjectactueelbestaand`
		layer_geo_type=POINT;
	    layer_name="adres";;

	ligplaats)
		SQL=`sql_addresseerbaarobj ligplaatsactueelbestaand`
		layer_geo_type=POINT;
	    layer_name="adres";;

	standplaats)
		SQL=`sql_addresseerbaarobj standplaatsactueelbestaand`
		layer_geo_type=POINT;
	    layer_name="adres";;

	openbareruimte)
		SQL="SELECT orn.identificatie,orn.openbareruimtenaam,translate(to_char(orn.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(orn.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM openbareruimteactueelbestaand as orn";
	    layer_name="openbareruimte";;

	woonplaats)
		SQL="SELECT wp.identificatie,wp.woonplaatsnaam,translate(to_char(wp.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(wp.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM woonplaatsactueelbestaand as wp";
	    layer_name="woonplaats";;

	postcode)
		# Postalcode for PostalDescriptor FT
		SQL="SELECT DISTINCT na.postcode,translate(to_char(na.begindatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'),' ', 'T') as begindatumtijdvakgeldigheid,translate(to_char(na.einddatumtijdvakgeldigheid, 'YYYY-MM-DD HH24:MI:SS'), ' ', 'T') as einddatumtijdvakgeldigheid FROM nummeraanduidingactueelbestaand as na";
	    layer_name="postcode";;

	*) echo "Usage: $0 verblijfsobject | postcode"
		exit 1;;
	esac

# Aanroep ogr2ogr met juist SQL, laagnaam en geometrie type
pg2gml "$SQL" $layer_name $layer_geo_type
