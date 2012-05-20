#!/usr/bin/env python
# -*- coding: utf-8 -*-

from ConfigParser import ConfigParser
configdict = ConfigParser()

from postgis import PostGIS
import logging
logging.info("start")
log = logging.getLogger(__name__)
log.setLevel(logging.DEBUG)

# Feature type id lookup
feature_type_ids = {}

import sys
try:
    from osgeo import ogr #apt-get install python-gdal
except ImportError:
    print("FATAAL: GDAL Python bindings not available, install e.g. with 'apt-get install python-gdal'")
    sys.exit(-1)

try:
  from lxml import etree
  log.info("running with lxml.etree")
except ImportError:
  try:
    # Python 2.5
    import xml.etree.cElementTree as etree
    log.warning("running with cElementTree on Python 2.5+")
  except ImportError:
    try:
      # Python 2.5
      import xml.etree.ElementTree as etree
      log.warning("running with ElementTree on Python 2.5+")
    except ImportError:
      try:
        # normal cElementTree install
        import cElementTree as etree
        log.warning("running with cElementTree")
      except ImportError:
        try:
          # normal ElementTree install
          import elementtree.ElementTree as etree
          log.warning("running with ElementTree")
        except ImportError:
          log.warning("Failed to import ElementTree from any known place")

import codecs

try:
    from cStringIO import StringIO
    logMsg = "running with cStringIO"
except:
    from StringIO import StringIO
    logMsg = "running with StringIO"

start = '''<?xml version="1.0" encoding="UTF-8"?>
<ogr:FeatureCollection
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://ogr.maptools.org/ .xsd"
     xmlns:ogr="http://ogr.maptools.org/"
     xmlns:gml="http://www.opengis.net/gml">
     '''

end = '</ogr:FeatureCollection>'
featureMemberTag='ogr:featureMember'
startOGRTag='<ogr:'

# Open het XSLT-bestand
xsltF=open('local-to-inspire-ad-sd.xsl', 'r')
xsltDoc=etree.parse(xsltF)
xslt=etree.XSLT(xsltDoc)
xsltF.close()

# Open het GML bestand; verwijder hierbij nodes met alleen whitespace
#parser = etree.XMLParser(remove_blank_text=True)
#gmlF=open(args.GML, 'r')
#gmlDoc=etree.parse(gmlF, parser)
#gmlF.close()


def init_buf():
    buffer = StringIO()
    buffer = codecs.getwriter("utf8")(buffer)

    buffer.write(start)
    buffer.write('<!--  %s -->\n' % logMsg)
    return buffer

def publish_gml_deegree_fsloader(s):
    from subprocess import Popen, PIPE, STDOUT

    p = Popen(['../../../tools/loader/bin/fsloader.sh', 'inspire-postgis', 'inspire_blob', 'GML_32', 'USE_EXISTING', '/dev/stdin'], stdout=PIPE, stdin=PIPE, stderr=STDOUT)

    p.stdin.write(s)

    result = p.communicate()[0]

    print(result)

def publish_gml_stdout(s):
    print(s)

def get_feature_types():
    db = PostGIS(dict(configdict.items('db_target')))
    db.connect()
    sql  = "SELECT id,qname FROM feature_types"
    db.uitvoeren(sql)
    cur = db.cursor
    for record in cur:
        feature_type_ids[record[1]] = record[0]

def publish_gml_blob_db(gmlDoc):
    db = PostGIS(dict(configdict.items('db_target')))
    db.connect()
    NS={'base':'urn:x-inspire:specification:gmlas:BaseTypes:3.2', 'gml':'http://www.opengis.net/gml/3.2'}

    featureMembers = gmlDoc.xpath('//base:member/*', namespaces=NS)
    count = 0
    for childNode in featureMembers:
        gml_id = childNode.get('{http://www.opengis.net/gml/3.2}id')
        feature_type_id = feature_type_ids[childNode.tag]

        # Find a GML geometry in the GML NS
        ogrGeomWKT = None
        gmlMembers = childNode.xpath(".//gml:Point|.//gml:Curve|.//gml:Surface|.//gml:MultiSurface", namespaces = NS)
        for gmlMember in gmlMembers:
            gmlStr = etree.tostring(gmlMember)
            ogrGeom = ogr.CreateGeometryFromGML(str(gmlStr))
            if ogrGeom is not None:
                ogrGeomWKT = ogrGeom.ExportToWkt()
                if ogrGeomWKT is not None:
                    break

        blob = etree.tostring(childNode, pretty_print=False, xml_declaration=False, encoding='UTF-8')

        sql  = "INSERT INTO gml_objects(gml_id, ft_type, binary_object, gml_bounded_by) VALUES (%s, %s, %s, ST_GeomFromEWKT(%s))"
        parameters = (gml_id, feature_type_id, db.make_bytea(blob), ogrGeomWKT)
        db.uitvoeren(sql, parameters)
        count += 1

    db.connection.commit()
    log.info("inserted %s features" % count)

def process_buf(buffer):
    buffer.seek(0)
    # buffer = codecs.getreader("utf8")(buffer)
    # Open het GML bestand; verwijder hierbij nodes met alleen whitespace
    parser = etree.XMLParser(remove_blank_text=True)
    # gmlF=open(args.GML, 'r')
    # print 'parse'
    gmlDoc=etree.parse(buffer, parser)
    # print buffer.getvalue()
    buffer.close()

    # Voer gelijk de transformatie uit
    resultDoc=xslt(gmlDoc)
    publish_gml_blob_db(resultDoc)

#    publish_gml_stdout(etree.tostring(resultDoc, pretty_print=True, xml_declaration=True, encoding='UTF-8'))

def main():
   # Default config file
    config_file = 'etl.cfg'
    try:
        configdict.read(config_file)
    except:
        log.warning("ik kan " + str(config_file) + " wel vinden maar niet inlezen.")

    get_feature_types()

    fileIN = codecs.open('/dev/stdin', 'r', 'utf-8')

    maxFeat = 10000
    inHeading = True
    line = 1
    featCount = 0
    buffer = init_buf()
    while line:
        line = fileIN.readline()
        if line.find(featureMemberTag) == -1:
            if inHeading:
                continue

            buffer.write(line)
        else:
            # Start or end tag of ogr:feature  element
            inHeading = False

            # Start or end feature
            buffer.write(line)

            if line.find(startOGRTag) == -1:
                # End feature
                if not featCount % maxFeat:
                    buffer.write(end)
                    process_buf(buffer)

                    buffer = init_buf()
            else:
                # Start of feature element
                featCount += 1
                buffer.write('<!-- Feature #%s -->\n' % featCount)


    process_buf(buffer)


main()
