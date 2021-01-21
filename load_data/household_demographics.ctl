LOAD CSV
     FROM '/tmp/household_demographics.dat' ( hd_demo_sk         ,
                                              hd_income_band_sk  ,
                                              hd_buy_potential   ,
                                              hd_dep_count       ,
                                              hd_vehicle_count

     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc_test?household_demographics (   hd_demo_sk         ,
                                                                                            hd_income_band_sk  ,
                                                                                            hd_buy_potential   ,
                                                                                            hd_dep_count       ,
                                                                                            hd_vehicle_count
     )

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists household_demographics; $$,
    $$ create table household_demographics (
        hd_demo_sk                integer               not null,
        hd_income_band_sk         integer                       ,
        hd_buy_potential          char(15)                      ,
        hd_dep_count              integer                       ,
        hd_vehicle_count          integer,
        primary key (hd_demo_sk)
       );
  $$;

