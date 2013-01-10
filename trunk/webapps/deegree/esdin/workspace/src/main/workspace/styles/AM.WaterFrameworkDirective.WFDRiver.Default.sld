<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor version="1.1.0" xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:sld="http://www.opengis.net/sld" xmlns:se="http://www.opengis.net/se">     
<sld:NamedLayer>
    <se:Name>AM.WaterFrameworkDirective.WFDRiver</se:Name>
    <sld:UserStyle>
      <se:Name> AM.WaterFrameworkDirective.WFDRiver.Default</se:Name>
      <sld:IsDefault>1</sld:IsDefault>
      <se:FeatureTypeStyle version="1.1.0">
        <se:Description>
          <se:Title>WFD River default style</se:Title>
          <se:Abstract>For reporting purposes WFDRiver are portrayed by a solid line with stroke width of 2 pixels if they are classified as main and of 3 pixels if they are large. The colour of the line is magenta (#CC0099) if they are artificial, orange (#FF9900) if they are considered heavily modified; otherwise is blue (#33CCFF).</se:Abstract>
        </se:Description>
        <se:FeatureTypeName>WaterFrameworkDirective.WFDRiver</se:FeatureTypeName>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and ARTIFICIAL rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#CC0099</se:SvgParameter>
					<se:SvgParameter name="stroke-width">3</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and HEAVILYMODIFIED rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#FF9900</se:SvgParameter>
					<se:SvgParameter name="stroke-width">3</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--LARGE and not artificial neither heavilyModified rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">3</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--MAIN and ARTIFICIAL rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#CC0099</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#FF9900</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--MAIN and not artificial neither heavilyModified rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
					<se:SvgParameter name="stroke-width">2</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main ARTIFICIAL rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#CC0099</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main HEAVILYMODIFIED rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#FF9900</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
        <se:Rule>
           <ogc:Filter>
            <!--Not large and not main not artificial neither heavilyModified rivers-->
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
          <se:LineSymbolizer>
            <se:Geometry>
              <ogc:PropertyName>geometry</ogc:PropertyName>
            </se:Geometry>
            <se:Stroke>
					<se:SvgParameter name="stroke">#33CCFF</se:SvgParameter>
            </se:Stroke>
          </se:LineSymbolizer>
        </se:Rule>
      </se:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</StyledLayerDescriptor>
