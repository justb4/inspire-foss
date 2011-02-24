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

Generic XSL to generate CP-related elements.

Author:  Just van den Broecke, Just Objects B.V. for Dutch Kadaster

Requires:
	<xsl:include href="../xsl/constants.xsl"/>

	A callable template "createMultiSurface" for example
	<xsl:include href="../xsl/multipolygon-to-multisurface.xsl"/>

	Example
		<CP:CadastralParcel gml:id="NL.KAD.CP.12345">
			<CP:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
			<CP:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
			<CP:geometry>
				<gml:MultiSurface gml:id="NL.KAD.CP.12345_G">
					<gml:surfaceMember>

						<gml:Surface gml:id="NL.KAD.CP.12345_GS">
							<gml:patches>
								<gml:PolygonPatch>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList count="5" srsDimension="2">3.618990547029997 50.677293185415564
												3.6297393734193184 50.7673729834078 3.6439097499235786 50.76758783873657
												3.633133441442717 50.677509226925196 3.618990547029997
												50.677293185415564
											</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:PolygonPatch>
							</gml:patches>
						</gml:Surface>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</CP:geometry>
			<CP:inspireId>
				<base:Identifier>

					<base:localId>12345</base:localId>
					<base:namespace>NL.KAD.CP</base:namespace>
				</base:Identifier>
			</CP:inspireId>
			<CP:label>label1</CP:label>
			<CP:nationalCadastralReference>natref1</CP:nationalCadastralReference>
		</CP:CadastralParcel>
-->
<xsl:stylesheet version="1.0"
				xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
				xmlns:gml="http://www.opengis.net/gml/3.2"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:CP="urn:x-inspire:specification:gmlas:CadastralParcels:3.0">

	<!-- Generate CadastralParcel element -->
	<xsl:template name="CP.CadastralParcel" priority="1">
		<xsl:param name="idPrefix"/>
		<xsl:param name="localId"/>
		<xsl:param name="areaValue"/>

		<!-- Replace the space in the national Id, e.g.  LNK00D 2377 becomes LNK00D.2377 -->
		<xsl:variable name="localIdDotted"><xsl:value-of select="translate(normalize-space($localId),' ','.')"/></xsl:variable>

		<!-- Create gml Id by concatenating idPrefix and local id -->
		<xsl:variable name="gmlId"><xsl:value-of select="concat($idPrefix,'.',$localIdDotted)"/></xsl:variable>

		<base:member>
			<CP:CadastralParcel gml:id="{$gmlId}">

				<xsl:call-template name="GML.Identifier">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>

				<CP:areaValue uom="{$areaUOM}"><xsl:value-of select="$areaValue"/></CP:areaValue>
				<CP:beginLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>
				<CP:endLifespanVersion xsi:nil="true" nilReason="other:unpopulated"/>

				<!-- Generate (complex) MultiSurface geometry -->
				<CP:geometry>
					<!-- This is locally specific -->
					<xsl:call-template name="createMultiSurface">
						<xsl:with-param name="id">
							<xsl:value-of select="$gmlId"/>
						</xsl:with-param>
					</xsl:call-template>
				</CP:geometry>

				<!-- Generate INSPIRE id -->
				<CP:inspireId>
					<xsl:call-template name="Base.InspireId">
						<xsl:with-param name="localId">
							<xsl:value-of select="$localIdDotted"/>
						</xsl:with-param>
						<xsl:with-param name="idPrefix">
							<xsl:value-of select="$idPrefix"/>
						</xsl:with-param>
					</xsl:call-template>
				</CP:inspireId>

				<!-- label   -->
				<CP:label>
					<xsl:value-of select="$localId"/>
				</CP:label>


				<!-- Local id  -->
				<CP:nationalCadastralReference>
					<xsl:value-of select="$localId"/>
				</CP:nationalCadastralReference>

			</CP:CadastralParcel>
		</base:member>
	</xsl:template>

</xsl:stylesheet>
