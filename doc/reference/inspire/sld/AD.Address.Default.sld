<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">
<sld:NamedLayer>
	<se:Name> AD.Address</se:Name>
	<sld:UserStyle>
		<se:Name>AD.Address.Default</se:Name>
		<sld:IsDefault>1</sld:IsDefault>
		<se:FeatureTypeStyle version="1.1.0">
			<se:Description>
				<se:Title> Address Default Style</se:Title>
				<se:Abstract> The point is rendered as 6 pixel square with black (#000000) border and white (#FFFFFF) fill, if the position of the address represents the postal delivery point, a point of utility service, the access point from the thoroughfare, or the entrance door or gate; 75% grey (#C0C0C0) fill, if the position of the address represents the building or parcel; 50% grey (#808080), if the position of the address represents the related segment of a thoroughfare; and 25% grey (#404040), otherwise. 
</se:Abstract>
			</se:Description>
			<se:FeatureTypeName>AD:Address</se:FeatureTypeName>

			<se:Rule>
				<!--The highest accuracy - Exact Level - white-->
				<se:Filter>
					<OR>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>postalDelivery</ogc:Literal>
						</se:PropertyIsEqualTo>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>utilityService</ogc:Literal>
						</se:PropertyIsEqualTo>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>thoroughfareAccess</ogc:Literal>
						</se:PropertyIsEqualTo>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>entrance</ogc:Literal>
						</se:PropertyIsEqualTo>
					</OR>
				</se:Filter>
				<se:PointSymbolizer>
					<se:Geometry>
						<ogc:PropertyName>geometry</ogc:PropertyName>
					</se:Geometry>
					<se:Graphic>
						<se:Mark>
							<se:WellKnownName>square</se:WellKnownName>
							<se:Fill>
								<se:SvgParameter name="fill">#ffffff</se:SvgParameter>
							</se:Fill>
							<se:Stroke>
								<se:SvgParameter name="stroke">#000000</se:SvgParameter>
								<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							</se:Stroke>
						</se:Mark>
						<se:Size>
							<se:SvgParameter> name="size">6</se:SvgParameter>
						</se:Size>
					</se:Graphic>
				</se:PointSymbolizer>
			</se:Rule>

			<se:Rule>
				<!--The highest accuracy - Locator Level - 75% gray-->
				<se:Filter>
					<OR>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>building</ogc:Literal>
						</se:PropertyIsEqualTo>
						<se:PropertyIsEqualTo>
							<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
							<ogc:Literal>parcel</ogc:Literal>
						</se:PropertyIsEqualTo>
					</OR>
				</se:Filter>
				<se:PointSymbolizer>
					<se:Geometry>
						<ogc:PropertyName>geometry</ogc:PropertyName>
					</se:Geometry>
					<se:Graphic>
						<se:Mark>
							<se:WellKnownName>square</se:WellKnownName>
							<se:Fill>
								<se:SvgParameter name="fill">#c0c0c0</se:SvgParameter>
							</se:Fill>
							<se:Stroke>
								<se:SvgParameter name="stroke">#000000</se:SvgParameter>
								<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							</se:Stroke>
						</se:Mark>
						<se:Size>
							<se:SvgParameter> name="size">6</se:SvgParameter>
						</se:Size>
					</se:Graphic>
				</se:PointSymbolizer>
			</se:Rule>

			<se:Rule>
				<!--The middle accuracy - Thoroughfare level - 50% gray-->
				<se:Filter>
	<ogc:PropertyName>AD:Address.position.specification</ogc:PropertyName>
						<ogc:Literal> segment</ogc:Literal>
					</se:PropertyIsEqualTo>
				</se:Filter>
				<se:PointSymbolizer>
					<se:Geometry>
						<ogc:PropertyName>geometry</ogc:PropertyName>
					</se:Geometry>
					<se:Graphic>
						<se:Mark>
							<se:WellKnownName>square</se:WellKnownName>
							<se:Fill>
								<se:SvgParameter name="fill">#808080</se:SvgParameter>
							</se:Fill>
							<se:Stroke>
								<se:SvgParameter name="stroke">#000000</se:SvgParameter>
								<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							</se:Stroke>
						</se:Mark>
						<se:Size>
							<se:SvgParameter name="size">6</se:SvgParameter>
						</se:Size>
					</se:Graphic>
				</se:PointSymbolizer>
			</se:Rule>

			<se:Rule>
				<!--The lowest accuracy - others or unknown level - 25% gray-->
      <se:ElseFilter/>
				<se:PointSymbolizer>
					<se:Geometry>
						<ogc:PropertyName>geometry</ogc:PropertyName>
					</se:Geometry>
					<se:Graphic>
						<se:Mark>
							<se:WellKnownName>square</se:WellKnownName>
							<se:Fill>
								<se:SvgParameter name="fill">#404040</se:SvgParameter>
							</se:Fill>
							<se:Stroke>
								<se:SvgParameter name="stroke">#000000</se:SvgParameter>
								<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							</se:Stroke>
						</se:Mark>
						<se:Size>
							<se:SvgParameter name="size">6</se:SvgParameter>
						</se:Size>
					</se:Graphic>
				</se:PointSymbolizer>
			</se:Rule>

		</se:FeatureTypeStyle>
	</sld:UserStyle>
</sld:NamedLayer>
</StyledLayerDescriptor>
