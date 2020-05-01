LOAD CSV
   FROM '/tmp/ship_mode.dat' ( sm_ship_mode_sk,
    sm_ship_mode_id         ,
    sm_type                 ,
    sm_code                 ,
    sm_carrier              ,
    sm_contract             

) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?ship_mode ( sm_ship_mode_sk,
    sm_ship_mode_id         ,
    sm_type                 ,
    sm_code                 ,
    sm_carrier              ,
    sm_contract

)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists ship_mode; $$,
    $$ create table ship_mode (
    sm_ship_mode_sk           integer               not null,
    sm_ship_mode_id           char(16)              not null,
    sm_type                   char(30)                      ,
    sm_code                   char(10)                      ,
    sm_carrier                char(20)                      ,
    sm_contract               char(20)                    

  );
  $$;

