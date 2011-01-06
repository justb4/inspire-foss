<?xml version="1.0" encoding="UTF-8"?>

<!--
  ~ Copyright (C) 2011  Het Kadaster - The Netherlands
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

<base:SpatialDataSet xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2"
					 xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0" xmlns:XHY-P="urn:x-exm:specification:gmlas:ExM_PhysicalWaters:0.4"
					 xmlns:GN="urn:x-inspire:specification:gmlas:GeographicalNames:3.0"
					 xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:xlink="http://www.w3.org/1999/xlink"
					 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gml2="http://www.opengis.net/gml"
					 xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:ogr="http://ogr.maptools.org/"
					 xmlns:wfs="http://www.opengis.net/wfs"
					 xsi:schemaLocation="urn:x-inspire:specification:gmlas:BaseTypes:3.2 http://schemas.kademo.nl/inspire/v3.0.1/BaseTypes.xsd urn:x-inspire:specification:gmlas:GeographicalNames:3.0 http://schemas.kademo.nl/inspire/v3.0.1/GeographicalNames.xsd urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http://schemas.kademo.nl/inspire/v3.0.1/HydroPhysicalWaters.xsd urn:x-exm:specification:gmlas:ExM_PhysicalWaters:0.4 http://schemas.kademo.nl/esdin/exm/v0.4-fixed/ExMPhysicalWaters.xsd"
					 gml:id="NL.KAD.EXM.HY-P">
	<base:identifier>
		<base:Identifier>
			<base:localId>0</base:localId>
			<base:namespace>NL.KAD.EXM.HY-P</base:namespace>
		</base:Identifier>
	</base:identifier>
	<base:metadata xsi:nil="true"/>
	<!--UNHANDLED TYPE: TYPEWATER=greppel, droge sloot-->
	<base:member>
		<XHY-P:Watercourse gml:id="NL.KAD.EXM.HY-P.NL.TOP10NL.109135330">
			<HY-P:geographicalName>
				<GN:GeographicalName>
					<GN:language xsi:nil="true"/>
					<GN:nativeness>endonym</GN:nativeness>
					<GN:nameStatus>official</GN:nameStatus>
					<GN:sourceOfName>Het Kadaster</GN:sourceOfName>
					<GN:pronunciation xsi:nil="true" nilReason="UNPOPULATED"/>
					<GN:spelling>
						<GN:SpellingOfName>
							<GN:text>Tiligsterbeek</GN:text>
							<GN:script>Latn</GN:script>
						</GN:SpellingOfName>
					</GN:spelling>
					<GN:grammaticalGender xsi:nil="true"/>
					<GN:grammaticalNumber xsi:nil="true"/>
				</GN:GeographicalName>
			</HY-P:geographicalName>
			<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:geometry>
				<gml:Curve gml:id="CurveNL.KAD.EXM.HY-P.NL.TOP10NL.109135330" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList srsName="EPSG:4258" srsDimension="2">6.924661311497654 52.387729345846942
								6.924660273800471 52.387807410394736 6.924611677881166 52.388230099836932 6.924555409095337 52.388614173463125 6.924486954906327 52.389056968286738
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-P:geometry>
			<HY-P:inspireId>
				<base:Identifier>
					<base:localId>NL.TOP10NL.109135330</base:localId>
					<base:namespace>NL.KAD.EXM.HY-P</base:namespace>
				</base:Identifier>
			</HY-P:inspireId>
			<HY-P:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:LocalisedCharacterString>waterloop</app4:LocalisedCharacterString>
			</HY-P:localType>
			<HY-P:origin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:persistence xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:tidal xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:drainsBasin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:length xsi:nil="true" nilReason="UNPOPULATED" uom="m"/>
			<HY-P:level xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:width xsi:nil="true" nilReason="UNPOPULATED"/>
		</XHY-P:Watercourse>
	</base:member>
	<!--UNHANDLED TYPE: TYPEWATER=greppel, droge sloot-->
	<base:member>
		<XHY-P:Watercourse gml:id="NL.KAD.EXM.HY-P.NL.TOP10NL.109136384">
			<HY-P:geographicalName>
				<GN:GeographicalName>
					<GN:language xsi:nil="true"/>
					<GN:nativeness>endonym</GN:nativeness>
					<GN:nameStatus>official</GN:nameStatus>
					<GN:sourceOfName>Het Kadaster</GN:sourceOfName>
					<GN:pronunciation xsi:nil="true" nilReason="UNPOPULATED"/>
					<GN:spelling>
						<GN:SpellingOfName>
							<GN:text>Tiligsterbeek</GN:text>
							<GN:script>Latn</GN:script>
						</GN:SpellingOfName>
					</GN:spelling>
					<GN:grammaticalGender xsi:nil="true"/>
					<GN:grammaticalNumber xsi:nil="true"/>
				</GN:GeographicalName>
			</HY-P:geographicalName>
			<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:geometry>
				<gml:Curve gml:id="CurveNL.KAD.EXM.HY-P.NL.TOP10NL.109136384" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList srsName="EPSG:4258" srsDimension="2">6.924681522234544 52.386388255112685
								6.924682412413779 52.386395704381698 6.924631026802207 52.386601598663027
								6.924609350830897 52.386706421746574 6.92457612085403 52.386842388806151 6.924582235104456
								52.3870186187185
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-P:geometry>
			<HY-P:inspireId>
				<base:Identifier>
					<base:localId>NL.TOP10NL.109136384</base:localId>
					<base:namespace>NL.KAD.EXM.HY-P</base:namespace>
				</base:Identifier>
			</HY-P:inspireId>
			<HY-P:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:LocalisedCharacterString>waterloop</app4:LocalisedCharacterString>
			</HY-P:localType>
			<HY-P:origin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:persistence xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:tidal xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:drainsBasin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:length xsi:nil="true" nilReason="UNPOPULATED" uom="m"/>
			<HY-P:level xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:width xsi:nil="true" nilReason="UNPOPULATED"/>
		</XHY-P:Watercourse>
	</base:member>
	<base:member>
		<XHY-P:Watercourse gml:id="NL.KAD.EXM.HY-P.NL.TOP10NL.109136386">
			<HY-P:geographicalName>
				<GN:GeographicalName>
					<GN:language xsi:nil="true"/>
					<GN:nativeness>endonym</GN:nativeness>
					<GN:nameStatus>official</GN:nameStatus>
					<GN:sourceOfName>Het Kadaster</GN:sourceOfName>
					<GN:pronunciation xsi:nil="true" nilReason="UNPOPULATED"/>
					<GN:spelling>
						<GN:SpellingOfName>
							<GN:text>Tiligsterbeek</GN:text>
							<GN:script>Latn</GN:script>
						</GN:SpellingOfName>
					</GN:spelling>
					<GN:grammaticalGender xsi:nil="true"/>
					<GN:grammaticalNumber xsi:nil="true"/>
				</GN:GeographicalName>
			</HY-P:geographicalName>
			<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:geometry>
				<gml:Curve gml:id="CurveNL.KAD.EXM.HY-P.NL.TOP10NL.109136386" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList srsName="EPSG:4258" srsDimension="2">6.924582235104456 52.3870186187185
								6.924583372297608 52.387051395648513 6.924614962436672 52.387231043045375
								6.92465356177259 52.387431894214394 6.924663784994586 52.387544042426441
								6.924662537082993 52.387637642617022
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-P:geometry>
			<HY-P:inspireId>
				<base:Identifier>
					<base:localId>NL.TOP10NL.109136386</base:localId>
					<base:namespace>NL.KAD.EXM.HY-P</base:namespace>
				</base:Identifier>
			</HY-P:inspireId>
			<HY-P:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:LocalisedCharacterString>waterloop</app4:LocalisedCharacterString>
			</HY-P:localType>
			<HY-P:origin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:persistence xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:tidal xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:drainsBasin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:length xsi:nil="true" nilReason="UNPOPULATED" uom="m"/>
			<HY-P:level xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:width xsi:nil="true" nilReason="UNPOPULATED"/>
		</XHY-P:Watercourse>
	</base:member>
	<base:member>
		<XHY-P:Watercourse gml:id="NL.KAD.EXM.HY-P.NL.TOP10NL.109130466">
			<HY-P:geographicalName xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:geometry>
				<gml:LineString gml:id="CurveNL.KAD.EXM.HY-P.NL.TOP10NL.109130466" srsName="EPSG:4258">
					<gml:posList srsName="EPSG:4258" srsDimension="2">
						6.924661311497654 52.387729345846942 6.925458735539538 52.387598110795778</gml:posList>
				</gml:LineString>


				<!--			<gml:Curve gml:id="CurveNL.KAD.EXM.HY-P.NL.TOP10NL.109130466" srsName="EPSG:4258"><gml:segments><gml:LineStringSegment interpolation="linear">
									<gml:posList srsName="EPSG:4258" srsDimension="2">6.924661311497654 52.387729345846942 6.925458735539538 52.387598110795778</gml:posList>
								</gml:LineStringSegment></gml:segments></gml:Curve>  -->
			</HY-P:geometry>
			<HY-P:inspireId>
				<base:Identifier>
					<base:localId>NL.TOP10NL.109130466</base:localId>
					<base:namespace>NL.KAD.EXM.HY-P</base:namespace>
				</base:Identifier>
			</HY-P:inspireId>
			<HY-P:localType xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:LocalisedCharacterString>waterloop</app4:LocalisedCharacterString>
			</HY-P:localType>
			<HY-P:origin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:persistence xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:tidal xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:drainsBasin xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:length xsi:nil="true" nilReason="UNPOPULATED" uom="m"/>
			<HY-P:level xsi:nil="true" nilReason="UNPOPULATED"/>
			<HY-P:width xsi:nil="true" nilReason="UNPOPULATED"/>
		</XHY-P:Watercourse>
	</base:member>
	<!--UNHANDLED TYPE: TYPEWATER=greppel, droge sloot-->
	<!--UNHANDLED TYPE: TYPEWATER=greppel, droge sloot-->
</base:SpatialDataSet>
