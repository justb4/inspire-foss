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

Transform a local (NLExtract) GML document to a INSPIRE AD SpatialDataset.

Author:  Just van den Broecke, Just Objects B.V. for PDOK

Input: NLExtract BAG DB in PostGIS transformed to a GML (v2) file by ogr2ogr.
Output: SpatialDataset with Addresses Features from INSPIRE Annex I AD
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
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

	<!-- Specific local transform from Dutch local GML2 to AD -->
	<xsl:include href="local-to-inspire-ad.xsl"/>

	<xsl:template match="/">
		<!-- Generate SpatialDataset -->
		<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
							 xmlns:AD="urn:x-inspire:specification:gmlas:Addresses:3.0"
							 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
							 xmlns:gmd="http://www.isotc211.org/2005/gmd"
							 xmlns:xlink="http://www.w3.org/1999/xlink"
							 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
							 xmlns:gml2="http://www.opengis.net/gml"
							 xmlns:gml="http://www.opengis.net/gml/3.2"
							 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd
							 urn:x-inspire:specification:gmlas:Addresses:3.0 http://schemas.kademo.nl/inspire/v3.0.1/Addresses.xsd
							 urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd"
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

			<!-- Loop through all features. -->
			<xsl:apply-templates select="//ogr:featureMember/*"/>

		</base:SpatialDataSet>
	</xsl:template>

</xsl:stylesheet>
