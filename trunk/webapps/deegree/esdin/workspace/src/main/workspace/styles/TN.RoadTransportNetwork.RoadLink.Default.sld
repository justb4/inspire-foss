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
<NamedLayer>
 <se:Name>TN.RoadTransportNetwork.RoadLink</se:Name>
 <UserStyle>
  <se:Name> TN.RoadTransportNetwork.RoadLink.Default</se:Name>
  <IsDefault>1</IsDefault>
  <se:FeatureTypeStyle version="1.1.0">
   <se:Description>
    <se:Title>RoadLink Default Style</se:Title>
    <se:Abstract> The geometry is rendered as a solid Green line with a stroke width of 3 pixel (#008000). Ends are rounded and have a 2 pixel black casing (#000000).</se:Abstract>
   </se:Description>
   <se:FeatureTypeName>TN:RoadLink</se:FeatureTypeName>
   <se:Rule>
    <se:LineSymbolizer>
     <se:Geometry>
      <ogc:PropertyName>Network:centrelineGeometry</ogc:PropertyName>
     </se:Geometry>
     <se:Stroke/>
    </se:LineSymbolizer>
   </se:Rule>
  </se:FeatureTypeStyle>
 </UserStyle>
</NamedLayer>
</StyledLayerDescriptor>
