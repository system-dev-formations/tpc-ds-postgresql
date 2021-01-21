# Setup tpc-ds on postgresql
## Install postgresql from source
```shell
wget https://ftp.postgresql.org/pub/source/v13.1/postgresql-13.1.tar.gz
cd postgresql-13.1
 ./configure --prefix=/opt/pgsql131 --with-python
 make -j`nproc`
 
```

## Install the test database 
```shell script
  git clone   https://github.com/system-dev-formations/tpc-ds-postgresql.git 
  cd tpc-ds-postgresql
  cd tpcds-kit/tools  
  make
  # generate 1Gb of data from tpc-ds 
  
  ./dsdgen -DIR /tmp -SCALE 1 -FORCE -VERBOSE   
```
