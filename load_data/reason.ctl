LOAD CSV
     FROM '/tmp/reason.dat' ( r_reason_sk  ,
                              r_reason_id ,
                              r_reason_desc
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?reason (r_reason_sk  ,
                                                                         r_reason_id ,
                                                                         r_reason_desc
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists reason; $$,
    $$ create table reason (
         r_reason_sk               integer               not null,
         r_reason_id               char(16)              not null,
         r_reason_desc             char(100),
          primary key (r_reason_sk)
       );
  $$;

