LOAD CSV
     FROM '/tmp/inventory.dat' ( inv_date_sk            ,
                                 inv_item_sk            ,
                                 inv_warehouse_sk       ,
                                 inv_quantity_on_hand   
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?inventory (   inv_date_sk            ,
                                                                               inv_item_sk            ,
                                                                               inv_warehouse_sk       ,
                                                                               inv_quantity_on_hand
     )

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists inventory; $$,
    $$ create table inventory (
        inv_date_sk               integer               not null,
        inv_item_sk               integer               not null,
        inv_warehouse_sk          integer               not null,
        inv_quantity_on_hand      integer
    );
  $$;

