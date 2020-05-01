LOAD CSV
     FROM '/tmp/date_dim.dat' (d_date_sk,
    d_date_id                ,
    d_date                   ,
    d_month_seq              ,
    d_week_seq               ,
    d_quarter_seq            ,
    d_year                   ,
    d_dow                    ,
    d_moy                    ,
    d_dom                    ,
    d_qoy                    ,
    d_fy_year                ,
    d_fy_quarter_seq         ,
    d_fy_week_seq            ,
    d_day_name               ,
    d_quarter_name           ,
    d_holiday                ,
    d_weekend                ,
    d_following_holiday      ,
    d_first_dom              ,
    d_last_dom               ,
    d_same_day_ly            ,
    d_same_day_lq            ,
    d_current_day            ,
    d_current_week           ,
    d_current_month          ,
    d_current_quarter        ,
    d_current_year 
) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?date_dim ( d_date_sk,
    d_date_id                ,
    d_date                   ,
    d_month_seq              ,
    d_week_seq               ,
    d_quarter_seq            ,
    d_year                   ,
    d_dow                    ,
    d_moy                    ,
    d_dom                    ,
    d_qoy                    ,
    d_fy_year                ,
    d_fy_quarter_seq         ,
    d_fy_week_seq            ,
    d_day_name               ,
    d_quarter_name           ,
    d_holiday                ,
    d_weekend                ,
    d_following_holiday      ,
    d_first_dom              ,
    d_last_dom               ,
    d_same_day_ly            ,
    d_same_day_lq            ,
    d_current_day            ,
    d_current_week           ,
    d_current_month          ,
    d_current_quarter        ,
    d_current_year

)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists date_dim; $$,
    $$ create table date_dim (
    d_date_sk                 integer               not null,
    d_date_id                 char(16)              not null,
    d_date                    date                          ,
    d_month_seq               integer                       ,
    d_week_seq                integer                       ,
    d_quarter_seq             integer                       ,
    d_year                    integer                       ,
    d_dow                     integer                       ,
    d_moy                     integer                       ,
    d_dom                     integer                       ,
    d_qoy                     integer                       ,
    d_fy_year                 integer                       ,
    d_fy_quarter_seq          integer                       ,
    d_fy_week_seq             integer                       ,
    d_day_name                char(9)                       ,
    d_quarter_name            char(6)                       ,
    d_holiday                 char(1)                       ,
    d_weekend                 char(1)                       ,
    d_following_holiday       char(1)                       ,
    d_first_dom               integer                       ,
    d_last_dom                integer                       ,
    d_same_day_ly             integer                       ,
    d_same_day_lq             integer                       ,
    d_current_day             char(1)                       ,
    d_current_week            char(1)                       ,
    d_current_month           char(1)                       ,
    d_current_quarter         char(1)                       ,
    d_current_year            char(1) 
  );
  $$;

