LOAD CSV
     FROM '/tmp/customer.dat' (  c_customer_sk        ,
                                 c_customer_id      ,
                                 c_current_cdemo_sk ,
                                 c_current_hdemo_sk ,
                                 c_current_addr_sk  ,
                                 c_first_shipto_date_sk ,
                                 c_first_sales_date_sk ,
                                 c_salutation   ,
                                 c_first_name   ,
                                 c_last_name    ,
                                 c_preferred_cust_flag   ,
                                 c_birth_day    ,
                                 c_birth_month  ,
                                 c_birth_year   ,
                                 c_birth_country  ,
                                 c_login     ,
                                 c_email_address    ,
                                 c_last_review_date_sk
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?customer (  c_customer_sk        ,
                                                                             c_customer_id      ,
                                                                             c_current_cdemo_sk ,
                                                                             c_current_hdemo_sk ,
                                                                             c_current_addr_sk  ,
                                                                             c_first_shipto_date_sk ,
                                                                             c_first_sales_date_sk ,
                                                                             c_salutation   ,
                                                                             c_first_name   ,
                                                                             c_last_name    ,
                                                                             c_preferred_cust_flag   ,
                                                                             c_birth_day    ,
                                                                             c_birth_month  ,
                                                                             c_birth_year   ,
                                                                             c_birth_country  ,
                                                                             c_login     ,
                                                                             c_email_address    ,
                                                                             c_last_review_date_sk
        )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists customer; $$,
    $$ create table customer (
                c_customer_sk             integer               not null,
                c_customer_id             char(16)              not null,
                c_current_cdemo_sk        integer                       ,
                c_current_hdemo_sk        integer                       ,
                c_current_addr_sk         integer                       ,
                c_first_shipto_date_sk    integer                       ,
                c_first_sales_date_sk     integer                       ,
                c_salutation              char(10)                      ,
                c_first_name              char(20)                      ,
                c_last_name               char(30)                      ,
                c_preferred_cust_flag     char(1)                       ,
                c_birth_day               integer                       ,
                c_birth_month             integer                       ,
                c_birth_year              integer                       ,
                c_birth_country           varchar(20)                   ,
                c_login                   char(13)                      ,
                c_email_address           char(50)                      ,
                c_last_review_date_sk     integer,
                 primary key (c_customer_sk)
       );
  $$;

