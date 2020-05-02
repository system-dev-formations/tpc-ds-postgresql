LOAD CSV
     FROM '/tmp/store_returns.dat' ( sr_returned_date_sk    ,
                                     sr_return_time_sk      ,
                                     sr_item_sk             ,
                                     sr_customer_sk         ,
                                     sr_cdemo_sk            ,
                                     sr_hdemo_sk            ,
                                     sr_addr_sk             ,
                                     sr_store_sk            ,
                                     sr_reason_sk           ,
                                     sr_ticket_number       ,
                                     sr_return_quantity     ,
                                     sr_return_amt          ,
                                     sr_return_tax          ,
                                     sr_return_amt_inc_tax  ,
                                     sr_fee                 ,
                                     sr_return_ship_cost    ,
                                     sr_refunded_cash       ,
                                     sr_reversed_charge     ,
                                     sr_store_credit        ,
                                     sr_net_loss
      )
     INTO postgresql://postgres:password@localhost:5432/tpc-test?store_returns ( sr_returned_date_sk    ,
                                                                                 sr_return_time_sk      ,
                                                                                 sr_item_sk             ,
                                                                                 sr_customer_sk         ,
                                                                                 sr_cdemo_sk            ,
                                                                                 sr_hdemo_sk            ,
                                                                                 sr_addr_sk             ,
                                                                                 sr_store_sk            ,
                                                                                 sr_reason_sk           ,
                                                                                 sr_ticket_number       ,
                                                                                 sr_return_quantity     ,
                                                                                 sr_return_amt          ,
                                                                                 sr_return_tax          ,
                                                                                 sr_return_amt_inc_tax  ,
                                                                                 sr_fee                 ,
                                                                                 sr_return_ship_cost    ,
                                                                                 sr_refunded_cash       ,
                                                                                 sr_reversed_charge     ,
                                                                                 sr_store_credit        ,
                                                                                 sr_net_loss
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists store_returns; $$,
    $$ create table store_returns (
            sr_returned_date_sk       integer                       ,
            sr_return_time_sk         integer                       ,
            sr_item_sk                integer               not null,
            sr_customer_sk            integer                       ,
            sr_cdemo_sk               integer                       ,
            sr_hdemo_sk               integer                       ,
            sr_addr_sk                integer                       ,
            sr_store_sk               integer                       ,
            sr_reason_sk              integer                       ,
            sr_ticket_number          integer               not null,
            sr_return_quantity        integer                       ,
            sr_return_amt             decimal(7,2)                  ,
            sr_return_tax             decimal(7,2)                  ,
            sr_return_amt_inc_tax     decimal(7,2)                  ,
            sr_fee                    decimal(7,2)                  ,
            sr_return_ship_cost       decimal(7,2)                  ,
            sr_refunded_cash          decimal(7,2)                  ,
            sr_reversed_charge        decimal(7,2)                  ,
            sr_store_credit           decimal(7,2)                  ,
            sr_net_loss               decimal(7,2)
        
       );
  $$;

