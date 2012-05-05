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

Transform a local (NLExtract BAG) GML element to a INSPIRE Addresses element.

Author:  Just van den Broecke, Just Objects B.V. for PDOK

-->
<xsl:stylesheet version="1.0"
				xmlns:gmd="http://www.isotc211.org/2005/gmd"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:ogr="http://ogr.maptools.org/"
				xmlns:wfs="http://www.opengis.net/wfs"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Use specific GML2 to GML3 MultiPolygonto MultiSurface transform within Addresses.xsl -->
	<xsl:include href="../../shared/xsl/gml2-to-gml3.2.1-geometry.xsl"/>

	<xsl:include href="../../shared/xsl/annex1/Addresses.xsl"/>

	<xsl:variable name="idNameSpaceTheme"><xsl:value-of select="concat($idNameSpace,'.AD')"/></xsl:variable>

	<!-- Generate Addresses element for single Dutch municipality (ogr:gemeente) element -->
	<xsl:template match="ogr:address">

		<!-- Let the callable template "AD.Address" do the work. -->
		<xsl:call-template name="AD.Address">
			<xsl:with-param name="idPrefix">
				<xsl:value-of select="concat($idNameSpaceTheme, '.','Address')"/>
			</xsl:with-param>
			<xsl:with-param name="localId">
				<xsl:value-of select="ogr:identificatie"/>
			</xsl:with-param>
			<xsl:with-param name="point">
                <ogr:geometryProperty><gml:Point srsName="urn:ogc:def:crs:EPSG::4258"><gml:pos>53.321190450363517 6.854402742140622</gml:pos></gml:Point></ogr:geometryProperty>

				<xsl:value-of select="ogr:geometryProperty/gml:Point/gml:pos"/>
			</xsl:with-param>
		</xsl:call-template>

	</xsl:template>
</xsl:stylesheet>
