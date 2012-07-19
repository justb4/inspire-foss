#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Input classes for ETL.
#
# Author: Just van den Broecke
#
import os
import optparse
import shutil
import re
import subprocess
from util import Util, ConfigSection
from ConfigParser import ConfigParser

log = Util.get_log('input')

class Ogr2Ogr:
    pg_conn_tmpl = "PG:host=%s dbname=%s active_schema=%s user=%s password=%s port=%s"
    cmd_tmpl = 'ogr2ogr|-t_srs|%s|-s_srs|%s|-f|GML|%s|-dsco|FORMAT=%s|-lco|DIM=%s|%s|-SQL|%s|-nln|%s|%s'

    # Constructor
    def __init__(self, configdict):
        self.configdict = configdict
        self.init()
#        self.cmd='ogr2ogr|-t_srs|EPSG:4258|-s_srs|EPSG:28992|-f|GML|/vsistdout/|-dsco|FORMAT=GML3|-lco|DIM=2|%s|-SQL|%s|-nln|adres|POINT'

    def init(self):
        self.cfg = ConfigSection(self.configdict.items('input'))
        host = self.cfg.get('host', 'localhost')
        db = self.cfg.get('database')
        schema = self.cfg.get('schema', 'public')
        user = self.cfg.get('user', 'postgres')
        password = self.cfg.get('password', 'postgres')
        port = self.cfg.get('port', '5432')

        self.pg = Ogr2Ogr.pg_conn_tmpl % (host,db,schema,user,password,port)

    def get_layer_names(self):
        layer_names = []
        for section_name in self.configdict.sections():
            if section_name.startswith('input_layer'):
                layer_names.append(section_name)
        return layer_names

    def exec_layer(self, db_layer_section):
        lcfg = ConfigSection(self.configdict.items(db_layer_section))
        log.info("run_layer section = [%s] name = [%s]" % (db_layer_section, lcfg.get('name')))
        t_srs = self.cfg.get('t_srs')
        s_srs = self.cfg.get('s_srs')
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

