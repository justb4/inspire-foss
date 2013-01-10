<?xml version="1.0" encoding="UTF-8"?>
<!--
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

<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">     
 <sld:NamedLayer>
    <se:Name>CP.CadastralBoundary</se:Name>
    <sld:UserStyle>
      <se:Name>CP.CadastralBoundary.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>Cadastral Boundary Default Style</se:Title>
          <se:Abstract> Cadastral boundary: black (#000000) line 1 pixel. 
                   </se:Abstract>
        </se:Description>

        <se:FeatureTypeName>CadastralBoundary</se:FeatureTypeName>

        <se:Rule>
          <se:MinScaleDenominator>1</se:MinScaleDenominator>
          <se:MaxScaleDenominator>20000</se:MaxScaleDenominator>
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
	 <se:SvgParameter name="stroke">#000000</se:SvgParameter>
	 <se:SvgParameter name="stroke-width">1</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>

      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
