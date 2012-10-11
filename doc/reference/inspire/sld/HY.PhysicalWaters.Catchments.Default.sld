<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">   
<sld:NamedLayer>
    <se:Name>HY.PhysicalWaters.Catchments</se:Name>
    <sld:UserStyle>
      <se:Name>HY.PhysicalWaters.Catchments.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>Catchments default style</se:Title>
          <se:Abstract>Drainage Basin areas are portrayed by no filled polygons with a solid blue (#0066FF) border with stroke width of 4 pixel the RiverBasin features and with stroke width of 2 pixel the DrainageBasin ones.</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>PhysicalWaters.DrainageBasin</se:FeatureTypeName>
        <se:Rule>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#0066FF</se:SvgParameter>
               <se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:FeatureTypeName>PhysicalWaters.RiverBasin</se:FeatureTypeName>
        <se:Rule>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#0066FF</se:SvgParameter>
               <se:SvgParameter name="stroke-width">4</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
