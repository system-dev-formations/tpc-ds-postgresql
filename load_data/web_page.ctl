LOAD CSV
   FROM '/tmp/web_page.dat' ( wp_web_page_sk     ,
                              wp_web_page_id     ,
                              wp_rec_start_date  ,
                              wp_rec_end_date    ,
                              wp_creation_date_sk,
                              wp_access_date_sk  ,
                              wp_autogen_flag    ,
                              wp_customer_sk     ,
                              wp_url             ,
                              wp_type            ,
                              wp_char_count      ,
                              wp_link_count      ,
                              wp_image_count     ,
                              wp_max_ad_count
) 
     INTO postgresql://postgres:password@localhost:5432/tpc_test?web_page (  wp_web_page_sk     ,
                                                                             wp_web_page_id     ,
                                                                             wp_rec_start_date  ,
                                                                             wp_rec_end_date    ,
                                                                             wp_creation_date_sk,
                                                                             wp_access_date_sk  ,
                                                                             wp_autogen_flag    ,
                                                                             wp_customer_sk     ,
                                                                             wp_url             ,
                                                                             wp_type            ,
                                                                             wp_char_count      ,
                                                                             wp_link_count      ,
                                                                             wp_image_count     ,
                                                                             wp_max_ad_count
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists web_page; $$,
    $$ create table web_page (
          wp_web_page_sk            integer               not null,
          wp_web_page_id            char(16)              not null,
          wp_rec_start_date         date                          ,
          wp_rec_end_date           date                          ,
          wp_creation_date_sk       integer                       ,
          wp_access_date_sk         integer                       ,
          wp_autogen_flag           char(1)                       ,
          wp_customer_sk            integer                       ,
          wp_url                    varchar(100)                  ,
          wp_type                   char(50)                      ,
          wp_char_count             integer                       ,
          wp_link_count             integer                       ,
          wp_image_count            integer                       ,
          wp_max_ad_count           integer,
          primary key (wp_web_page_sk)
  );
  $$;

