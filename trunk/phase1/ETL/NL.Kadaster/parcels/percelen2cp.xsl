<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (C) 2010  Het Kadaster - The Netherlands
  ~
  ~ This program is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:xalan="http://xml.apache.org/xalan" exclude-result-prefixes="xalan"
				xmlns:nen3610="http://www.ravi.nl/nen3610"
				xmlns:top10nl="http://www.kadaster.nl/top10nl"
				xmlns:gml="http://www.opengis.net/gml"
				xmlns:bagtype="http://www.kadaster.nl/schemas/imbag-types/v20090216"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:bag_LVC="http://www.kadaster.nl/schemas/imbag-lvc/v20090228"

		>
	<xsl:output method="text" version="1.0" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
		<xsl:apply-templates select="//ogr:Perceelvlak"/>
		<xsl:apply-templates select="//ogr:lki_vlakken"/>
	</xsl:template>


	<xsl:template match="ogr:Perceelvlak">

		<xsl:call-template name="insert_cp_parcel">
			<xsl:with-param name="id">
				<xsl:value-of select="ogr:PCVL_PRCL_"/>
			</xsl:with-param>

			<xsl:with-param name="geometry">
				<!-- In GML spaces and commas are reverse as what PostGIS requires, so we do substitions here -->
				<xsl:value-of select="translate(translate(translate(normalize-space(ogr:geometryProperty),' ', '*'),',',' '),'*',',')"/>
			</xsl:with-param>

		</xsl:call-template>

	</xsl:template>


	<xsl:template match="ogr:lki_vlakken">

		<xsl:call-template name="insert_cp_parcel">
			<xsl:with-param name="id">
				<xsl:value-of select="ogr:objectnumm"/>
			</xsl:with-param>

			<xsl:with-param name="geometry">
				<!-- In GML spaces and commas are reverse as what PostGIS requires, so we do substitions here -->
				<xsl:value-of select="translate(translate(translate(normalize-space(ogr:geometryProperty),' ', '*'),',',' '),'*',',')"/>
			</xsl:with-param>

		</xsl:call-template>

	</xsl:template>

	<!-- SIMPLE INSERTS -->


	<!-- Generate cp_parcel SQL insert -->
	<xsl:template name="insert_cp_parcel" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="geometry"/>

		INSERT INTO cp_parcel (id,label,national_ref,geometry)
		  SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$id"/>','<xsl:value-of select="$id"/>',
<!--		    ST_Transform(ST_Transform(ST_GeomFromEWKT('SRID=28992;MULTIPOLYGON(((<xsl:value-of select="$geometry"/>)))'), 4326),4258)  -->
		    ST_Transform(ST_GeomFromEWKT('SRID=28992;MULTIPOLYGON(((<xsl:value-of select="$geometry"/>)))'), 4258)
		      WHERE NOT EXISTS (SELECT id FROM cp_parcel WHERE id='<xsl:value-of select="$id"/>');
	</xsl:template>


</xsl:stylesheet>
