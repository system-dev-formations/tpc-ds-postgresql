# Setup tpc-ds on postgresql
## Install 
```shell script
  git clone   https://github.com/system-dev-formations/tpc-ds-postgresql.git 
  cd tpc-ds-postgresql
  cd tpcds-kit/tools
  # install gcc g++ bison flex .... 
  make
  # generate 1Gb of data for tpc-ds 
  ./dsdgen -DIR /tmp -SCALE 1 -FORCE -VERBOSE
  
   
```
