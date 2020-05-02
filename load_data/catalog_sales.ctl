LOAD CSV
     FROM '/tmp/catalog_sales.dat' (cs_sold_date_sk           ,
                                    cs_sold_time_sk           ,
                                    cs_ship_date_sk           ,
                                    cs_bill_customer_sk       ,
                                    cs_bill_cdemo_sk          ,
                                    cs_bill_hdemo_sk          ,
                                    cs_bill_addr_sk           ,
                                    cs_ship_customer_sk       ,
                                    cs_ship_cdemo_sk          ,
                                    cs_ship_hdemo_sk          ,
                                    cs_ship_addr_sk           ,
                                    cs_call_center_sk         ,
                                    cs_catalog_page_sk        ,
                                    cs_ship_mode_sk           ,
                                    cs_warehouse_sk           ,
                                    cs_item_sk                ,
                                    cs_promo_sk               ,
                                    cs_order_number           ,
                                    cs_quantity               ,
                                    cs_wholesale_cost         ,
                                    cs_list_price             ,
                                    cs_sales_price            ,
                                    cs_ext_discount_amt       ,
                                    cs_ext_sales_price        ,
                                    cs_ext_wholesale_cost     ,
                                    cs_ext_list_price         ,
                                    cs_ext_tax                ,
                                    cs_coupon_amt             ,
                                    cs_ext_ship_cost          ,
                                    cs_net_paid               ,
                                    cs_net_paid_inc_tax       ,
                                    cs_net_paid_inc_ship      ,
                                    cs_net_paid_inc_ship_tax  ,
                                    cs_net_profit
     ) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?catalog_sales ( cs_sold_date_sk           ,
                                                                                 cs_sold_time_sk           ,
                                                                                 cs_ship_date_sk           ,
                                                                                 cs_bill_customer_sk       ,
                                                                                 cs_bill_cdemo_sk          ,
                                                                                 cs_bill_hdemo_sk          ,
                                                                                 cs_bill_addr_sk           ,
                                                                                 cs_ship_customer_sk       ,
                                                                                 cs_ship_cdemo_sk          ,
                                                                                 cs_ship_hdemo_sk          ,
                                                                                 cs_ship_addr_sk           ,
                                                                                 cs_call_center_sk         ,
                                                                                 cs_catalog_page_sk        ,
                                                                                 cs_ship_mode_sk           ,
                                                                                 cs_warehouse_sk           ,
                                                                                 cs_item_sk                ,
                                                                                 cs_promo_sk               ,
                                                                                 cs_order_number           ,
                                                                                 cs_quantity               ,
                                                                                 cs_wholesale_cost         ,
                                                                                 cs_list_price             ,
                                                                                 cs_sales_price            ,
                                                                                 cs_ext_discount_amt       ,
                                                                                 cs_ext_sales_price        ,
                                                                                 cs_ext_wholesale_cost     ,
                                                                                 cs_ext_list_price         ,
                                                                                 cs_ext_tax                ,
                                                                                 cs_coupon_amt             ,
                                                                                 cs_ext_ship_cost          ,
                                                                                 cs_net_paid               ,
                                                                                 cs_net_paid_inc_tax       ,
                                                                                 cs_net_paid_inc_ship      ,
                                                                                 cs_net_paid_inc_ship_tax  ,
                                                                                 cs_net_profit
  
     )
     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists catalog_sales; $$,
    $$ create table catalog_sales (
             cs_sold_date_sk           integer                       ,
             cs_sold_time_sk           integer                       ,
             cs_ship_date_sk           integer                       ,
             cs_bill_customer_sk       integer                       ,
             cs_bill_cdemo_sk          integer                       ,
             cs_bill_hdemo_sk          integer                       ,
             cs_bill_addr_sk           integer                       ,
             cs_ship_customer_sk       integer                       ,
             cs_ship_cdemo_sk          integer                       ,
             cs_ship_hdemo_sk          integer                       ,
             cs_ship_addr_sk           integer                       ,
             cs_call_center_sk         integer                       ,
             cs_catalog_page_sk        integer                       ,
             cs_ship_mode_sk           integer                       ,
             cs_warehouse_sk           integer                       ,
             cs_item_sk                integer               not null,
             cs_promo_sk               integer                       ,
             cs_order_number           integer               not null,
             cs_quantity               integer                       ,
             cs_wholesale_cost         decimal(7,2)                  ,
             cs_list_price             decimal(7,2)                  ,
             cs_sales_price            decimal(7,2)                  ,
             cs_ext_discount_amt       decimal(7,2)                  ,
             cs_ext_sales_price        decimal(7,2)                  ,
             cs_ext_wholesale_cost     decimal(7,2)                  ,
             cs_ext_list_price         decimal(7,2)                  ,
             cs_ext_tax                decimal(7,2)                  ,
             cs_coupon_amt             decimal(7,2)                  ,
             cs_ext_ship_cost          decimal(7,2)                  ,
             cs_net_paid               decimal(7,2)                  ,
             cs_net_paid_inc_tax       decimal(7,2)                  ,
             cs_net_paid_inc_ship      decimal(7,2)                  ,
             cs_net_paid_inc_ship_tax  decimal(7,2)                  ,
             cs_net_profit             decimal(7,2)























           
       );
  $$;

