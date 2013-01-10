<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">         
<sld:NamedLayer>
    <se:Name>GE.HydroObject</se:Name>
    <sld:UserStyle>
      <se:Name> GE.HydroObject.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>Hydrography default style</se:Title>
          <se:Abstract> Points of contact between surface waters and ground water bodies as springs or seeps and vanishing points or sinkholes are rendered by symbols.</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>SpringOrSeep</se:FeatureTypeName>
        <se:Rule>
          <se:PointSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Graphic>
              <se:ExternalGraphic>
                 <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../spring.png"/>
                 <Format>image/png</Format> 
              </ExternalGraphic> 
              <se:Size>
		          <se:SvgParameter name="size">10.0</se:SvgParameter>
              </se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
        <se:FeatureTypeName>VanishingPoint</se:FeatureTypeName>
        <se:Rule>
          <se:PointSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Graphic>
              <se:Mark>
                <se:WellKnownName>triangle</se:WellKnownName>
               <se:Fill>
				     <se:SvgParameter name="fill">#FFFFFF</se:SvgParameter>
               </se:Fill>
               <se:Stroke>
					 <se:SvgParameter name="stroke">#33FFFF</se:SvgParameter>
					 <se:SvgParameter name="stroke-width">1</se:SvgParameter>
               </se:Stroke>
              </se:Mark>
              <se:Opacity>
                <se:SvgParameter name="opacity">0.5</se:SvgParameter>
              </se:Opacity>
              <se:Size>
			       <se:SvgParameter name="size">10</se:SvgParameter>
              </se:Size>
            </se:Graphic>
          </se:PointSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
