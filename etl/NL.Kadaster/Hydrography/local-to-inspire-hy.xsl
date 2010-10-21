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

Transform a local (Dutch Kadaster) GML element to INSPIRE HY elements.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

-->
<xsl:stylesheet version="1.0"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:gml2="http://www.opengis.net/gml"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:include href="Hydrography.xsl"/>

	<xsl:variable name="idNameSpaceTheme">
		<xsl:value-of select="concat($idNameSpace,'.HY-P')"/>
	</xsl:variable>

	<!-- Generate HY types for Dutch Top10NL WATERDEEL_VLAK -->
	<xsl:template match="ogr:ETRS89_WATERDEEL_VLAK">

		<!--
  Values for localType from Top10NL defs
	<complexType name="TypeWaterType">
	  <simpleContent>
		<restriction base="gml:CodeType">
		  <enumeration value="bron, wel"/>
		  <enumeration value="droogvallend"/>
		  <enumeration value="greppel, droge sloot"/>
		  <enumeration value="meer, plas, ven, vijver"/>
		  <enumeration value="onbekend"/>
		  <enumeration value="waterloop"/>
		  <enumeration value="zee"/>
		</restriction>
	  </simpleContent>
	</complexType>
  -->

		<!-- Get and strip spaces from local type -->
		<xsl:variable name="localType">
			<xsl:value-of select="normalize-space(ogr:TYPEWATER)"/>
		</xsl:variable>

		<xsl:variable name="standingWaterTypes">
			meer, plas, ven, vijver
		</xsl:variable>

		<xsl:variable name="populatedPlaceTypes">
			buurtschap|huizengroep|plaats, bewoond oord|woonwijk
		</xsl:variable>

		<xsl:choose>
			<!-- Map local type to INSPIRE NamedPlaceType -->
			<xsl:when test="contains($standingWaterTypes, $localType)">
				<!-- Let the callable template "GN.NamedPlace" do the work. -->
				<xsl:call-template name="HY-P.StandingWater">
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
					<!-- <xsl:with-param name="point">
						<xsl:value-of select="ogr:geometryProperty/gml2:Point/gml2:coordinates"/>
					</xsl:with-param>
					<xsl:with-param name="name">
						<xsl:value-of select="ogr:NAAMNL"/>
					</xsl:with-param>
					<xsl:with-param name="localType">
						<xsl:value-of select="$localType"/>
					</xsl:with-param>
					<xsl:with-param name="type">
					</xsl:with-param> -->
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="contains($populatedPlaceTypes, $localType)">populatedPlace</xsl:when>
			<!-- <xsl:otherwise>other</xsl:otherwise>  -->

		</xsl:choose>
	</xsl:template>


</xsl:stylesheet>
