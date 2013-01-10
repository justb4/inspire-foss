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
 <se:Name>TN.RoadTransportNetwork.VehicleTrafficArea</se:Name>
 <UserStyle>
  <se:Name> TN.RoadTransportNetwork.VehicleTrafficArea.Default</se:Name>
  <IsDefault>1</IsDefault>
  <se:FeatureTypeStyle version="1.1.0">
   <se:Description>
    <se:Title>Vehicle Traffic Area Default Style</se:Title>
    <se:Abstract>The geometry is rendered using a grey (#A9A9A9) fill and a solid black (#000000) outline with a stroke width of 1 pixel.</se:Abstract>
   </se:Description>
   <se:FeatureTypeName>TN:VehicleTrafficArea</se:FeatureTypeName>
   <se:Rule>
    <se:PolygonSymbolizer>
     <se:Geometry>
      <ogc:PropertyName>Network:geometry</ogc:PropertyName>
     </se:Geometry>
     <se:Fill/>
     <se:Stroke/>
    </se:PolygonSymbolizer>
   </se:Rule>
  </se:FeatureTypeStyle>
 </UserStyle>
</NamedLayer>
</StyledLayerDescriptor>
