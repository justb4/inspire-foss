<?xml version="1.0" encoding="UTF-8"?>
<FeatureTypeStyle xmlns="http://www.opengis.net/sld"
				  xmlns:ogc="http://www.opengis.net/ogc"
				  xmlns:cp="urn:x-inspire:specification:gmlas:CadastralParcels:3.0"
				  xmlns:base="urn:x-inspire:specification:gmlas:BaseTypes:3.2">
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
	<FeatureTypeName>cp:CadastralParcel</FeatureTypeName>

	<Rule>
		<Title>INSPIRE CadastralParcels (CP)</Title>
		<!-- <MaxScaleDenominator>32000</MaxScaleDenominator> -->


		<PolygonSymbolizer>
			<Geometry>
				<ogc:PropertyName>cp:geometry</ogc:PropertyName>
			</Geometry>

			<Fill>
				<CssParameter name="fill">
					<ogc:Literal>#aaaaaa</ogc:Literal>
				</CssParameter>
				<CssParameter name="fill-opacity">
					<ogc:Literal>0.4</ogc:Literal>
				</CssParameter>
			</Fill>
			<Stroke>
				<CssParameter name="stroke">#111111</CssParameter>
				<CssParameter name="stroke-width">1</CssParameter>
			</Stroke>
		</PolygonSymbolizer>

	</Rule>

	<Rule>
		<!-- <MaxScaleDenominator>32000</MaxScaleDenominator> -->
		<TextSymbolizer>

	<!--		<Geometry>
				<ogc:PropertyName>cp:position/AD:GeographicPosition/AD:geometry</ogc:PropertyName>
			</Geometry>      -->

			<Label>
				<ogc:PropertyName>cp:label</ogc:PropertyName>
			</Label>
			<Font>
				<CssParameter name="font-family">Arial</CssParameter>
				<CssParameter name="font-weight">Normal</CssParameter>
				<CssParameter name="font-size">10</CssParameter>
			</Font>
			<LabelPlacement>
				<PointPlacement>
					<Displacement>
						<DisplacementX>0</DisplacementX>
						<DisplacementY>-15</DisplacementY>
					</Displacement>
				</PointPlacement>
			</LabelPlacement>
			<Halo>
				<Radius>2</Radius>
				<Fill>
					<CssParameter name="fill">#FFFFFF</CssParameter>
				</Fill>
			</Halo>
			<Fill>
				<CssParameter name="fill">#0000CC</CssParameter>
			</Fill>
		</TextSymbolizer>
	</Rule>

</FeatureTypeStyle>

