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

Transforms GM2 MultiPolygon to GML3 MultiSurface geometry.

Author: Just van den Broecke, Just Objects B.V. for Dutch Kadaster

GML2 namespace should be defined as xmlns:gml2="http://www.opengis.net/gml" otherwise
it would conflict with GML3 xmlns:gml="http://www.opengis.net/gml/3.2" namesapce.
The entry point is the callable template "createMultiSurface". This transformation
is specific to the use of ogr2ogr from MapInfo files. ogr2ogr cannot generate GML3 so
we use GML2 MultiPolygon.

Requires constants.xsl to be included for global settings.
-->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:ogr="http://ogr.maptools.org/"
		>


	<!-- Generate GML MultiSurface Polygon element  KEPT FOR REFERENCE
	<xsl:template name="GML.MultiSurface.Polygon" priority="1">
		<xsl:param name="id"/>
		<xsl:param name="exteriorPosList"/>

		<gml:MultiSurface gml:id="{concat('MultiSurface_',$id)}" srsName="{$srsName}">
			<gml:surfaceMember>
				<gml:Surface gml:id="{concat('Surface_',$id)}" srsName="{$srsName}">
					<gml:patches>
						<gml:PolygonPatch interpolation="planar">
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList srsName="{$srsName}" srsDimension="{$srsDimension}">
										<xsl:value-of select="$exteriorPosList"/>
									</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:PolygonPatch>
					</gml:patches>
				</gml:Surface>
			</gml:surfaceMember>
		</gml:MultiSurface>

	</xsl:template>                  -->

	<!-- START: Transform MultiPolygon to MultiSurface element -->
	<xsl:template name="createMultiSurface" priority="1">
		<xsl:param name="id"/>
		<xsl:apply-templates select="ogr:geometryProperty">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<!-- Transform MultiPolygon to nested MultiSurface -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:MultiPolygon">
		<xsl:param name="id"/>

		<!-- see http://xml.fmi.fi/namespace/meteorology/conceptual-model/meteorological-objects/2009/03/26/docindex146.html#id541 -->
		<gml:MultiSurface gml:id="{concat('MultiSurface_',$id)}" srsName="{$srsName}">
			<xsl:apply-templates>
				<xsl:with-param name="id" select="$id"/>
			</xsl:apply-templates>
		</gml:MultiSurface>
	</xsl:template>

	<!-- Transform polygonMember to nested surfaceMember/Surface/patches -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:polygonMember">
		<xsl:param name="id"/>

		<gml:surfaceMember>
			<gml:Surface gml:id="{concat('Surface_',$id, '.', position())}" srsName="{$srsName}">
				<gml:patches>
					<xsl:apply-templates/>
				</gml:patches>
			</gml:Surface>
		</gml:surfaceMember>
	</xsl:template>

	<!-- Transform Polygon to PolygonPatch -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:Polygon">
		<gml:PolygonPatch interpolation="planar">
			<xsl:apply-templates/>
		</gml:PolygonPatch>
	</xsl:template>

	<!-- Transform innerBoundaryIs to interior -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:innerBoundaryIs">
		<gml:interior>
			<gml:LinearRing>
				<xsl:apply-templates/>
			</gml:LinearRing>
		</gml:interior>
	</xsl:template>

	<!-- Transform outerBoundaryIs to exterior -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:outerBoundaryIs">
		<gml:exterior>
			<gml:LinearRing>
				<xsl:apply-templates/>
			</gml:LinearRing>
		</gml:exterior>
	</xsl:template>

	<!-- Transform coordinate list to poslist -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:coordinates">
		<gml:posList srsName="{$srsName}" srsDimension="{$srsDimension}">
			<!-- VERY VERY TRICKY : replaces "," with spaces and removes 3rd dimension (height) by calling "remove3D" -->
			<xsl:call-template name="remove3D">
				<xsl:with-param name="outputString" select="translate(normalize-space(.),',',' ')"/>
				<xsl:with-param name="sep" select="' '"/>
			</xsl:call-template>

		</gml:posList>
	</xsl:template>
</xsl:stylesheet>

