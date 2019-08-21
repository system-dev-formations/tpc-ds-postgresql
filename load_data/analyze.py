#!/usr/bin/env python

import glob
import os
import re

path='/tmp'

files= [f for f in glob.glob(path+"**/*.dat")]

for f in files:
  m= re.search('(\/tmp\/)(.*)(....)', f)
  table=m.group(2)
  #print table

  print("ANALYZE table...",table)
  cmd= "psql test-tpc -q -c 'ANALYZE {}'".format(table)
  os.system(cmd )


