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

Transform a local (Dutch Kadaster) GML element to INSPIRE TN elements.

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

	<!-- Use specific GML2 to GML3 geometry transform within Hydrography.xsl this way this can be overloaded -->
	<xsl:include href="../xsl/gml2-to-gml3.2.1-geometry.xsl"/>

	<xsl:include href="RoadTransportNetwork.xsl"/>

	<xsl:variable name="idNameSpaceTheme">
		<xsl:value-of select="concat($idNameSpace,'.TN-RO')"/>
	</xsl:variable>


	<!-- Generate TN types for Dutch Top10NL Points and Lines -->
	<xsl:template match="ogr:ETRS89_WEGDEEL_PUNT|ogr:ETRS89_WEGDEEL_LIJN">

		<!--
  Values for localType from Top10NL defs
  <complexType name="TypeInfrastructuurWegdeelType">
    <simpleContent>
      <restriction base="gml:CodeType">
        <enumeration value="kruising"/>
        <enumeration value="overig verkeersgebied"/>
        <enumeration value="verbinding"/>
      </restriction>
    </simpleContent>
  </complexType>
  -->

		<!-- Get and strip spaces from local type -->
		<xsl:variable name="localType">
			<xsl:value-of select="normalize-space(ogr:TYPEINFRAS)"/>
		</xsl:variable>

		<xsl:variable name="roadLinkType">
			verbinding
		</xsl:variable>

		<xsl:variable name="roadNodeType">
			kruising
		</xsl:variable>

		<xsl:choose>

			<!-- Map local type to INSPIRE TN types -->
			<xsl:when test="contains($roadLinkType, $localType)">
				<!-- Use specific id prefix since there may be common Top10NL id's for LIJN/VLAK -->
				<xsl:variable name="idNameSpaceLink">
					<xsl:value-of select="concat($idNameSpaceTheme,'.L')"/>
				</xsl:variable>

				<!-- Let the callable template "TN-RO.StandingWater" do the work. -->
				<xsl:call-template name="TN-RO.RoadLink">

					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceLink"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
					<xsl:with-param name="name">
						<xsl:value-of select="ogr:STRNAAMNL"/>
					</xsl:with-param>
					<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden-->

				</xsl:call-template>
			</xsl:when>

			<xsl:when test="contains($roadNodeType, $localType)">
				<!-- Use specific id prefix since there may be common Top10NL id's for LIJN/VLAK -->
				<xsl:variable name="idNameSpaceNode">
					<xsl:value-of select="concat($idNameSpaceTheme,'.N')"/>
				</xsl:variable>

				<!-- Let the callable template "TN-RO.RoadNode" do the work. -->
				<xsl:call-template name="TN-RO.RoadNode">

					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceNode"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
					<xsl:with-param name="formOfRoadNode">junction</xsl:with-param>
					<xsl:with-param name="name">
						<xsl:value-of select="ogr:STRNAAMNL"/>
					</xsl:with-param>
					<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden-->

				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise>
				<xsl:comment>UNHANDLED TYPE: TYPEWEG=<xsl:value-of select="$localType"/>
				</xsl:comment>
			</xsl:otherwise>

		</xsl:choose>
	</xsl:template>

	<!-- Generate TN types for Dutch Top10NL WEGDEEL_VLAK -->
	<xsl:template match="ogr:ETRS89_WEGDEEL_VLAK">

		<!-- Use specific id prefix since there may be common Top10NL id's for LIJN/VLAK -->
		<xsl:variable name="idNameSpaceArea">
			<xsl:value-of select="concat($idNameSpaceTheme,'.A')"/>
		</xsl:variable>

		<!-- Let the callable template "TN-RO.StandingWater" do the work. -->
		<xsl:call-template name="TN-RO.RoadArea">

			<xsl:with-param name="idPrefix">
				<xsl:value-of select="$idNameSpaceArea"/>
			</xsl:with-param>
			<xsl:with-param name="localId">
				<xsl:value-of select="ogr:IDENT"/>
			</xsl:with-param>
			<xsl:with-param name="name">
				<xsl:value-of select="ogr:STRNAAMNL"/>
			</xsl:with-param>
			<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden-->

		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
