LOAD CSV
   FROM '/tmp/warehouse.dat' ( w_warehouse_sk ,
    w_warehouse_id     ,
    w_warehouse_name   ,
    w_warehouse_sq_ft  ,
    w_street_number    ,
    w_street_name      ,
    w_street_type      ,
    w_suite_number     ,
    w_city             , 
    w_county           ,
    w_state            ,  
    w_zip              ,
    w_country         ,
    w_gmt_offset    
) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?warehouse ( w_warehouse_sk ,
    w_warehouse_id     ,
    w_warehouse_name   ,
    w_warehouse_sq_ft  ,
    w_street_number    ,
    w_street_name      ,
    w_street_type      ,
    w_suite_number     ,
    w_city             ,
    w_county           ,
    w_state            ,
    w_zip              ,
    w_country         ,
    w_gmt_offset
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists warehouse; $$,
    $$ create table warehouse (
    w_warehouse_sk            integer               not null,
    w_warehouse_id            char(16)              not null,
    w_warehouse_name          varchar(20)                   ,
    w_warehouse_sq_ft         integer                       ,
    w_street_number           char(10)                      ,
    w_street_name             varchar(60)                   ,
    w_street_type             char(15)                      ,
    w_suite_number            char(10)                      ,
    w_city                    varchar(60)                   ,
    w_county                  varchar(30)                   ,
    w_state                   char(2)                       ,
    w_zip                     char(10)                      ,
    w_country                 varchar(20)                   ,
    w_gmt_offset              decimal(5,2)       
  );
  $$;

