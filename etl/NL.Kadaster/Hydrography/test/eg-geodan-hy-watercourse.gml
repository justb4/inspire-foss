<?xml version="1.0" encoding="UTF-8"?>
<!--
 <?xml version="1.0" encoding="UTF-8"?>
<wfs:GetFeature version="1.1.0"
				xmlns:HY="urn:x-inspire:specification:gmlas:Hydrography:3.0"
				xmlns:wfs="http://www.opengis.net/wfs" xmlns:gml="http://www.opengis.net/gml"
				xmlns:ogc="http://www.opengis.net/ogc"
				xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
				xsi:schemaLocation="http://www.opengis.net/wfs http://schemas.opengis.net/wfs/1.1.0/wfs.xsd"
				outputFormat="text/xml; subtype=gml/3.2.1">
	<wfs:Query typeName="HY:Watercourse" maxFeatures="10"/>
</wfs:GetFeature>
-->

<gml:FeatureCollection xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:ogc="http://www.opengis.net/ogc"
					   xmlns:xlink="http://www.w3.org/1999/xlink"
					   xmlns:HY-HPW="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0"
					   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					   xsi:schemaLocation="http://www.opengis.net/gml/3.2 http://schemas.opengis.net/gml/3.2.1/deprecatedTypes.xsd urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http://tm-sr:8080/deegree3_IGNB/console/../services?SERVICE=WFS&amp;VERSION=1.1.0&amp;REQUEST=DescribeFeatureType&amp;OUTPUTFORMAT=text%2Fxml%3B+subtype%3Dgml%2F3.2.1&amp;TYPENAME=HY-HPW:Watercourse&amp;NAMESPACE=xmlns(HY-HPW=urn%3Ax-inspire%3Aspecification%3Agmlas%3AHydroPhysicalWaters%3A3.0)"
					   gml:id="WFS_RESPONSE">
	<gml:featureMember>
		<HY-HPW:Watercourse gml:id="FEATURE_206816aa-13e0-4c0d-8970-870a76f582a1">
			<HY-HPW:geographicalName xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
				<gn:GeographicalName>
					<gn:language>DUT</gn:language>
					<gn:nativeness>endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName></gn:sourceOfName>
					<gn:pronunciation></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>Mark</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>
					</gn:spelling>
					<gn:grammaticalGender></gn:grammaticalGender>
					<gn:grammaticalNumber></gn:grammaticalNumber>
				</gn:GeographicalName>
			</HY-HPW:geographicalName>
			<HY-HPW:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:hydroId>
			<HY-HPW:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:beginLifespanVersion>
			<HY-HPW:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:endLifespanVersion>
			<HY-HPW:geometry>
				<!--Inlined geometry 'GEOMETRY_a2b9d293-f25a-4a6e-ad0f-122b4b4d1c0d'-->
				<gml:Curve gml:id="GEOMETRY_a2b9d293-f25a-4a6e-ad0f-122b4b4d1c0d" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList>51.50413261 4.78027626 51.50413220 4.78027629 51.50362750 4.78031218
								51.50352171 4.78032018 51.50352130 4.78032021
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-HPW:geometry>
			<HY-HPW:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>
					<base:localId>idfeatureMemberx2x11</base:localId>

					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-HPW:inspireId>
			<HY-HPW:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>
							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-HPW:levelOfDetail>
			<HY-HPW:localType xsi:nil="true"></HY-HPW:localType>
			<HY-HPW:origin>natural</HY-HPW:origin>
			<HY-HPW:persistence>Perennial</HY-HPW:persistence>
			<HY-HPW:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:tidal>
			<HY-HPW:drainsBasin xsi:nil="true"/>
			<HY-HPW:condition>functional</HY-HPW:condition>
			<HY-HPW:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:delineationKnown>
			<HY-HPW:length uom="m">68.0868664622</HY-HPW:length>
			<HY-HPW:level>onGroundSurface</HY-HPW:level>
			<HY-HPW:streamOrder xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:streamOrder>
			<HY-HPW:width xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:width>
		</HY-HPW:Watercourse>
	</gml:featureMember>
	<gml:featureMember>
		<HY-HPW:Watercourse gml:id="FEATURE_833bacaa-8872-4ee8-b718-5742ff507022">
			<HY-HPW:geographicalName xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
				<gn:GeographicalName>
					<gn:language>DUT</gn:language>
					<gn:nativeness>endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName></gn:sourceOfName>
					<gn:pronunciation></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>Mark</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>
					</gn:spelling>
					<gn:grammaticalGender></gn:grammaticalGender>
					<gn:grammaticalNumber></gn:grammaticalNumber>
				</gn:GeographicalName>
			</HY-HPW:geographicalName>
			<HY-HPW:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:hydroId>
			<HY-HPW:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:beginLifespanVersion>
			<HY-HPW:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:endLifespanVersion>
			<HY-HPW:geometry>
				<!--Inlined geometry 'GEOMETRY_4c788c52-6ebf-44a4-8f0a-8a2f515057f5'-->
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
			</HY-HPW:geometry>
			<HY-HPW:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>
					<base:localId>idfeatureMemberx2x48</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-HPW:inspireId>
			<HY-HPW:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>
							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-HPW:levelOfDetail>
			<HY-HPW:localType xsi:nil="true"></HY-HPW:localType>
			<HY-HPW:origin>natural</HY-HPW:origin>
			<HY-HPW:persistence>Perennial</HY-HPW:persistence>
			<HY-HPW:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:tidal>
			<HY-HPW:drainsBasin xsi:nil="true"/>
			<HY-HPW:condition>functional</HY-HPW:condition>
			<HY-HPW:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:delineationKnown>
			<HY-HPW:length uom="m">332.068200978</HY-HPW:length>
			<HY-HPW:level>onGroundSurface</HY-HPW:level>
			<HY-HPW:streamOrder xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:streamOrder>
			<HY-HPW:width xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:width>
		</HY-HPW:Watercourse>
	</gml:featureMember>
	<gml:featureMember>
		<HY-HPW:Watercourse gml:id="FEATURE_e8757d00-9cc6-4d05-8162-e3dfb46d636e">
			<HY-HPW:geographicalName xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
				<gn:GeographicalName>
					<gn:language>DUT</gn:language>
					<gn:nativeness>endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName></gn:sourceOfName>
					<gn:pronunciation></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>Leiloop</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>
					</gn:spelling>
					<gn:grammaticalGender></gn:grammaticalGender>
					<gn:grammaticalNumber></gn:grammaticalNumber>
				</gn:GeographicalName>
			</HY-HPW:geographicalName>
			<HY-HPW:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:hydroId>
			<HY-HPW:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:beginLifespanVersion>
			<HY-HPW:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:endLifespanVersion>
			<HY-HPW:geometry>
				<!--Inlined geometry 'GEOMETRY_d4c4b067-575a-4be2-965c-5857ca7fc238'-->
				<gml:Curve gml:id="GEOMETRY_d4c4b067-575a-4be2-965c-5857ca7fc238" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList>51.49516727 4.74990528 51.49507230 4.74991978 51.49496096 4.74985149
								51.49496074 4.74985135
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-HPW:geometry>
			<HY-HPW:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>
					<base:localId>idfeatureMemberx2x85</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-HPW:inspireId>
			<HY-HPW:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>
							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-HPW:levelOfDetail>
			<HY-HPW:localType xsi:nil="true"></HY-HPW:localType>
			<HY-HPW:origin>natural</HY-HPW:origin>
			<HY-HPW:persistence>Perennial</HY-HPW:persistence>
			<HY-HPW:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:tidal>
			<HY-HPW:drainsBasin xsi:nil="true"/>
			<HY-HPW:condition>functional</HY-HPW:condition>
			<HY-HPW:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:delineationKnown>
			<HY-HPW:length uom="m">23.907245766</HY-HPW:length>
			<HY-HPW:level>onGroundSurface</HY-HPW:level>
			<HY-HPW:streamOrder xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:streamOrder>
			<HY-HPW:width xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:width>
		</HY-HPW:Watercourse>
	</gml:featureMember>
	<gml:featureMember>
		<HY-HPW:Watercourse gml:id="FEATURE_6bc4d9c2-0160-444a-a851-6aa1e5160926">
			<HY-HPW:geographicalName xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
				<gn:GeographicalName>
					<gn:language>DUT</gn:language>
					<gn:nativeness>endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName></gn:sourceOfName>
					<gn:pronunciation></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>Leiloop</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>
					</gn:spelling>
					<gn:grammaticalGender></gn:grammaticalGender>
					<gn:grammaticalNumber></gn:grammaticalNumber>
				</gn:GeographicalName>
			</HY-HPW:geographicalName>
			<HY-HPW:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:hydroId>
			<HY-HPW:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:beginLifespanVersion>
			<HY-HPW:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:endLifespanVersion>
			<HY-HPW:geometry>
				<!--Inlined geometry 'GEOMETRY_01c69294-4cf6-4658-9c40-5ca403d5c54a'-->
				<gml:Curve gml:id="GEOMETRY_01c69294-4cf6-4658-9c40-5ca403d5c54a" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList>51.49302164 4.74866340 51.49301948 4.74866207 51.49269145 4.74846086
								51.49043328 4.74675927
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-HPW:geometry>
			<HY-HPW:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>
					<base:localId>idfeatureMemberx2x122</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-HPW:inspireId>
			<HY-HPW:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>
							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-HPW:levelOfDetail>
			<HY-HPW:localType xsi:nil="true"></HY-HPW:localType>
			<HY-HPW:origin>natural</HY-HPW:origin>
			<HY-HPW:persistence>Perennial</HY-HPW:persistence>
			<HY-HPW:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:tidal>
			<HY-HPW:drainsBasin xsi:nil="true"/>
			<HY-HPW:condition>functional</HY-HPW:condition>
			<HY-HPW:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:delineationKnown>
			<HY-HPW:length uom="m">317.01089926</HY-HPW:length>
			<HY-HPW:level>onGroundSurface</HY-HPW:level>
			<HY-HPW:streamOrder xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:streamOrder>
			<HY-HPW:width xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:width>
		</HY-HPW:Watercourse>
	</gml:featureMember>
	<gml:featureMember>
		<HY-HPW:Watercourse gml:id="FEATURE_8f1a4fe7-44fa-409d-9cbb-f582861ae015">
			<HY-HPW:geographicalName xmlns:gn="urn:x-inspire:specification:gmlas:GeographicalNames:3.0">
				<gn:GeographicalName>
					<gn:language></gn:language>
					<gn:nativeness>endonym</gn:nativeness>
					<gn:nameStatus>official</gn:nameStatus>
					<gn:sourceOfName></gn:sourceOfName>
					<gn:pronunciation></gn:pronunciation>
					<gn:spelling>
						<gn:SpellingOfName>
							<gn:text>UNK</gn:text>
							<gn:script>Latn</gn:script>
						</gn:SpellingOfName>
					</gn:spelling>
					<gn:grammaticalGender></gn:grammaticalGender>
					<gn:grammaticalNumber></gn:grammaticalNumber>
				</gn:GeographicalName>
			</HY-HPW:geographicalName>
			<HY-HPW:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:hydroId>
			<HY-HPW:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:beginLifespanVersion>
			<HY-HPW:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:endLifespanVersion>
			<HY-HPW:geometry>
				<!--Inlined geometry 'GEOMETRY_35c46f2f-f8e9-42c1-a963-a8949cada54e'-->
				<gml:Curve gml:id="GEOMETRY_35c46f2f-f8e9-42c1-a963-a8949cada54e" srsName="EPSG:4258">
					<gml:segments>
						<gml:LineStringSegment interpolation="linear">
							<gml:posList>51.48736848 5.03383395 51.48736708 5.03383628 51.48735884 5.03385001
							</gml:posList>
						</gml:LineStringSegment>
					</gml:segments>
				</gml:Curve>
			</HY-HPW:geometry>
			<HY-HPW:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>
					<base:localId>idfeatureMemberx2x159</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-HPW:inspireId>
			<HY-HPW:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>
							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-HPW:levelOfDetail>
			<HY-HPW:localType xsi:nil="true"></HY-HPW:localType>
			<HY-HPW:origin>natural</HY-HPW:origin>
			<HY-HPW:persistence>Perennial</HY-HPW:persistence>
			<HY-HPW:tidal xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:tidal>
			<HY-HPW:drainsBasin xsi:nil="true"/>
			<HY-HPW:condition>functional</HY-HPW:condition>
			<HY-HPW:delineationKnown xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:delineationKnown>
			<HY-HPW:length uom="m">1.54734351041</HY-HPW:length>
			<HY-HPW:level>onGroundSurface</HY-HPW:level>
			<HY-HPW:streamOrder xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:streamOrder>
			<HY-HPW:width xsi:nil="true" nilReason="UNPOPULATED"></HY-HPW:width>
		</HY-HPW:Watercourse>
	</gml:featureMember>
</gml:FeatureCollection>
