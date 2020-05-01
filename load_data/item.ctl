LOAD CSV
     FROM '/tmp/item.dat' ( i_item_sk                 ,
                               i_item_id              ,
                               i_rec_start_date       ,
                               i_rec_end_date         ,
                               i_item_desc            ,
                               i_current_price        ,
                               i_wholesale_cost       ,
                               i_brand_id             ,
                               i_brand                ,
                               i_class_id             ,
                               i_class                ,
                               i_category_id          ,
                               i_category             ,
                               i_manufact_id          ,
                               i_manufact             ,
                               i_size                 ,
                               i_formulation          ,
                               i_color                ,
                               i_units                ,
                               i_container            ,
                               i_manager_id           ,
                               i_product_name
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?item ( i_item_sk                 ,
                                                                      i_item_id              ,
                                                                       i_rec_start_date       ,
                                                                      i_rec_end_date         ,
                                                                       i_item_desc            ,
                                                                       i_current_price        ,
                                                                        i_wholesale_cost       ,
                                                                       i_brand_id             ,
                                                                       i_brand                ,
                                                                       i_class_id             ,
                                                                        i_class                ,
                                                                       i_category_id          ,
                                                                       i_category             ,
                                                                        i_manufact_id          ,
                                                                         i_manufact             ,
                                                                        i_size                 ,
                                                                        i_formulation          ,
                                                                        i_color                ,
                                                                       i_units                ,
                                                                        i_container            ,
                                                                        i_manager_id           ,
                                                                        i_product_name
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists item; $$,
    $$ create table item (
        i_item_sk                 integer               not null,
        i_item_id                 char(16)              not null,
        i_rec_start_date          date                          ,
        i_rec_end_date            date                          ,
        i_item_desc               varchar(200)                  ,
        i_current_price           decimal(7,2)                  ,
        i_wholesale_cost          decimal(7,2)                  ,
        i_brand_id                integer                       ,
        i_brand                   char(50)                      ,
        i_class_id                integer                       ,
        i_class                   char(50)                      ,
        i_category_id             integer                       ,
        i_category                char(50)                      ,
        i_manufact_id             integer                       ,
        i_manufact                char(50)                      ,
        i_size                    char(20)                      ,
        i_formulation             char(20)                      ,
        i_color                   char(20)                      ,
        i_units                   char(10)                      ,
        i_container               char(10)                      ,
        i_manager_id              integer                       ,
        i_product_name            char(50)
       );
  $$;

