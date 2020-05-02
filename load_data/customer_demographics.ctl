LOAD CSV
     FROM '/tmp/customer_demographics.dat' ( cd_demo_sk ,
    cd_gender               ,
    cd_marital_status       ,
    cd_education_status     ,
    cd_purchase_estimate   , 
    cd_credit_rating       ,
    cd_dep_count           ,
    cd_dep_employed_count  ,
    cd_dep_college_count   

) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?customer_demographics ( cd_demo_sk,
    cd_gender               ,
    cd_marital_status       ,
    cd_education_status     ,
    cd_purchase_estimate   ,
    cd_credit_rating       ,
    cd_dep_count           ,
    cd_dep_employed_count  ,
    cd_dep_college_count

)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists customer_demographics; $$,
    $$ create table customer_demographics (
    cd_demo_sk                integer               not null,
    cd_gender                 char(1)                       ,
    cd_marital_status         char(1)                       ,
    cd_education_status       char(20)                      ,
    cd_purchase_estimate      integer                       ,
    cd_credit_rating          char(10)                      ,
    cd_dep_count              integer                       ,
    cd_dep_employed_count     integer                       ,
    cd_dep_college_count      integer ,
    primary key (cd_demo_sk)
  );
  $$;

