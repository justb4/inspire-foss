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

Transform a local (Dutch Kadaster) GML element to INSPIRE GeographicalNames NamedPlace elements.

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

	<xsl:include href="GeographicalNames.xsl"/>

	<xsl:variable name="idNameSpaceTheme">
		<xsl:value-of select="concat($idNameSpace,'.GN')"/>
	</xsl:variable>

	<!--
	Values for "type" from INSPIRE codelist NamedPlaceTypeValue.xml
	<name>administrativeUnit</name>
			<name>building</name>
			<name>hydrography</name>
			<name>landcover</name>
			<name>landform</name>
			<name>populatedPlace</name>
			<name>protectedSite</name>
			<name>transportNetwork</name>
			<name>other</name>
-->

	<!-- Generate NamedPlace element for single Dutch "FUNCTIONEEL_GEBIED_PUNT" element -->
	<xsl:template match="ogr:ETRS89_FUNCTIONEEL_GEBIED_PUNT">

		<!-- Only generate a NamedPlace if a "name" is available in the source element -->
		<xsl:if test="ogr:NAAMNL != ''">
			<!-- Let the callable template "GN.NamedPlace" do the work. -->
			<xsl:call-template name="GN.NamedPlace">
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idNameSpaceTheme"/>
				</xsl:with-param>
				<xsl:with-param name="localId">
					<xsl:value-of select="ogr:IDENT"/>
				</xsl:with-param>
				<xsl:with-param name="point">
					<xsl:value-of select="ogr:geometryProperty/gml2:Point/gml2:coordinates"/>
				</xsl:with-param>
				<xsl:with-param name="name">
					<xsl:value-of select="ogr:NAAMNL"/>
				</xsl:with-param>
				<xsl:with-param name="localType">
					<xsl:value-of select="ogr:TYPEFUNCTI"/>
				</xsl:with-param>
				<xsl:with-param name="type">other</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- Generate NamedPlace element for single Dutch Top10NL TypeGeografischGebiedelement -->
	<xsl:template match="ogr:ETRS89_GEOGRAFISCH_GEBIED_PUNT">

		<!-- Only generate a NamedPlace if a "name" is available in the source element -->
		<xsl:if test="ogr:NAAMNL != ''">

			<!--
Values for localType from Top10NL defs
<complexType name="TypeGeografischGebiedType">
    <simpleContent>
      <restriction base="gml:CodeType">
        <enumeration value="bank, ondiepte, plaat"/>
        <enumeration value="bosgebied"/>
        <enumeration value="buurtschap"/>
        <enumeration value="duingebied"/>
        <enumeration value="eiland"/>
        <enumeration value="geul, vaargeul"/>
        <enumeration value="heidegebied"/>
        <enumeration value="heuvel, berg"/>
        <enumeration value="huizengroep"/>
        <enumeration value="kaap, hoek"/>
        <enumeration value="meer, plas, ven, vijver"/>
        <enumeration value="onbekend"/>
        <enumeration value="overig"/>
        <enumeration value="plaats, bewoond oord"/>
        <enumeration value="polder"/>
        <enumeration value="streek, veld"/>
        <enumeration value="terp"/>
        <enumeration value="vliedberg"/>
        <enumeration value="wad"/>
        <enumeration value="woonwijk"/>
        <enumeration value="zee"/>
        <enumeration value="zeegat, zeearm"/>
      </restriction>
    </simpleContent>
  </complexType>
-->

			<!-- Get and strip spaces from local type -->
			<xsl:variable name="localType">
				<xsl:value-of select="normalize-space(ogr:TYPEGEOGRA)"/>
			</xsl:variable>

			<xsl:variable name="landcoverTypes">
				bank, ondiepte, plaat|bosgebied|duingebied|eiland|geul, vaargeul|heidegebied|heuvel, berg|polder|streek, veld|terp|vliedberg|wad|zee|zeegat, zeearm
			</xsl:variable>

			<xsl:variable name="populatedPlaceTypes">
				buurtschap|huizengroep|plaats, bewoond oord|woonwijk
			</xsl:variable>

			<!-- Let the callable template "GN.NamedPlace" do the work. -->
			<xsl:call-template name="GN.NamedPlace">
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idNameSpaceTheme"/>
				</xsl:with-param>
				<xsl:with-param name="localId">
					<xsl:value-of select="ogr:IDENT"/>
				</xsl:with-param>
				<xsl:with-param name="point">
					<xsl:value-of select="ogr:geometryProperty/gml2:Point/gml2:coordinates"/>
				</xsl:with-param>
				<xsl:with-param name="name">
					<xsl:value-of select="ogr:NAAMNL"/>
				</xsl:with-param>
				<xsl:with-param name="localType">
					<xsl:value-of select="$localType"/>
				</xsl:with-param>
				<xsl:with-param name="type">
					<xsl:choose>
						<!-- Map local type to INSPIRE NamedPlaceType -->
						<xsl:when test="contains($landcoverTypes, $localType)">landcover</xsl:when>
						<xsl:when test="contains($populatedPlaceTypes, $localType)">populatedPlace</xsl:when>
						<xsl:otherwise>other</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- Generate NamedPlace element for single Dutch "INRICHTINGSELEMENT_PUNT" element -->
	<xsl:template match="ogr:ETRS89_INRICHTINGSELEMENT_PUNT">

		<!-- Only generate a NamedPlace if a "name" is available in the source element -->
		<xsl:if test="ogr:NAAMNL != ''">
		<!--
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
  </complexType>
		-->
			<!-- Get and strip spaces from local type -->
			<xsl:variable name="localType">
				<xsl:value-of select="normalize-space(ogr:TYPEINRICH)"/>
			</xsl:variable>

			<xsl:variable name="buildingTypes">
				boortoren|brandtoren|kapel|koeltoren|toren|windmolen|windmolen: korenmolen|windmolen: watermolen
			</xsl:variable>

			<!-- Let the callable template "GN.NamedPlace" do the work. -->
			<xsl:call-template name="GN.NamedPlace">
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idNameSpaceTheme"/>
				</xsl:with-param>
				<xsl:with-param name="localId">
					<xsl:value-of select="ogr:IDENT"/>
				</xsl:with-param>
				<xsl:with-param name="point">
					<xsl:value-of select="ogr:geometryProperty/gml2:Point/gml2:coordinates"/>
				</xsl:with-param>
				<xsl:with-param name="name">
					<xsl:value-of select="ogr:NAAMNL"/>
				</xsl:with-param>
				<xsl:with-param name="localType">
					<xsl:value-of select="ogr:TYPEINRICH"/>
				</xsl:with-param>
				<xsl:with-param name="type">
					<xsl:choose>
						<!-- Map local type to INSPIRE NamedPlaceType -->
						<xsl:when test="contains($buildingTypes, $localType)">building</xsl:when>
						<xsl:otherwise>other</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- Generate NamedPlace element for single Dutch "WEGDEEL_PUNT" element -->
	<xsl:template match="ogr:ETRS89_WEGDEEL_PUNT">

		<!-- Only generate a NamedPlace if a "name" is available in the source element -->
		<xsl:if test="ogr:STRNAAMNL != ''">
			<!-- Let the callable template "GN.NamedPlace" do the work. -->
			<xsl:call-template name="GN.NamedPlace">
				<xsl:with-param name="idPrefix">
					<xsl:value-of select="$idNameSpaceTheme"/>
				</xsl:with-param>
				<xsl:with-param name="localId">
					<xsl:value-of select="ogr:IDENT"/>
				</xsl:with-param>
				<xsl:with-param name="point">
					<xsl:value-of select="ogr:geometryProperty/gml2:Point/gml2:coordinates"/>
				</xsl:with-param>
				<xsl:with-param name="name">
					<xsl:value-of select="ogr:STRNAAMNL"/>
				</xsl:with-param>
				<xsl:with-param name="localType">
					<xsl:value-of select="ogr:TYPEWEG"/>
				</xsl:with-param>
				<xsl:with-param name="type">transportNetwork</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
