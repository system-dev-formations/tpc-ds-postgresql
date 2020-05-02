#!/usr/bin/env python

import glob
import os

files= glob.glob("*.ctl")

for f in files:
  print("Loading  data file...",f )
  cmd= "pgloader {}".format(f)
  os.system(cmd )



