LOAD CSV
   FROM '/tmp/catalog_page.dat' (cp_catalog_page_sk   ,
                                 cp_catalog_page_id   ,
                                 cp_start_date_sk     ,
                                 cp_end_date_sk       ,
                                 cp_department        ,
                                 cp_catalog_number    ,
                                 cp_catalog_page_number,
                                 cp_description       ,
                                 cp_type
) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?catalog_page (  cp_catalog_page_sk   ,
                                                                                 cp_catalog_page_id   ,
                                                                                 cp_start_date_sk     ,
                                                                                 cp_end_date_sk       ,
                                                                                 cp_department        ,
                                                                                 cp_catalog_number    ,
                                                                                 cp_catalog_page_number,
                                                                                 cp_description       ,
                                                                                 cp_type
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists catalog_page; $$,
    $$ create table catalog_page (
            cp_catalog_page_sk        integer               not null,
            cp_catalog_page_id        char(16)              not null,
            cp_start_date_sk          integer                       ,
            cp_end_date_sk            integer                       ,
            cp_department             varchar(50)                   ,
            cp_catalog_number         integer                       ,
            cp_catalog_page_number    integer                       ,
            cp_description            varchar(100)                  ,
            cp_type                   varchar(100),
             primary key (cp_catalog_page_sk)

  );
  $$;

