#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Output classes for ETL.
#
# Author: Just van den Broecke
#
from postgis import PostGIS
from component import Component
from util import ConfigSection, Util, etree, StringIO
import os,sys

log = Util.get_log('output')

# Base class: Output Component
class Output(Component):
    # Constructor
    def __init__(self, configdict, section):
        Component.__init__(self, configdict, section)

        log.info("cfg = %s" % self.cfg.to_string())

    def invoke(self, doc):
        self.write(doc)
        return None

    def to_string(self, gml_doc):
        return etree.tostring(gml_doc, pretty_print=True, xml_declaration=True, encoding='utf-8')

    def write(self, gml_doc):
        print(self.to_string(gml_doc))

# Pretty print XML to file
class FileOutput(Output):
    def __init__(self, configdict, section):
        Output.__init__(self, configdict, section)
        log.info("working dir %s" %os.getcwd())

    def write(self, gml_doc):
        file_path = self.cfg.get('file_path')
        log.info('writing to file %s' % file_path)
        out_file = open(file_path, 'w')
        out_file.writelines(self.to_string(gml_doc))
        out_file.close()
        log.info("written to %s" % file_path)

# Insert features into deegree Blobstore
class DeegreeBlobstoreOutput(Output):

    def __init__(self, configdict, section):
        Output.__init__(self, configdict, section)
        self.overwrite = self.cfg.get_bool('overwrite')
        self.feature_member_tag = self.cfg.get('feature_member_tag')
        self.feature_type_ids = {}
        self.init()

    def init(self):
        self.get_feature_types()
        # not required for now
        # self.pg_srs_constraint()
        if self.overwrite:
            self.delete_features()

    def get_feature_types(self):
        log.info('reading all featuretypes from DB')
        db = PostGIS(self.cfg.get_dict())
        db.connect()
        sql = "SELECT id,qname FROM feature_types"
        db.uitvoeren(sql)
        cur = db.cursor
        for record in cur:
            self.feature_type_ids[record[1]] = record[0]

    def delete_features(self):
        log.info('deleting ALL features in DB')
        db = PostGIS(self.cfg.get_dict())
        db.tx_uitvoeren("TRUNCATE gml_objects")

    def pg_srs_constraint(self):
        log.info('set srs constraint')
        db = PostGIS(self.cfg.get_dict())
        db.tx_uitvoeren(
            "ALTER TABLE gml_objects DROP CONSTRAINT enforce_srid_gml_bounded_by; ALTER TABLE gml_objects ADD CHECK (st_srid(gml_bounded_by) = (4258));")

    def write(self, gml_doc):
        log.info('inserting features in DB')
        db = PostGIS(self.cfg.get_dict())
        db.connect()
#        NS = {'base': 'urn:x-inspire:specification:gmlas:BaseTypes:3.2', 'gml': 'http://www.opengis.net/gml/3.2'}
#        featureMembers = gml_doc.xpath('//base:member/*', namespaces=NS)
        featureMembers = gml_doc.xpath("//*[local-name() = '%s']/*" % self.feature_member_tag)
        count = 0
        gml_ns = None
        for childNode in featureMembers:
            if gml_ns is None:
                gml_ns = childNode.nsmap['gml']
            gml_id = childNode.get('{%s}id' % gml_ns)
            feature_type_id = self.feature_type_ids[childNode.tag]

            # Find a GML geometry in the GML NS
            ogrGeomWKT = None
#            gmlMembers = childNode.xpath(".//gml:Point|.//gml:Curve|.//gml:Surface|.//gml:MultiSurface", namespaces=NS)
            gmlMembers = childNode.xpath(".//*[local-name() = 'Point']|.//*[local-name() = 'Curve']|.//*[local-name() = 'Surface']|.//*[local-name() = 'MultiSurface']")
            geom_str = None
            for gmlMember in gmlMembers:
                geom_str = etree.tostring(gmlMember)
            #                   no need for GDAL Python bindings for now, maybe when we'll optimize with COPY iso INSERT
            #                    ogrGeom = ogr.CreateGeometryFromGML(str(gmlStr))
            #                    if ogrGeom is not None:
            #                        ogrGeomWKT = ogrGeom.ExportToWkt()
            #                        if ogrGeomWKT is not None:
            #                            break

            blob = etree.tostring(childNode, pretty_print=False, xml_declaration=False, encoding='UTF-8')

            if geom_str is None:
                sql = "INSERT INTO gml_objects(gml_id, ft_type, binary_object) VALUES (%s, %s, %s)"
                parameters = (gml_id, feature_type_id, db.make_bytea(blob))
            else:
                sql = "INSERT INTO gml_objects(gml_id, ft_type, binary_object, gml_bounded_by) VALUES (%s, %s, %s, ST_GeomFromGML(%s) )"
                parameters = (gml_id, feature_type_id, db.make_bytea(blob), geom_str)

            db.uitvoeren(sql, parameters)
            count += 1

        db.connection.commit()
        log.info("inserted %s features" % count)

# Insert features via deegree FSLoader
class DeegreeFSLoaderOutput(Output):

    def __init__(self, configdict, section):
        Output.__init__(self, configdict, section)

    def write(self, gml_doc):
        from subprocess import Popen, PIPE, STDOUT
        fs_loader = self.cfg.get('file_path')

        p = Popen([fs_loader, 'inspire-postgis', 'inspire_blob', 'GML_32', 'USE_EXISTING',
                '/dev/stdin'], stdout=PIPE, stdin=PIPE, stderr=STDOUT)

        p.stdin.write(self.to_string(gml_doc))

        result = p.communicate()[0]

         # print(result)

