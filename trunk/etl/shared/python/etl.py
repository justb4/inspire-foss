#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Main ETL program.
#
# Author: Just van den Broecke
#
import codecs
import optparse
from ConfigParser import ConfigParser
from util import Util, etree, StringIO
from gmlsplitter import GmlSplitter
from factory import factory

log = Util.get_log('etl main')

class ETL:

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

        # Get config file path
        config_file = self.options.config_file
        self.configdict = ConfigParser()
        try:
            # parse config file
            self.configdict.read(config_file)
        except:
            log.warning("Found " + str(config_file) + " but cannot read it.")

    def process_buf(self, buffer):
        log.info("process single buffer")
        buffer.seek(0)
        # bufStr = buffer.getvalue()

        # buffer = codecs.getreader("utf8")(buffer)
        # Open het GML bestand; verwijder hierbij nodes met alleen whitespace
        # log.info("parse buffer: content=[%s]" % bufStr)
        gmlDoc = etree.parse(buffer, self.xml_parser)
        buffer.close()

        # Voer gelijk de transformatie uit
        result_doc = self.transformer.transform(gmlDoc)

        return result_doc

    def run(self):
        # The main ETL processing

        # Create input/transformer/output objects
        input = factory.create_obj('input', self.configdict)
        output = factory.create_obj('output', self.configdict)
        self.transformer = factory.create_obj('transformer', self.configdict)

        # Reusable XML parser
        self.xml_parser = etree.XMLParser(remove_blank_text=True)

        # Process each of the layers from the input object
        layer_names = input.get_layer_names()
        for layer_name in layer_names:
            log.info("processing layer: %s" % layer_name)

            # Start layer
            input.exec_layer(layer_name)

            # New splitter for each layer
            gml_splitter = GmlSplitter(self.configdict)

            # Get (GML) lines from the input as long as available
            while 1:
                 line = input.readline()
                 if not line:
                     line = input.readline_err()
                     if not line:
                        log.info("EOF All")
                        break
                 else:
                     # Valid line: push to the splitter
                     # If buffer filled process it
                     buffer = gml_splitter.push_line(line)
                     if buffer is not None:
                        # Process/transform data in buffer
                        result_doc = self.process_buf(buffer)

                        # Write to output e.g. DB
                        output.write(result_doc)

def main():
    # Do the ETL
    etl = ETL()
    etl.run()

if __name__ == "__main__":
    main()
