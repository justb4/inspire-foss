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

<!--

Transform a local (Dutch Kadaster) GML document to a INSPIRE HY-P SpatialDataset.

GNthor:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Input: MapInfo file, transformed to a GML (v2) file by ogr2ogr (see mapinfo-to-gml.sh).
Output: SpatialDataset with GeographicalNames from INSPIRE Annex I HY
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:gml2="http://www.opengis.net/gml"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



    <!-- Use specific constants for NL.KAdaster -->
    <xsl:include href="../../shared/xsl/constants-nl.xsl"/>
    <xsl:include href="../../shared/xsl/constants-nl-kad.xsl"/>

	<!-- Use generic transform callable templates -->
	<xsl:include href="../../shared/xsl/common.xsl"/>

	<!-- Specific local transform from Dutch local GML2 to GN -->
	<xsl:include href="local-to-inspire-hy.xsl"/>

	<xsl:key name="top10-id" match="//gml2:featureMember/*" use="ogr:IDENT" />

	<xsl:template match="/">
		<!-- Generate SpatialDataset -->
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
							 xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0"
							 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
							 xmlns:gmd="http://www.isotc211.org/2005/gmd"
							 xmlns:xlink="http://www.w3.org/1999/xlink"
							 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
							 xmlns:gml2="http://www.opengis.net/gml"
							 xmlns:gml="http://www.opengis.net/gml/3.2"
							 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http://schemas.kademo.nl/inspire/v3.0.1/HydroPhysicalWaters.xsd"
							 gml:id="{$idNameSpaceTheme}">

			<base:identifier>
				<xsl:call-template name="Base.InspireId">
					<xsl:with-param name="localId">
						<xsl:value-of select="0"/>
					</xsl:with-param>
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
				</xsl:call-template>
			</base:identifier>

			<base:metadata xsi:nil="true"/>

			<!-- Loop through all features, selecting each only once (no duplicates)-->
			<xsl:apply-templates select="//gml2:featureMember/*[generate-id(.) = generate-id(key('top10-id', ogr:IDENT)[1])]"/>

		</base:SpatialDataSet>
	</xsl:template>

</xsl:stylesheet>
