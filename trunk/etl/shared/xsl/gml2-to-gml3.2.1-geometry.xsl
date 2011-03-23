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

Transforms GML2 geometries to GML3 geometries.

Author: Just van den Broecke, Just Objects B.V. for Dutch Kadaster

GML2 namespace should be defined as xmlns:gml2="http://www.opengis.net/gml" otherwise
it would conflict with GML3 xmlns:gml="http://www.opengis.net/gml/3.2" namespace.
The entry point are callable templates like "createMultiSurface". These transformations
are specific to the use of GDAL's ogr2ogr (www.gdal.org) from MapInfo or Shape files.
GDAL's ogr2ogr cannot (yet) generate GML3 so
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

	</xsl:template>

Single Surface GML 3.2.1
	<gml:Surface gml:id="Surface_NL.KAD.HY-P.NL.TOP10NL.111006201" srsName="EPSG:4258">
		<gml:patches>
			<gml:PolygonPatch>
				<gml:exterior>
					<gml:LinearRing>

						<gml:posList srsName="EPSG:4258" srsDimension="2">6.773247350244287
							52.450026064929467 6.773297416735965 52.449966990606015 6.773251848458108
							52.449962103569071 6.773135725257582 52.449934761427222 6.7701836893417
							52.449976316485035 6.773175175624469 52.449994649229701 6.773247350244287
							52.450026064929467
						</gml:posList>

					</gml:LinearRing>
				</gml:exterior>
			</gml:PolygonPatch>
		</gml:patches>
	</gml:Surface>

GML 2 LineString
	<gml2:LineString>
		<gml2:coordinates>6.924661311497654,52.387729345846942 6.924660273800471,52.387807410394736
		6.924611677881166,52.388230099836932 6.92455540909
		5337,52.388614173463125 6.924486954906327,52.389056968286738
		</gml2:coordinates>
	</gml2:LineString>

	GML 3.2.1 Curve
	<gml:Curve gml:id="GEOMETRY_4c788c52-6ebf-44a4-8f0a-8a2f515057f5" srsName="EPSG:4258">
		<gml:segments>
			<gml:LineStringSegment interpolation="linear">
				<gml:posList>51.50352130 4.78032021 51.50352072 4.78032025 51.50267008 4.78038088 51.5
					0249903 4.78078252 51.50249902 4.78078254 51.50242294 4.78148748 51.50200110 4.78180044
					51.50199910 4.78180043 51.50165846 4.78179732 51.50127334 4.78142030 51.50118847
					4.78127643
				</gml:posList>
			</gml:LineStringSegment>
		</gml:segments>
	</gml:Curve>

-->

	<!-- Callable Template: Transform MultiPolygon to MultiSurface element -->
	<xsl:template name="createMultiSurface" priority="1">
		<xsl:param name="id"/>
		<xsl:apply-templates select="ogr:geometryProperty">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<!-- Callable Template: create Point element -->
	<xsl:template name="createPoint" priority="1">
		<xsl:param name="pointId"/>
		<xsl:param name="point"/>
		<gml:Point srsName="urn:ogc:def:crs:EPSG::4258" gml:id="{$pointId}">
			<gml:pos>
				<!-- Swap x,y to y,x from space-separated (posList) coordinates -->
				<xsl:call-template name="swapCoords">
					<xsl:with-param name="coordString" select="translate(normalize-space($point),',',' ')"/>
					<xsl:with-param name="sep" select="' '"/>
				</xsl:call-template>
			</gml:pos>
		</gml:Point>
	</xsl:template>

	<!-- Callable Template: Transform Point or Linestring element to GML3 Points/Curves-->
	<xsl:template name="createGeom" priority="1" mode="Single">
		<xsl:param name="id"/>
		<xsl:apply-templates select="ogr:geometryProperty" mode="Single">
			<xsl:with-param name="id">
				<xsl:value-of select="$id"/>
			</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>

	<!-- Transform Polygon to nested Surface -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:Point" mode="Single">
		<xsl:param name="id"/>

		<gml:Point gml:id="{concat('Point_',$id)}" srsName="{$srsName}">
			<xsl:apply-templates select="gml2:coordinates" mode="Point"/>
		</gml:Point>
	</xsl:template>

	<!-- Transform Polygon to nested Surface -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:Polygon" mode="Single">
		<xsl:param name="id"/>

		<!-- see http://xml.fmi.fi/namespace/meteorology/conceptual-model/meteorological-objects/2009/03/26/docindex146.html#id541 -->
		<gml:Surface gml:id="{concat('Surface_',$id)}" srsName="{$srsName}">
			<gml:patches>
				<gml:PolygonPatch interpolation="planar">
					<xsl:apply-templates>
						<xsl:with-param name="id" select="$id"/>
					</xsl:apply-templates>
				</gml:PolygonPatch>
			</gml:patches>

		</gml:Surface>
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
					<xsl:apply-templates mode="MultiSurface"/>
				</gml:patches>
			</gml:Surface>
		</gml:surfaceMember>
	</xsl:template>

	<!-- Transform Polygon to PolygonPatch (within MultiSurface) -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:Polygon" mode="MultiSurface">
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

	<!-- Transform Polygon to PolygonPatch (within MultiSurface) -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:LineString" mode="Single">
		<xsl:param name="id"/>

		<gml:Curve gml:id="{concat('Curve',$id)}" srsName="{$srsName}">
			<gml:segments>
				<gml:LineStringSegment interpolation="linear">
					<xsl:apply-templates/>
				</gml:LineStringSegment>
			</gml:segments>
		</gml:Curve>
	</xsl:template>

	<!-- Swap x,y to y,x from space-separated (posList) coordinates. -->
	<xsl:template name="swapCoords">
		<xsl:param name="coordString"/>
		<xsl:param name="sep"/>
		<xsl:choose>
			<xsl:when test="contains($coordString,$sep)">

				<xsl:choose>

					<!-- Cater for last pair -->
					<xsl:when test="substring-before(substring-after($coordString,$sep), $sep) = ''">
						<xsl:value-of select="substring-after($coordString,$sep)"/>
					</xsl:when>

					<xsl:otherwise><xsl:value-of select="substring-before(substring-after($coordString,$sep), $sep)"/></xsl:otherwise>
				</xsl:choose>

				<!-- Output y,x -->
				<xsl:value-of select="' '"/>
				<xsl:value-of select="substring-before($coordString,$sep)"/>
				<xsl:value-of select="' '"/>

				<!-- RECURSE: Skip current x,y-coordinate and proceed with remaining string (that starts with next x,y) -->
				<xsl:call-template name="swapCoords">
					<xsl:with-param name="coordString"
									select="substring-after( substring-after( $coordString, $sep), $sep)"/>
					<xsl:with-param name="sep" select="$sep"/>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<!-- Transform coordinate list to poslist -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:coordinates">
		<gml:posList srsName="{$srsName}" srsDimension="{$srsDimension}">
			<!-- Swap x,y to y,x from space-separated (posList) coordinates -->
			<xsl:call-template name="swapCoords">
				<xsl:with-param name="coordString" select="translate(normalize-space(.),',',' ')"/>
				<xsl:with-param name="sep" select="' '"/>
			</xsl:call-template>
			<!-- <xsl:value-of select="translate(normalize-space(.),',',' ')"/>  -->
		</gml:posList>
	</xsl:template>

	<!-- Transform coordinate list to poslist -->
	<xsl:template xmlns:gml2="http://www.opengis.net/gml" match="gml2:coordinates" mode="Point">
		<gml:pos>
			<!-- Swap x,y to y,x from space-separated (posList) coordinates -->
			<xsl:call-template name="swapCoords">
				<xsl:with-param name="coordString" select="translate(normalize-space(.),',',' ')"/>
				<xsl:with-param name="sep" select="' '"/>
			</xsl:call-template>
			<!-- <xsl:value-of select="translate(normalize-space(.),',',' ')"/>    -->
		</gml:pos>
	</xsl:template>

</xsl:stylesheet>

