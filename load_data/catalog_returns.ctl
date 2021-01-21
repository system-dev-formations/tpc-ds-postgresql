LOAD CSV
     FROM '/tmp/catalog_returns.dat' ( cr_returned_date_sk       ,
                                       cr_returned_time_sk       ,
                                       cr_item_sk                ,
                                       cr_refunded_customer_sk   ,
                                       cr_refunded_cdemo_sk      ,
                                       cr_refunded_hdemo_sk      ,
                                       cr_refunded_addr_sk       ,
                                       cr_returning_customer_sk  ,
                                       cr_returning_cdemo_sk     ,
                                       cr_returning_hdemo_sk     ,
                                       cr_returning_addr_sk      ,
                                       cr_call_center_sk         ,
                                       cr_catalog_page_sk        ,
                                       cr_ship_mode_sk           ,
                                       cr_warehouse_sk           ,
                                       cr_reason_sk              ,
                                       cr_order_number          ,
                                       cr_return_quantity        ,
                                       cr_return_amount          ,
                                       cr_return_tax             ,
                                       cr_return_amt_inc_tax     ,
                                       cr_fee                    ,
                                       cr_return_ship_cost       ,
                                       cr_refunded_cash          ,
                                       cr_reversed_charge        ,
                                       cr_store_credit           ,
                                       cr_net_loss
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc_test?catalog_returns (    cr_returned_date_sk       ,
                                                                                      cr_returned_time_sk       ,
                                                                                      cr_item_sk                ,
                                                                                      cr_refunded_customer_sk   ,
                                                                                      cr_refunded_cdemo_sk      ,
                                                                                      cr_refunded_hdemo_sk      ,
                                                                                      cr_refunded_addr_sk       ,
                                                                                      cr_returning_customer_sk  ,
                                                                                      cr_returning_cdemo_sk     ,
                                                                                      cr_returning_hdemo_sk     ,
                                                                                      cr_returning_addr_sk      ,
                                                                                      cr_call_center_sk         ,
                                                                                      cr_catalog_page_sk        ,
                                                                                      cr_ship_mode_sk           ,
                                                                                      cr_warehouse_sk           ,
                                                                                      cr_reason_sk              ,
                                                                                      cr_order_number          ,
                                                                                      cr_return_quantity        ,
                                                                                      cr_return_amount          ,
                                                                                      cr_return_tax             ,
                                                                                      cr_return_amt_inc_tax     ,
                                                                                      cr_fee                    ,
                                                                                      cr_return_ship_cost       ,
                                                                                      cr_refunded_cash          ,
                                                                                      cr_reversed_charge        ,
                                                                                      cr_store_credit           ,
                                                                                      cr_net_loss
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists catalog_returns; $$,
    $$ create table catalog_returns (
           cr_returned_date_sk       integer                       ,
           cr_returned_time_sk       integer                       ,
           cr_item_sk                integer               not null,
           cr_refunded_customer_sk   integer                       ,
           cr_refunded_cdemo_sk      integer                       ,
           cr_refunded_hdemo_sk      integer                       ,
           cr_refunded_addr_sk       integer                       ,
           cr_returning_customer_sk  integer                       ,
           cr_returning_cdemo_sk     integer                       ,
           cr_returning_hdemo_sk     integer                       ,
           cr_returning_addr_sk      integer                       ,
           cr_call_center_sk         integer                       ,
           cr_catalog_page_sk        integer                       ,
           cr_ship_mode_sk           integer                       ,
           cr_warehouse_sk           integer                       ,
           cr_reason_sk              integer                       ,
           cr_order_number           integer               not null,
           cr_return_quantity        integer                       ,
           cr_return_amount          decimal(7,2)                  ,
           cr_return_tax             decimal(7,2)                  ,
           cr_return_amt_inc_tax     decimal(7,2)                  ,
           cr_fee                    decimal(7,2)                  ,
           cr_return_ship_cost       decimal(7,2)                  ,
           cr_refunded_cash          decimal(7,2)                  ,
           cr_reversed_charge        decimal(7,2)                  ,
           cr_store_credit           decimal(7,2)                  ,
           cr_net_loss               decimal(7,2),
             primary key (cr_item_sk, cr_order_number)
       );
  $$;

