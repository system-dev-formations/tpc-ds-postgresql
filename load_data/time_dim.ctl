LOAD CSV
     FROM '/tmp/time_dim.dat' (t_time_sk ,           
                                   t_time_id  ,
                                   t_time  ,
                                   t_hour  ,
                                   t_minute  ,
                                   t_second  ,
                                   t_am_pm  ,
                                   t_shift  ,
                                   t_sub_shift  ,
                                   t_meal_time                          
) 
     INTO postgresql://postgres:password@localhost:5432/tpc_test?time_dim ( t_time_sk ,
                                                                            t_time_id ,
                                                                            t_time  ,
                                                                            t_hour  ,
                                                                            t_minute  ,
                                                                            t_second  ,
                                                                            t_am_pm  ,
                                                                            t_shift  ,
                                                                            t_sub_shift  ,
                                                                            t_meal_time
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists time_dim; $$,
    $$ create table time_dim (
       t_time_sk                 integer               not null,
       t_time_id                 char(16)              not null,
       t_time                    integer                       ,
       t_hour                    integer                       ,
       t_minute                  integer                       ,
       t_second                  integer                       ,
       t_am_pm                   char(2)                       ,
       t_shift                   char(20)                      ,
       t_sub_shift               char(20)                      ,
       t_meal_time               char(20),
       primary key (t_time_sk)
  );
  $$;

