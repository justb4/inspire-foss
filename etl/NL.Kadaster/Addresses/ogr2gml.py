#!/usr/bin/env python
# Generates GML from BAG data in PostGIS database
# Database tables are structured according to NLExtract BAG DB schema
# For schema see: https://github.com/opengeogroep/NLExtract/blob/master/bag/db/script/bag-db.SQL
# Author:Just van den Broecke

import os
import optparse
import shutil
import re
import subprocess
import logging

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s %(levelname)s %(message)s')

def main():
    usage = "usage: %prog [options]"
    parser = optparse.OptionParser(usage)
    parser.add_option("-p", "--pg", action="store", type="string", dest="pg_args",
                     default="host=localhost dbname=bag active_schema=public user=postgres password=postgres port=5432",
                      help="Postgres connection string")

    options, args = parser.parse_args()

#    if not options.pg_args:
#        parser.error('Must choose one-- try -m or -B')

    if len(args) == 1:
        print("args[0]=%s" % args[0])
    else:
        parser.print_help()

            # Merging branch requires latest merged master

#    if options.merge_branch:
#        options.merge_master = True
#
#    if options.merge_master:
#        output,_ = call_command('git status')
#        match = re.search('# On branch ([^\s]*)', output)
#        branch = None
#        if match is None:
#            raise Exception('Could not get status')
#        elif match.group(1) == 'master':
#            raise Exception('You must be in the branch that you want to merge, not master')
#        else:
#            branch = match.group(1)
#            logging.info('In branch %s' % branch)
#
#        if output.endswith('nothing to commit (working directory clean)\n'):
#            logging.info('Directory clean in branch: %s' % branch)
#        else:
#            raise Exception('Directory not clean, must commit:\n%s' % output)
#
#        logging.info('Switching to master branch')
#        output,_ = call_command('git checkout master')
#
#        output,_ = call_command('git pull')
#        logging.info('Pulled latest changes from origin into master')
#        logging.info('Ensuring master has the latest changes')
#        output,_ = call_command('git pull')
#        if 'up-to-date' not in output:
#            raise Exception('Local copy was not up to date:\n%s' % output)
#        else:
#            logging.info('Local copy up to date')
#
#        logging.info('Switching back to branch: %s' % branch)
#        output,_ = call_command('git checkout %s' % branch)
#
#        output,_ = call_command('git merge master')
#        logging.info('Merged latest master changes into branch: %s' % branch)
#        logging.info('Ensuring latest master changes in branch: %s' % branch)
#        output,_ = call_command('git merge master')
#        if 'up-to-date' not in output:
#            raise Exception('Branch %s not up to date:\n%s' % (branch, output))
#        else:
#            logging.info('Branch %s up to date' % branch)
#
#        logging.info('Successfully merged master into branch %s' % branch)
#


def call_command(command):
    process = subprocess.Popen(command.split(' '),
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE)
    return process.communicate()

if __name__ == "__main__":
    main()

