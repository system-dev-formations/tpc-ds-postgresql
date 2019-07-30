#!/usr/bin/env python

import fnmatch
import os
import re


def recursive_glob(rootdir='.', pattern='*'):
    return [os.path.join(looproot, filename)
            for looproot, _, filenames in os.walk(rootdir)
            for filename in filenames
            if fnmatch.fnmatch(filename, pattern)]


datfiles = recursive_glob('/tmp', '*.dat')

for f in datfiles:
    m = re.search('(\/tmp\/)(.*)(....)', f)
    table = m.group(2)
    # print table

    m = re.search('(\/tmp\/)(.*)', f)
    data_file = m.group(2)
    # print data_file

    cmd = "sed 's/.$//' {} | tee /tmp/newvalue.dat && mv /tmp/newvalue.dat {} ".format(f, f)
    os.system(cmd)
