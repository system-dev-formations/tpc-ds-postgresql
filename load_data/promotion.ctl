LOAD CSV
   FROM '/tmp/promotion.dat' ( p_promo_sk       ,
                               p_promo_id       ,
                               p_start_date_sk  ,
                               p_end_date_sk    ,
                               p_item_sk        ,
                               p_cost           ,
                               p_response_target,
                               p_promo_name     ,
                               p_channel_dmail  ,
                               p_channel_email  ,
                               p_channel_catalog,
                               p_channel_tv     ,
                               p_channel_radio  ,
                               p_channel_press  ,
                               p_channel_event  ,
                               p_channel_demo   ,
                               p_channel_details,
                               p_purpose        ,
                               p_discount_active
) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?promotion (   p_promo_sk       , 
                                                                              p_promo_id       , 
                                                                              p_start_date_sk  , 
                                                                              p_end_date_sk    , 
                                                                              p_item_sk        , 
                                                                              p_cost           , 
                                                                              p_response_target, 
                                                                              p_promo_name     , 
                                                                              p_channel_dmail  , 
                                                                              p_channel_email  , 
                                                                              p_channel_catalog, 
                                                                              p_channel_tv     , 
                                                                              p_channel_radio  , 
                                                                              p_channel_press  , 
                                                                              p_channel_event  , 
                                                                              p_channel_demo   , 
                                                                              p_channel_details, 
                                                                              p_purpose        , 
                                                                              p_discount_active  
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists promotion; $$,
    $$ create table promotion (
      p_promo_sk                integer               not null,
        p_promo_id                char(16)              not null,
        p_start_date_sk           integer                       ,
        p_end_date_sk             integer                       ,
        p_item_sk                 integer                       ,
        p_cost                    decimal(15,2)                 ,
        p_response_target         integer                       ,
        p_promo_name              char(50)                      ,
        p_channel_dmail           char(1)                       ,
        p_channel_email           char(1)                       ,
        p_channel_catalog         char(1)                       ,
        p_channel_tv              char(1)                       ,
        p_channel_radio           char(1)                       ,
        p_channel_press           char(1)                       ,
        p_channel_event           char(1)                       ,
        p_channel_demo            char(1)                       ,
        p_channel_details         varchar(100)                  ,
        p_purpose                 char(15)                      ,
        p_discount_active         char(1) ,
        primary key (p_promo_sk)
  );
  $$;

