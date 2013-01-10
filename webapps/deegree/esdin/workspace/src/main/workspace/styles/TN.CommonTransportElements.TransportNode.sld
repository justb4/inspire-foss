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

<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
<NamedLayer>
 <se:Name>TN.CommonTransportElements.TransportNode</se:Name>
 <UserStyle>
  <se:Name> TN.CommonTransportElements.TransportNode.Default</se:Name>
  <IsDefault>1</IsDefault>
  <se:FeatureTypeStyle version="1.1.0">
   <se:Description>
    <se:Title>Generic Node Default Style</se:Title>
    <se:Abstract>The geometry is rendered as a circle with a size of 3 pixels, with a red (#FF0000) fill and a black outline (#000000).</se:Abstract>
   </se:Description>
   <se:FeatureTypeName>Network:Node</se:FeatureTypeName>
   <se:Rule>
    <se:PointSymbolizer>
     <se:Geometry>
      <ogc:PropertyName>Network:geometry</ogc:PropertyName>
     </se:Geometry>
     <se:Graphic/>
    </se:PointSymbolizer>
   </se:Rule>
  </se:FeatureTypeStyle>
 </UserStyle>
</NamedLayer>
</StyledLayerDescriptor>
