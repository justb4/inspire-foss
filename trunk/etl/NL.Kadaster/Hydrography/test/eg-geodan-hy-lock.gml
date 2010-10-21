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
	<wfs:Query typeName="HY:Lock"/>
</wfs:GetFeature>
-->

<gml:FeatureCollection xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:ogc="http://www.opengis.net/ogc"
					   xmlns:xlink="http://www.w3.org/1999/xlink"
					   xmlns:HY-P="urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0"
					   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					   xsi:schemaLocation="http://www.opengis.net/gml/3.2 http://schemas.opengis.net/gml/3.2.1/deprecatedTypes.xsd urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0 http://tm-sr:8080/deegree3_IGNB/console/../services?SERVICE=WFS&amp;VERSION=1.1.0&amp;REQUEST=DescribeFeatureType&amp;OUTPUTFORMAT=text%2Fxml%3B+subtype%3Dgml%2F3.2.1&amp;TYPENAME=HY-P:Lock&amp;NAMESPACE=xmlns(HY-P=urn%3Ax-inspire%3Aspecification%3Agmlas%3AHydroPhysicalWaters%3A3.0)"
					   gml:id="WFS_RESPONSE">
	<gml:featureMember>
		<HY-P:Lock gml:id="FEATURE_3e48cb91-ba15-4775-b504-5c0e6e89a63b">
			<HY-P:geographicalName xsi:nil="true" nilReason="UNPOPULATED"></HY-P:geographicalName>
			<HY-P:hydroId xsi:nil="true" nilReason="UNPOPULATED"></HY-P:hydroId>
			<HY-P:beginLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-P:beginLifespanVersion>
			<HY-P:condition>functional</HY-P:condition>
			<HY-P:endLifespanVersion xsi:nil="true" nilReason="UNPOPULATED"></HY-P:endLifespanVersion>

			<HY-P:geometry>
				<!--Inlined geometry 'GEOMETRY_7f73a23d-a4fc-497a-8d89-1da84c37e907'-->
				<gml:Point gml:id="GEOMETRY_7f73a23d-a4fc-497a-8d89-1da84c37e907" srsName="EPSG:4258">
					<gml:pos>49.73279063 5.37703997</gml:pos>
				</gml:Point>
			</HY-P:geometry>
			<HY-P:inspireId xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
				<base:Identifier>

					<base:localId>idfeatureMemberx2x11</base:localId>
					<base:namespace>BE.IGNB.Top250</base:namespace>
				</base:Identifier>
			</HY-P:inspireId>
			<HY-P:levelOfDetail xmlns:app4="http://www.isotc211.org/2005/gmd">
				<app4:MD_Resolution>
					<app4:equivalentScale>
						<app4:MD_RepresentativeFraction>

							<app4:denominator xmlns:app12="http://www.isotc211.org/2005/gco">
								<app12:Integer>250</app12:Integer>
							</app4:denominator>
						</app4:MD_RepresentativeFraction>
					</app4:equivalentScale>
				</app4:MD_Resolution>
			</HY-P:levelOfDetail>
		</HY-P:Lock>

	</gml:featureMember>
</gml:FeatureCollection>