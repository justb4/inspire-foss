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


	<!-- Generate TN types for Dutch Top10NL WEGDEEL_VLAK -->
	<xsl:template match="ogr:ETRS89_WEGDEEL_LIJN">

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

		<xsl:choose>

			<!-- Map local type to INSPIRE SurfaceTypes -->
			<xsl:when test="contains($roadLinkType, $localType)">
				<!-- Let the callable template "TN-RO.StandingWater" do the work. -->
				<xsl:call-template name="TN-RO.RoadLink">

					<!-- TODO: also optional name in Frysian (ogr:NAAMFR) -->
					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
				<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden-->

				</xsl:call-template>
			</xsl:when>

			<xsl:otherwise><xsl:comment>UNHANDLED TYPE: TYPEWATER=<xsl:value-of select="$localType"/></xsl:comment></xsl:otherwise>

		</xsl:choose>
	</xsl:template>

	<!-- Generate TN types for Dutch Top10NL WEGDEEL_VLAK -->
	<xsl:template match="ogr:ETRS89_INRICHTINGSELEMENT_PUNT|ogr:ETRS89_INRICHTINGSELEMENT_LIJN">

		<!--
  Values for localType from Top10NL defs
 <complexType name="TypeInrichtingselementType">
    <simpleContent>
      <restriction base="gml:CodeType">
        <enumeration value="BOS-pomp"/>
        <enumeration value="GPS kernnetpunt"/>
        <enumeration value="RD punt"/>
        <enumeration value="aanlegsteiger"/>
        <enumeration value="baak"/>
        <enumeration value="bomenrij"/>
        <enumeration value="boom"/>
        <enumeration value="boorput"/>
        <enumeration value="boortoren"/>
        <enumeration value="brandtoren"/>
        <enumeration value="dam, koedam"/>
        <enumeration value="dukdalf"/>
        <enumeration value="gaswinning"/>
        <enumeration value="gedenkteken, monument"/>
        <enumeration value="geluidswering"/>
        <enumeration value="gemaal"/>
        <enumeration value="golfmeetpaal"/>
        <enumeration value="grenspunt"/>
        <enumeration value="heg, haag"/>
        <enumeration value="hekwerk"/>
        <enumeration value="helikopterlandingsplatform"/>
        <enumeration value="hoogspanningsleiding"/>
        <enumeration value="hoogspanningsmast"/>
        <enumeration value="hunebed"/>
        <enumeration value="kaap"/>
        <enumeration value="kabelbaan"/>
        <enumeration value="kabelbaanmast"/>
        <enumeration value="kapel"/>
        <enumeration value="kilometerpaal"/>
        <enumeration value="kilometerpaal spoorweg"/>
        <enumeration value="kilometerpaal water"/>
        <enumeration value="kilometerraaibord"/>
        <enumeration value="kilometerraaipaal"/>
        <enumeration value="koeltoren"/>
        <enumeration value="koepel"/>
        <enumeration value="kogelvanger schietbaan"/>
        <enumeration value="kraan"/>
        <enumeration value="kruis"/>
        <enumeration value="laadperron"/>
        <enumeration value="leiding"/>
        <enumeration value="licht, lichtopstand"/>
        <enumeration value="lichttoren"/>
        <enumeration value="luchtvaartlicht"/>
        <enumeration value="markant object"/>
        <enumeration value="muur"/>
        <enumeration value="oliepompinstallatie"/>
        <enumeration value="onbekend"/>
        <enumeration value="overig"/>
        <enumeration value="paal"/>
        <enumeration value="paalwerk"/>
        <enumeration value="peilmeetstation"/>
        <enumeration value="peilschaal"/>
        <enumeration value="pijler"/>
        <enumeration value="radarpost"/>
        <enumeration value="radiobaken"/>
        <enumeration value="radiotelescoop"/>
        <enumeration value="schietbaan"/>
        <enumeration value="schoorsteen"/>
        <enumeration value="seinmast"/>
        <enumeration value="sluisdeur"/>
        <enumeration value="station"/>
        <enumeration value="stormvloedkering"/>
        <enumeration value="strandpaal"/>
        <enumeration value="strekdam, krib, golfbreker"/>
        <enumeration value="stuw"/>
        <enumeration value="tol"/>
        <enumeration value="toren"/>
        <enumeration value="uitzichttoren"/>
        <enumeration value="verkeersgeleider"/>
        <enumeration value="visplaats"/>
        <enumeration value="vlampijp"/>
        <enumeration value="wegafsluiting"/>
        <enumeration value="wegwijzer"/>
        <enumeration value="windmolen"/>
        <enumeration value="windmolen: korenmolen"/>
        <enumeration value="windmolen: watermolen"/>
        <enumeration value="windmolentje"/>
        <enumeration value="windturbine"/>
        <enumeration value="zeevaartlicht"/>
        <enumeration value="zendmast"/>
        <enumeration value="zichtbaar wrak"/>
      </restriction>
    </simpleContent>
  </complexType>  -->

		<!-- Get and strip spaces from local type -->
		<xsl:variable name="localType">
			<xsl:value-of select="normalize-space(ogr:TYPEINRICH)"/>
		</xsl:variable>

		<xsl:variable name="lockTypes">sluisdeur</xsl:variable>

		<xsl:variable name="damOrWeirTypes">dam, koedam</xsl:variable>

		<!-- TODO: base status codevalue (functional, ...) on local value (in gebruik, ...) -->
		<xsl:variable name="status">functional</xsl:variable>

		<xsl:choose>

			<!-- Map local type to INSPIRE TN Types -->

			<!-- Lock -->
			<xsl:when test="contains($lockTypes, $localType)">
				<!-- Let the callable template "TN-RO.Lock" do the work. -->
				<xsl:call-template name="TN-RO.Lock">

					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
					<xsl:with-param name="status">
						<xsl:value-of select="$status"/>
					</xsl:with-param>


					<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden (and NAME ?) -->

				</xsl:call-template>
			</xsl:when>

			<!-- Dam -->
			<xsl:when test="contains($damOrWeirTypes, $localType)">
				<!-- Let the callable template "TN-RO.DamOrWeir" do the work. -->
				<xsl:call-template name="TN-RO.DamOrWeir">

					<xsl:with-param name="idPrefix">
						<xsl:value-of select="$idNameSpaceTheme"/>
					</xsl:with-param>
					<xsl:with-param name="localId">
						<xsl:value-of select="ogr:IDENT"/>
					</xsl:with-param>
					<xsl:with-param name="status">
						<xsl:value-of select="$status"/>
					</xsl:with-param>

					<!-- TODO: optionally pass OBJ_BEGIN, VER_BEGIN en *EIND tijden (and NAME ?) -->
				</xsl:call-template>
			</xsl:when>
			<!-- <xsl:otherwise><xsl:comment>UNHANDLED TYPE: TYPEINRICH=<xsl:value-of select="$localType"/></xsl:comment></xsl:otherwise> -->

		</xsl:choose>
	</xsl:template>


</xsl:stylesheet>
