LOAD CSV
     FROM '/tmp/dbgen_version.dat' (dv_version, dv_create_date,dv_create_time,dv_cmdline_args) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?dbgen_version (dv_version,dv_create_date,dv_create_time,dv_cmdline_args)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists dbgen_version; $$,
    $$ create table dbgen_version (
           dv_version                varchar(16)  ,
           dv_create_date            date         ,
           dv_create_time            time         ,
           dv_cmdline_args           varchar(200)

       );
  $$;

