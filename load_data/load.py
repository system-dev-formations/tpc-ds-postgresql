#!/usr/bin/env python

import glob
import os
import re

path='.'

files= [f for f in glob.glob(path+"**/*.ctl")]

for f in files:
  m= re.search('(\/tmp\/)(.*)(....)', f)
  table=m.group(2)
  #print table

  m = re.search('(\/tmp\/)(.*)', f)
  data_file=m.group(2)
  #print data_file

  #print("TRUNCATE table...",table)
  #cmd= "psql test-tpc -q -c 'TRUNCATE {}'".format(table)
  #os.system(cmd )

  print("Loading  data file...",f )
  cmd= "pgloader {}".format(f)
  os.system(cmd )



