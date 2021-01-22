# Setup tpc-ds on postgresql
## Generation des data 
```shell script
  git clone  https://github.com/system-dev-formations/tpc-ds-postgresql.git 
  cd tpc-ds-postgresql
  cd tpcds-kit/tools  
  make
  # generate 1Gb of data from tpc-ds 
  
  ./dsdgen -DIR /tmp -SCALE 1 -FORCE -VERBOSE   
```
