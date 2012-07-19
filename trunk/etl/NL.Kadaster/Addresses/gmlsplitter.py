#!/usr/bin/env python
# -*- coding: utf-8 -*-

import codecs
import optparse
from ConfigParser import ConfigParser
from util import Util, ConfigSection, etree, StringIO

log = Util.get_log('gmlsplitter')

class GmlSplitter:

    # Constructor
    def __init__(self, configdict):
        self.cfg = ConfigSection(configdict.items('gml_splitter'))
        log.info("cfg=%s" % self.cfg.to_string())
        self.max_features = self.cfg.get_int('max_features', 10000)
        self.start_container = self.cfg.get('start_container')
        self.end_container_tag = self.cfg.get('end_container_tag')
        self.start_feature_tag = self.cfg.get('start_feature_tag')
        self.end_feature_tag = self.cfg.get('end_feature_tag')
        self.buffer = None
        self.eof = False

    def init_buf(self):
        buffer = StringIO()
        buffer = codecs.getwriter("utf8")(buffer)
        return buffer

    def push_line(self, line):
        if self.eof:
            return None

        if self.buffer is None and self.eof is False:
            self.buffer = self.init_buf()
            self.in_heading = True
            self.in_feature = False
            self.feature_count = 0

        if line.find(self.start_feature_tag) >= 0:
            if self.in_heading:
                self.buffer.write(self.start_container)
                self.in_heading = False

            self.buffer.write(line)
            self.feature_count += 1
            self.buffer.write('<!-- Feature #%s -->\n' % self.feature_count)
            self.in_feature = True

        else:
            if line.find(self.end_feature_tag) >= 0:
                # Start or end tag of ogr:feature  element
                self.in_heading = False
                self.in_feature = False

                # Start or end feature
                self.buffer.write(line)
                if self.feature_count % self.max_features is 0:
                    self.buffer.write(self.end_container_tag)
                    buffer = self.buffer
                    self.buffer = None
                    log.info("Buffer filled feat_count = %d" % self.feature_count)
                    return buffer


            if self.in_feature:
                self.buffer.write(line)

            if line.find(self.end_container_tag) >= 0:
                if self.buffer is not None and self.feature_count > 0:
                    if self.feature_count % self.max_features > 0:
                        self.buffer.write(line)
                    buffer = self.buffer
                    self.buffer = None
                    self.eof = True
                    log.info("Buffer filled (EOF) feat_count = %d" % self.feature_count)
                    return buffer

        return None


    def process_file(self, file_name):
        file_in = codecs.open(file_name, 'r', 'utf-8')
        line = file_in.readline()

        while line:
            buffer = self.push_line(line)
            if buffer:
                print buffer.getvalue()
            line = file_in.readline()


def main():
    usage = "usage: %prog [options]"
    parser = optparse.OptionParser(usage)
    parser.add_option("-c", "--config", action="store", type="string", dest="config_file",
                     default="etl.cfg",
                      help="ETL config file")

    options, args = parser.parse_args()
    config_file = options.config_file
    configdict = ConfigParser()

    try:
        configdict.read(config_file)
    except:
        log.warning("ik kan " + str(config_file) + " wel vinden maar niet inlezen.")

    options, args = parser.parse_args()
    file_name = '/dev/stdin'
    if len(args) == 1:
        log.info("args[0]=%s" % args[0])
        file_name = args[0]

    gml_splitter = GmlSplitter(configdict)
    gml_splitter.process_file(file_name)

if __name__ == "__main__":
    main()
