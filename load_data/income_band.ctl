LOAD CSV
     FROM '/tmp/income_band.dat' ( ib_income_band_sk ,
                                      ib_lower_bound ,
                                      ib_upper_bound

     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?income_band (ib_income_band_sk ,
                                                                              ib_lower_bound ,
                                                                              ib_upper_bound
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists income_band; $$,
    $$ create table income_band (
        ib_income_band_sk         integer               not null,
        ib_lower_bound            integer                       ,
        ib_upper_bound            integer
       );
  $$;

