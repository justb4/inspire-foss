#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Transformation modules.
#
# Author:Just van den Broecke

from util import ConfigSection, Util, etree

log = Util.get_log("transformer")

class XsltTransformer:
    # Constructor
    def __init__(self, configdict):
        self.cfg = ConfigSection(configdict.items('transformer'))

        self.xslt_file_path = self.cfg.get('script')
        self.xslt_file = open(self.xslt_file_path, 'r')
        self.xslt_doc = etree.parse(self.xslt_file)
        self.xslt_obj = etree.XSLT(self.xslt_doc)
        self.xslt_file.close()

    def transform(self, doc):
        log.info("XSLT Transform")
        return self.xslt_obj(doc)

