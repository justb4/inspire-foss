from postgis import PostGIS
from util import ConfigSection, Util, etree, StringIO
log = Util.get_log('output')

class DeegreeBlobstoreOutput:
    def __init__(self, configdict):
        self.cfg = ConfigSection(configdict.items('output'))
        log.info("cfg = %s" % self.cfg.to_string())
        self.overwrite = self.cfg.get_bool('overwrite')
        self.feature_type_ids = {}
        self.init()

    def init(self):
        self.get_feature_types()
        self.pg_srs_constraint()
        if self.overwrite:
            self.delete_features()

    def publish_gml_deegree_fsloader(self, s):
        from subprocess import Popen, PIPE, STDOUT

        p = Popen(['../../../tools/loader/bin/fsloader.sh', 'inspire-postgis', 'inspire_blob', 'GML_32', 'USE_EXISTING',
                   '/dev/stdin'], stdout=PIPE, stdin=PIPE, stderr=STDOUT)

        p.stdin.write(s)

        result = p.communicate()[0]

        print(result)

    def publish_gml_stdout(self, s):
        print(s)

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
        NS = {'base': 'urn:x-inspire:specification:gmlas:BaseTypes:3.2', 'gml': 'http://www.opengis.net/gml/3.2'}

        featureMembers = gml_doc.xpath('//base:member/*', namespaces=NS)
        count = 0
        for childNode in featureMembers:
            gml_id = childNode.get('{http://www.opengis.net/gml/3.2}id')
            feature_type_id = self.feature_type_ids[childNode.tag]

            # Find a GML geometry in the GML NS
            ogrGeomWKT = None
            gmlMembers = childNode.xpath(".//gml:Point|.//gml:Curve|.//gml:Surface|.//gml:MultiSurface", namespaces=NS)
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
                sql = "INSERT INTO gml_objects(gml_id, ft_type, binary_object, gml_bounded_by) VALUES (%s, %s, %s, ST_GeomFromGML(%s))"
                parameters = (gml_id, feature_type_id, db.make_bytea(blob), geom_str)

            db.uitvoeren(sql, parameters)
            count += 1

        db.connection.commit()
        log.info("inserted %s features" % count)
