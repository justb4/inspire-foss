<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">      
 <sld:NamedLayer>
    <se:Name>Am.WaterFrameworkDirective.WFDLake</se:Name>
    <sld:UserStyle>
      <se:Name> AM.WaterFrameworkDirective.WFDLake.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>WFD Lake default style</se:Title>
          <se:Abstract>For reporting purposes WFDLake are portrayed by a solid blue (#CCFFFF) polygon with blue (#33CCFF) border of 1 pixel width if they are classified as main and of 2 pixels if they are large, otherwise without border. Instances classified as artificial are filled with magenta (#CC0099) horizontal lines with stroke width of 2 pixels; if they are not artificial but heavilyModified will be filled with orange (#FF9900) vertical lines with stroke width of 2 pixels.</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>WaterFrameworkDirective.WFDLake</se:FeatureTypeName>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and ARTIFICIAL lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../artificial1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and HEAVILYMODIFIED lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../ heavilyModified1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and not artificial neither heavilyModified lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:SvgParameter name="fill">#CCFFFF</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--MAIN and ARTIFICIAL lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../artificial1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">1</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--MAIN and HEAVILYMODIFIED rivers-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../ heavilyModified1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">1</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--MAIN and not artificial neither heavilyModified lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:SvgParameter name="fill">#CCFFFF</se:SvgParameter>
            </se:Fill>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">1</se:SvgParameter>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main ARTIFICIAL lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false </ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../artificial1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main HEAVILYMODIFIED lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false </ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>true</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:GraphicFill>
                 <se:Graphic>
                    <se:ExternalGraphic>
                      <OnlineResource xmlns:xlink="http://www.w3.org/1999/xlink"     xlink:type="simple" 
                        xlink:href="http://.../ heavilyModified1.png"/> 
                      <Format>image/png</Format> 
                    </ExternalGraphic> 
                    <se:Size>
			             <se:SvgParameter name="size">10</se:SvgParameter>
                    </se:Size>
                 </se:Graphic>
               </se:GraphicFill>
            </se:Fill>
          </se:PolygonSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main not artificial neither heavilyModified lakes-->
             <ogc:and>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>large</ogc:PropertyName>
               <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
               <ogc:PropertyName>main</ogc:PropertyName>
               <ogc:Literal>false </ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>artificial</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              <se:PropertyIsEqualTo>
                <ogc:PropertyName>heavilyModified</ogc:PropertyName>
                  <ogc:Literal>false</ogc:Literal>
              </se:PropertyIsEqualTo>
              </ogc:and>
          </ogc:Filter>
          <se:PolygonSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Fill>
               <se:SvgParameter name="fill">#CCFFFF</se:SvgParameter>
            </se:Fill>
            </se:Stroke>
          </se:PolygonSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
