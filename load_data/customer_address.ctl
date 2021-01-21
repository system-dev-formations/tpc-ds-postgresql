LOAD CSV
     FROM '/tmp/customer_address.dat' (ca_address_sk,
    ca_address_id        ,
    ca_street_number     ,
    ca_street_name       ,
    ca_street_type       ,
    ca_suite_number      ,
    ca_city              ,
    ca_county            ,
    ca_state             ,
    ca_zip               , 
    ca_country           ,
    ca_gmt_offset        ,
    ca_location_type     
) 
     INTO postgresql://postgres:password@localhost:5432/tpc_test?customer_address (ca_address_sk,
    ca_address_id        ,
    ca_street_number     ,
    ca_street_name       ,
    ca_street_type       ,
    ca_suite_number      ,
    ca_city              ,
    ca_county            ,
    ca_state             ,
    ca_zip               ,
    ca_country           ,
    ca_gmt_offset        ,
    ca_location_type
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists customer_address; $$,
    $$ create table customer_address (
    ca_address_sk             integer               not null,
    ca_address_id             char(16)              not null,
    ca_street_number          char(10)                      ,
    ca_street_name            varchar(60)                   ,
    ca_street_type            char(15)                      ,
    ca_suite_number           char(10)                      ,
    ca_city                   varchar(60)                   ,
    ca_county                 varchar(30)                   ,
    ca_state                  char(2)                       ,
    ca_zip                    char(10)                      ,
    ca_country                varchar(20)                   ,
    ca_gmt_offset             decimal(5,2)                  ,
    ca_location_type          char(20) ,
    primary key (ca_address_sk)
  );
  $$;

