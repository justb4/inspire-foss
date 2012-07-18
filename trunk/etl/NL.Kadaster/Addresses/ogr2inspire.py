#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import optparse
from ConfigParser import ConfigParser
from util import Util, ConfigSection, XsltTransformer, etree, StringIO
from deegree import DeegreeOutput
from ogr2gml import Ogr2Ogr

log = Util.get_log('ogr2inspire')

class ETL:
    # Constructor
    def __init__(self):
        usage = "usage: %prog [options]"
        parser = optparse.OptionParser(usage)
        parser.add_option("-c", "--config", action="store", type="string", dest="config_file",
                          default="etl.cfg",
                          help="ETL config file")
        parser.add_option("-o", "--overwrite", action="store_true", dest="overwrite",
                          default=False,
                          help="Overwrite existing Features (default is no, i.e. append) ?")

        self.options, args = parser.parse_args()
        self.fileName = '/dev/stdin'
        if len(args) == 1:
            log.info("args[0]=%s" % args[0])
            self.fileName = args[0]

        # Default config file
        config_file = self.options.config_file
        self.configdict = ConfigParser()
        try:
            self.configdict.read(config_file)
        except:
            log.warning("ik kan " + str(config_file) + " wel vinden maar niet inlezen.")

    def process_buf(self, buffer, xslt):
        log.info("process_buf")
        buffer.seek(0)
        # buffer = codecs.getreader("utf8")(buffer)
        # Open het GML bestand; verwijder hierbij nodes met alleen whitespace
        parser = etree.XMLParser(remove_blank_text=True)
        # gmlF=open(args.GML, 'r')
        # print 'parse'
        gmlDoc = etree.parse(buffer, parser)
        # print buffer.getvalue()
        buffer.close()

        # Voer gelijk de transformatie uit
        result_doc = xslt.xslt(gmlDoc)

        return result_doc

    def run(self):
        input = Ogr2Ogr(self.configdict)
        ogr_splitter = OgrSplitter(self.configdict)
        xslt = XsltTransformer(self.configdict)
        deegree = DeegreeOutput(self.configdict, self.options.overwrite)
        deegree.init()

        layer_names = input.get_layer_names()
        for layer_name in layer_names:
            input.exec_layer(layer_name)

            while 1:
                 line = input.readline()
                 if not line:
                     line = input.readline_err()
                     if not line:
                        log.info("EOF All")
                        break
                 else:
                     buffer = ogr_splitter.push_line(line)
                     if buffer is not None:
                        result_doc = self.process_buf(buffer, xslt)
                        deegree.publish_gml_blob_db(result_doc)

                 print line

#        xslt = XsltTransformer(self.configdict)
#
#
#        deegree = DeegreeOutput(self.configdict, self.options.overwrite)
#        deegree.init()
#
#        ogr_splitter = OgrSplitter(xslt, deegree)
#        ogr_splitter.process(self.fileName)


class OgrSplitter:
    startFCTag = '''<?xml version="1.0" encoding="UTF-8"?>
    <ogr:FeatureCollection
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://ogr.maptools.org/ my.xsd"
     xmlns:ogr="http://ogr.maptools.org/"
     xmlns:gml="http://www.opengis.net/gml">
     '''
    endFCTag = '</ogr:FeatureCollection>'
    startFeatureTag = '<ogr:featureMember>'
    endFeatureTag = '</ogr:featureMember>'
    deegree = None

    # Constructor
    def __init__(self, configdict):
        self.cfg = ConfigSection(configdict.items('ogr_splitter'))
        log.info("cfg=%s" % self.cfg.to_string())
        self.max_features = 10000
        self.buffer = None

    def init_buf(self):
        buffer = StringIO()
        buffer = codecs.getwriter("utf8")(buffer)

        buffer.write(OgrSplitter.startFCTag)
        #        buffer.write('<!--  %s -->\n' % logMsg)
        return buffer

    def push_line(self, line):

        if self.buffer is None:
            self.buffer = self.init_buf()
            self.inHeading = True
            self.inFeature = False
            self.feature_count = 0

        if line.find(OgrSplitter.startFeatureTag) >= 0:
            if self.inHeading:
                self.inHeading = False

            self.buffer.write(line)
            self.feature_count += 1
            self.buffer.write('<!-- Feature #%s -->\n' % self.feature_count)
            self.inFeature = True

        else:
            if line.find(OgrSplitter.endFeatureTag) >= 0:
                # Start or end tag of ogr:feature  element
                self.inHeading = False
                self.inFeature = False

                # Start or end feature
                self.buffer.write(line)
                if not self.feature_count % self.max_features:
                    self.buffer.write(OgrSplitter.endFCTag)
                    buffer = self.buffer
                    self.buffer = None
                    return buffer


            if self.inFeature:
                self.buffer.write(line)

            if line.find(OgrSplitter.endFCTag) >= 0:
                if self.buffer is not None:
                    self.buffer.write(line)
                    buffer = self.buffer
                    self.buffer = None
                    return buffer

        return None


    def process(self, file_name):
        fileIN = codecs.open(file_name, 'r', 'utf-8')

        maxFeat = 10000
        inHeading = True
        inFeature = False
        line = 1
        featCount = 0

        buffer = self.init_buf()
        while line:
            line = fileIN.readline()
            if line.find(OgrSplitter.startFeatureTag) >= 0:
                if buffer is None:
                    buffer = self.init_buf()

                if inHeading:
                    inHeading = False

                buffer.write(line)
                featCount += 1
                buffer.write('<!-- Feature #%s -->\n' % featCount)
                inFeature = True

            else:
                if line.find(OgrSplitter.endFeatureTag) >= 0:
                    # Start or end tag of ogr:feature  element
                    inHeading = False
                    inFeature = False

                    # Start or end feature
                    buffer.write(line)
                    if not featCount % maxFeat:
                        buffer.write(OgrSplitter.endFCTag)
                        self.process_buf(buffer)
                        buffer = None
                    continue

                if inFeature:
                    buffer.write(line)
                    continue

                if line.find(OgrSplitter.endFCTag) >= 0:
                    if buffer is not None:
                        buffer.write(line)
                        self.process_buf(buffer)
                        break


#        self.output.publish_gml_stdout(etree.tostring(resultDoc, pretty_print=True, xml_declaration=True, encoding='UTF-8'))


def main():
    etl = ETL()
    etl.run()

main()
