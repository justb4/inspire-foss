#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:Just van den Broecke

import logging

import os
import optparse
import shutil
import re
import subprocess
from util import Util, ConfigSection
from ConfigParser import ConfigParser

log = Util.get_log('ogr2ogr')

class Ogr2Ogr:
    pg_conn_tmpl = "PG:host=%s dbname=%s active_schema=%s user=%s password=%s port=%s"
    cmd_tmpl = 'ogr2ogr|-t_srs|%s|-s_srs|%s|-f|GML|%s|-dsco|FORMAT=%s|-lco|DIM=%s|%s|-SQL|%s|-nln|%s|%s'

    # Constructor
    def __init__(self, configdict):
        self.configdict = configdict
        self.init_pg()
#        self.cmd='ogr2ogr|-t_srs|EPSG:4258|-s_srs|EPSG:28992|-f|GML|/vsistdout/|-dsco|FORMAT=GML3|-lco|DIM=2|%s|-SQL|%s|-nln|adres|POINT'

    def init_pg(self):
        pg_cfg = ConfigSection(self.configdict.items('db_source'))
        host = pg_cfg.get('host', 'localhost')
        db = pg_cfg.get('database')
        schema = pg_cfg.get('schema', 'public')
        user = pg_cfg.get('user', 'postgres')
        password = pg_cfg.get('password', 'postgres')
        port = pg_cfg.get('port', '5432')

        self.pg = Ogr2Ogr.pg_conn_tmpl % (host,db,schema,user,password,port)

    def get_layer_names(self):
        layer_names = []
        for section_name in self.configdict.sections():
            if section_name.startswith('db_source_layer'):
                layer_names.append(section_name)
        return layer_names

    def exec_layer(self, db_layer_section):
        lcfg = ConfigSection(self.configdict.items(db_layer_section))
        log.info("run_layer section = [%s] name = [%s]" % (db_layer_section, lcfg.get('name')))
        t_srs = lcfg.get('t_srs')
        s_srs = lcfg.get('s_srs')
        gml_out_file = lcfg.get('gml_out_file')
        gml_format = lcfg.get('gml_format')
        dimension = lcfg.get('dimension')
        sql = lcfg.get('sql')
        new_layer_name = lcfg.get('new_layer_name')
        geotype = lcfg.get('geotype', '')

        # Bouw ogr2ogr commando
        cmd = Ogr2Ogr.cmd_tmpl % (t_srs, s_srs, gml_out_file, gml_format, dimension, self.pg, sql, new_layer_name, geotype)
        cmd = cmd.split('|')
        self.exec_cmd(cmd)

    def exec_cmd(self, cmd):
        log.info("start ogr2ogr cmd = %s" % repr(cmd))
        self.eof_stdout = False
        self.eof_stderr = False
        self.process = subprocess.Popen(cmd,
                                   shell = False,
                                   stdout=subprocess.PIPE,
                                   stderr=subprocess.PIPE)
#        exit_code = self.process.returncode

    def readline(self):
        if self.eof_stdout is True:
            return None

        line = self.process.stdout.readline()
        if not line:
            self.eof_stdout = True
            log.info("EOF stdout")
            return None

        line = line.decode('utf-8')
        return line

    def readline_err(self):
        if self.eof_stderr is True:
            return None

        line = self.process.stderr.readline()
        if not line:
            self.eof_stderr = True
            log.info("EOF stderr")
            return None

        return line

    def process_layer(self, layer_name):
        self.exec_layer(layer_name)

        while 1:
             line = self.readline()
             if not line:
                 line = self.readline_err()
                 if not line:
                    log.info("EOF All")
                    break
             print line

    def process(self):
        layer_names = self.get_layer_names()
        for layer_name in layer_names:
            self.process_layer(layer_name)

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

#    if len(args) == 1:
#        print("args[0]=%s" % args[0])
#    else:
#        parser.print_help()

    ogr2ogr = Ogr2Ogr(configdict)
    ogr2ogr.process()

if __name__ == "__main__":
    main()

