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
                xmlns:ogr="http://ogr.maptools.org/"
				xmlns:gml="http://www.opengis.net/gml"
				xmlns:bagtype="http://www.kadaster.nl/schemas/imbag-types/v20090216"
				xmlns:bag_LVC="http://www.kadaster.nl/schemas/imbag-lvc/v20090228"

		>
	<xsl:output method="text" version="1.0" encoding="utf-8" indent="yes"/>

	<xsl:template match="/">
		<xsl:apply-templates select="//bag_LVC:Woonplaats"/>
		<xsl:apply-templates select="//bag_LVC:OpenbareRuimte"/>
		<xsl:apply-templates select="//ogr:address"/>

		<xsl:apply-templates select="//bag_LVC:Ligplaats"/>
		<xsl:apply-templates select="//bag_LVC:Standplaats"/>
		<xsl:apply-templates select="//bag_LVC:Verblijfsobject"/>
	</xsl:template>


	<xsl:template match="bag_LVC:Ligplaats">

		<xsl:call-template name="insert_ad_address">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:gerelateerdeAdressen/bag_LVC:hoofdadres/bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="positionX">
				<!-- For now take the first POINT of the Polygon - later we will use a PostGIS function to get center -->
				<xsl:value-of
						select='substring-before(bag_LVC:ligplaatsGeometrie/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList, " ")'/>
			</xsl:with-param>

			<xsl:with-param name="positionY">
				<!-- For now take the first POINT of the Polygon - later we will use a PostGIS function to get center -->
				<xsl:value-of
						select='substring-before(substring-after(bag_LVC:ligplaatsGeometrie/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList, " "), " ")'/>
			</xsl:with-param>

		</xsl:call-template>

		<!-- TODO also handle "nevenadressen" (zero or more) -->

	</xsl:template>

	<xsl:template match="bag_LVC:Standplaats">

		<xsl:call-template name="insert_ad_address">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:gerelateerdeAdressen/bag_LVC:hoofdadres/bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="positionX">
				<!-- For now take the first POINT of the Polygon - later we will use a PostGIS function to get center -->
				<xsl:value-of
						select='substring-before(bag_LVC:standplaatsGeometrie/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList, " ")'/>
			</xsl:with-param>

			<xsl:with-param name="positionY">
				<!-- For now take the first POINT of the Polygon - later we will use a PostGIS function to get center -->
				<xsl:value-of
						select='substring-before(substring-after(bag_LVC:standplaatsGeometrie/gml:Polygon/gml:exterior/gml:LinearRing/gml:posList, " "), " ")'/>
			</xsl:with-param>
		</xsl:call-template>

		<!-- TODO also handle "nevenadressen" (zero or more) -->
	</xsl:template>

	<xsl:template match="bag_LVC:Verblijfsobject">

		<xsl:call-template name="insert_ad_address">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:gerelateerdeAdressen/bag_LVC:hoofdadres/bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="positionX">
				<xsl:value-of select='substring-before(bag_LVC:verblijfsobjectGeometrie/gml:Point/gml:pos, " ")'/>
			</xsl:with-param>

			<xsl:with-param name="positionY">
				<xsl:value-of select='substring-before(substring-after(bag_LVC:verblijfsobjectGeometrie/gml:Point/gml:pos, " "), " ")'/>
			</xsl:with-param>
		</xsl:call-template>

		<!-- TODO also handle "nevenadressen" (zero or more) -->
	</xsl:template>

	<xsl:template match="ogr:address">

		<xsl:call-template name="insert_ad_locator">
			<xsl:with-param name="id">
				<xsl:value-of select='ogr:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="level">unitLevel</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select='ogr:huisnummer'/><xsl:value-of select='ogr:huisletter'/><xsl:value-of select='ogr:huisnummertoevoeging'/>
			</xsl:with-param>

		</xsl:call-template>


		<!-- Designator Type 2: huisnummer -->
		<xsl:call-template name="insert_ad_locator_designator">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="type">2</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select='bag_LVC:huisnummer'/>
			</xsl:with-param>
		</xsl:call-template>

		<!-- Designator Type 3: huisletter -->
		<xsl:if test="bag_LVC:huisletter != ''">
			<xsl:call-template name="insert_ad_locator_designator">
				<xsl:with-param name="id">
					<xsl:value-of select='bag_LVC:identificatie'/>
				</xsl:with-param>

				<xsl:with-param name="type">3</xsl:with-param>

				<xsl:with-param name="value">
					<xsl:value-of select='bag_LVC:huisletter'/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>

		<!-- Designator Type 3: huisnummertoevoeging -->
		<xsl:if test="bag_LVC:huisnummertoevoeging != ''">
			<xsl:call-template name="insert_ad_locator_designator">
				<xsl:with-param name="id">
					<xsl:value-of select='bag_LVC:identificatie'/>
				</xsl:with-param>

				<xsl:with-param name="type">3</xsl:with-param>

				<xsl:with-param name="value">
					<xsl:value-of select='bag_LVC:huisnummertoevoeging'/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>

		<xsl:call-template name="insert_comp_ad_postal">
			<xsl:with-param name="value">
				<xsl:value-of select='bag_LVC:postcode'/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="insert_comp_ad_component">
			<xsl:with-param name="ad_address_id">
				<xsl:value-of select='bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="ad_postal_id">
				<xsl:value-of select='bag_LVC:postcode'/>
			</xsl:with-param>

			<xsl:with-param name="ad_thoroughfare_id">
				<xsl:value-of select='bag_LVC:gerelateerdeOpenbareRuimte/bag_LVC:identificatie'/>
			</xsl:with-param>

		</xsl:call-template>


		<xsl:call-template name="update_ad_address_validity">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="valid_from">
				<xsl:value-of select='bag_LVC:tijdvakgeldigheid/bagtype:begindatumTijdvakGeldigheid'/>
			</xsl:with-param>

			<xsl:with-param name="valid_to">
				<xsl:value-of select='bag_LVC:tijdvakgeldigheid/bagtype:einddatumTijdvakGeldigheid'/>
			</xsl:with-param>

		</xsl:call-template>

	</xsl:template>


	<xsl:template match="bag_LVC:OpenbareRuimte">

		<xsl:call-template name="insert_comp_ad_thoroughfare">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="ad_address_area_id">
				<xsl:value-of select='bag_LVC:gerelateerdeWoonplaats/bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select='bag_LVC:openbareRuimteNaam'/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>

	<xsl:template match="bag_LVC:Woonplaats">

		<xsl:call-template name="insert_comp_ad_address_area">
			<xsl:with-param name="id">
				<xsl:value-of select='bag_LVC:identificatie'/>
			</xsl:with-param>

			<xsl:with-param name="name">
				<xsl:value-of select='bag_LVC:woonplaatsNaam'/>
			</xsl:with-param>

			<!-- <xsl:with-param name="level">2</xsl:with-param> -->
		</xsl:call-template>

	</xsl:template>

	<!-- COMPLEX INSERTS -->

	<!-- Generate all SQL insert for insert_comp_ad_address_area -->
	<xsl:template name="insert_comp_ad_address_area" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="name"/>

		<xsl:call-template name="insert_gn_name">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="language">nld</xsl:with-param>
			<xsl:with-param name="value">
				<xsl:value-of select="name"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="insert_gn_spelling">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="gn_name_id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select="$name"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="insert_ad_address_area">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="gn_name_id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="name">
				<xsl:value-of select="$name"/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>

	<!-- Generate all SQL insert for address components code -->
	<xsl:template name="insert_comp_ad_component" priority="1">
		<xsl:param name="ad_address_id"/>
		<xsl:param name="ad_postal_id"/>
		<xsl:param name="ad_thoroughfare_id"/>

		INSERT INTO ad_component (ad_address_id, ad_postal_id, ad_thoroughfare_id, ad_address_area_id)
		VALUES ('<xsl:value-of select="$ad_address_id"/>','<xsl:value-of select="$ad_postal_id"/>','<xsl:value-of
			select="$ad_thoroughfare_id"/>', (SELECT ad_address_area_id FROM ad_thoroughfare WHERE id='<xsl:value-of
			select="$ad_thoroughfare_id"/>')) ;

	</xsl:template>

	<!-- Generate all SQL insert for ad_postal code -->
	<xsl:template name="insert_comp_ad_postal" priority="1">
		<xsl:param name="value"/>

		<xsl:call-template name="insert_ad_postal">
			<xsl:with-param name="id">
				<xsl:value-of select="$value"/>
			</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select="$value"/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>

	<!-- Generate all SQL insert for thoroughfare -->
	<xsl:template name="insert_comp_ad_thoroughfare" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="ad_address_area_id"/>
		<xsl:param name="value"/>

		<xsl:call-template name="insert_gn_name">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="language">nld</xsl:with-param>
			<xsl:with-param name="value">
				<xsl:value-of select="$value"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="insert_gn_spelling">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="gn_name_id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select="$value"/>
			</xsl:with-param>
		</xsl:call-template>

		<xsl:call-template name="insert_ad_thoroughfare">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="ad_address_area_id">
				<xsl:value-of select="$ad_address_area_id"/>
			</xsl:with-param>

			<xsl:with-param name="gn_name_id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>

			<xsl:with-param name="value">
				<xsl:value-of select="$value"/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>

	<!-- SIMPLE INSERTS -->


	<!-- Generate insert gn_name SQL -->
	<xsl:template name="insert_gn_name" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="language"/>
		<xsl:param name="value"/>
		<xsl:variable name="apos">'</xsl:variable>
		<xsl:variable name="apostrans"></xsl:variable>

		INSERT INTO gn_name (id, language, native_value)
		SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$language"/>', '<xsl:value-of select="translate($value, $apos, $apostrans)"/>'
		WHERE NOT EXISTS (SELECT id FROM gn_name WHERE id='<xsl:value-of select="$id"/>');

	</xsl:template>

	<!-- Generate insert gn_spelling SQL -->
	<xsl:template name="insert_gn_spelling" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="gn_name_id"/>
		<xsl:param name="value"/>
		<xsl:variable name="apos">'</xsl:variable>
		<xsl:variable name="apostrans"></xsl:variable>

		INSERT INTO gn_spelling (id, gn_name_id, text)
		SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$gn_name_id"/>', '<xsl:value-of select="translate($value, $apos, $apostrans)"/>'
		WHERE NOT EXISTS (SELECT id FROM gn_spelling WHERE id='<xsl:value-of select="$id"/>');

	</xsl:template>

	<!-- Generate ad_address SQL insert -->
	<xsl:template name="insert_ad_address" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="positionX"/>
		<xsl:param name="positionY"/>
		
		-- x=<xsl:value-of select="$positionX"/>
		-- y=<xsl:value-of select="$positionY"/>
		INSERT INTO ad_address (id,valid_from,position)
		SELECT '<xsl:value-of select="$id"/>','2004-10-19 10:23:54+02', ST_Transform(ST_GeomFromEWKT('SRID=28992;POINT(<xsl:value-of select="concat($positionX, ' ')"/> <xsl:value-of select="$positionY"/>)'), 4258)
		WHERE NOT EXISTS (SELECT id FROM ad_address WHERE id='<xsl:value-of select="$id"/>');
	</xsl:template>

	<!-- Generate insert ad_address_area SQL -->
	<xsl:template name="insert_ad_address_area" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="gn_name_id"/>
		<xsl:param name="name"/>

		INSERT INTO ad_address_area (id, gn_name_id, name)
		SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$gn_name_id"/>', '<xsl:value-of select="$name"/>'
		WHERE NOT EXISTS (SELECT id FROM ad_address_area WHERE id='<xsl:value-of select="$id"/>');

	</xsl:template>

	<!-- Generate ad_locator SQL insert -->
	<xsl:template name="insert_ad_locator" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="level"/>
		<xsl:param name="value"/>

		INSERT INTO ad_locator (id,ad_address_id,level,name)
		VALUES ('<xsl:value-of select="$id"/>','<xsl:value-of select="$id"/>','<xsl:value-of select="$level"/>','<xsl:value-of select="$value"/>') ;

	</xsl:template>

	<!-- Generate ad_locator_designator SQL insert -->
	<xsl:template name="insert_ad_locator_designator" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="type"/>
		<xsl:param name="value"/>

		INSERT INTO ad_locator_designator (ad_locator_id,type,value)
		VALUES ('<xsl:value-of select="$id"/>',<xsl:value-of select="$type"/>,'<xsl:value-of select="$value"/>') ;

	</xsl:template>

	<!-- Generate insert ad_postal SQL -->
	<xsl:template name="insert_ad_postal" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="value"/>

		<!-- NL only uses postcode, i.e. "postname" is not used  -->
		INSERT INTO ad_postal (id,post_code)
		SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$value"/>'
		WHERE NOT EXISTS (SELECT id FROM ad_postal WHERE id='<xsl:value-of select="$id"/>');

	</xsl:template>

	<!-- Generate insert ad_thoroughfare SQL -->
	<xsl:template name="insert_ad_thoroughfare" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="ad_address_area_id"/>
		<xsl:param name="gn_name_id"/>
		<xsl:param name="value"/>
		<xsl:variable name="apos">'</xsl:variable>
		<xsl:variable name="apostrans"></xsl:variable>

		INSERT INTO ad_thoroughfare (id, ad_address_area_id, gn_name_id, name)
		SELECT '<xsl:value-of select="$id"/>','<xsl:value-of select="$ad_address_area_id"/>','<xsl:value-of
			select="$gn_name_id"/>', '<xsl:value-of select="translate($value, $apos, $apostrans)"/>'
		WHERE NOT EXISTS (SELECT id FROM ad_thoroughfare WHERE id='<xsl:value-of select="$id"/>');

	</xsl:template>

	<!-- Generate ad_address SQL insert -->
	<xsl:template name="update_ad_address_validity" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="valid_from"/>
		<xsl:param name="valid_to"/>

		<!-- Extract e.g. from '2004123100000000' to '2004-12-31 00:00:00+02'-->
		UPDATE ad_address
		  SET
		    valid_from = '<xsl:value-of select="substring($valid_from, 1,4)"/>-<xsl:value-of select="substring($valid_from, 5,2)"/>-<xsl:value-of select="substring($valid_from, 7,2)"/> 00:00:00+02',
		    valid_to = '<xsl:value-of select="substring($valid_to, 1,4)"/>-<xsl:value-of select="substring($valid_to, 5,2)"/>-<xsl:value-of select="substring($valid_to, 7,2)"/> 00:00:00+02' 
		   WHERE id = '<xsl:value-of select="$id"/>';
		
	</xsl:template>

</xsl:stylesheet>
