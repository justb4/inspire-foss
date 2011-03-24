val_wfs=../../../tools/validator/bin/validate-wfs.sh

# GetCapabilities URL:

$val_wfs 'http://localhost:8080/deegree3/services?request=GetCapabilities&version=1.1.0&service=WFS'

# GetFeature (TN-RO:RoadNode):

$val_wfs 'http://localhost:8080/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadNode&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (TN-RO:RoadLink):

$val_wfs 'http://localhost:8080/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadLink&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'

# GetFeature (TN-RO:RoadArea):

$val_wfs 'http://localhost:8080/deegree3/services?request=GetFeature&version=1.1.0&service=WFS&typeName=TN-RO:RoadArea&namespace=xmlns%28TN-RO=urn:x-inspire:specification:gmlas:RoadTransportNetwork:3.0%29&maxFeatures=5&outputFormat=text/xml;%20subtype=gml/3.2.1'
