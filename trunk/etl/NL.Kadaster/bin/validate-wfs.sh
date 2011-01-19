val_wfs=../../../tools/validator/bin/validate-wfs.sh

# GetCapabilities URL:

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetCapabilities&version=1.1.0&service=WFS'

# GetFeature (AU:AdministrativeUnit):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=AU:AdministrativeUnit&namespace=xmlns%28AU=urn:x-inspire:specification:gmlas:AdministrativeUnits:3.0%29&maxFeatures=10&outputFormat=text/xml;%20subtype=gml/3.2.1'

# DescribeFeatureType request (CP:CadastralParcel):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=DescribeFeatureType&version=1.1.0&service=WFS&typeName=CP:CadastralParcel&namespace=xmlns%28CP=urn:x-inspire:specification:gmlas:CadastralParcels:3.0%29&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (CP:CadastralParcel):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=CP:CadastralParcel&namespace=xmlns%28CP=urn:x-inspire:specification:gmlas:CadastralParcels:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (GN:NamedPlace):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=GN:NamedPlace&namespace=xmlns%28GN=urn:x-inspire:specification:gmlas:GeographicalNames:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (HY-P:Watercourse):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=HY-P:Watercourse&namespace=xmlns%28HY-P=urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (HY-P:StandingWater):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=HY-P:StandingWater&namespace=xmlns%28HY-P=urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (HY-P:DamOrWeir):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=HY-P:DamOrWeir&namespace=xmlns%28HY-P=urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (HY-P:Lock):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=HY-P:Lock&namespace=xmlns%28HY-P=urn:x-inspire:specification:gmlas:HydroPhysicalWaters:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (TN-RO:RoadNode):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadNode&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (TN-RO:RoadLink):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadLink&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (TN-RO:RoadArea):

$val_wfs 'http://inspire.kademo.nl/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadArea&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'
