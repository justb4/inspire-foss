#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import optparse
from ConfigParser import ConfigParser
from util import Util, ConfigSection, XsltTransformer, etree, StringIO
from deegree import DeegreeOutput
from ogr2gml import Ogr2Ogr
from gmlsplitter import GmlSplitter

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
        gml_splitter = GmlSplitter(self.configdict)
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
                     buffer = gml_splitter.push_line(line)
                     if buffer is not None:
                        result_doc = self.process_buf(buffer, xslt)
                        deegree.publish_gml_blob_db(result_doc)

                 # print line


def main():
    etl = ETL()
    etl.run()

main()
