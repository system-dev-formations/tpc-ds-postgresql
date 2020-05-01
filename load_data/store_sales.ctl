LOAD CSV
     FROM '/tmp/store_sales.dat' (  ss_sold_date_sk ,
         ss_sold_time_sk ,
         ss_item_sk,
         ss_customer_sk ,
         ss_cdemo_sk ,
         ss_hdemo_sk ,
         ss_addr_sk  ,
         ss_store_sk ,
         ss_promo_sk  ,
         ss_ticket_number ,
         ss_quantity      ,
         ss_wholesale_cost   ,
         ss_list_price , 
         ss_sales_price   ,
         ss_ext_discount_amt  ,
         ss_ext_sales_price   ,
         ss_ext_wholesale_cost ,
         ss_ext_list_price   ,
         ss_ext_tax   ,
         ss_coupon_amt   ,
         ss_net_paid     ,
         ss_net_paid_inc_tax   ,
         ss_net_profit     
) 
     INTO postgresql://postgres:password@localhost:5432/tpc-test?store_sales ( ss_sold_date_sk ,
         ss_sold_time_sk ,
         ss_item_sk,
         ss_customer_sk ,
         ss_cdemo_sk ,
         ss_hdemo_sk ,
         ss_addr_sk  ,
         ss_store_sk ,
         ss_promo_sk  ,
         ss_ticket_number ,
         ss_quantity      ,
         ss_wholesale_cost   ,
         ss_list_price ,
         ss_sales_price   ,
         ss_ext_discount_amt  ,
         ss_ext_sales_price   ,
         ss_ext_wholesale_cost ,
         ss_ext_list_price   ,
         ss_ext_tax   ,
         ss_coupon_amt   ,
         ss_net_paid     ,
         ss_net_paid_inc_tax   ,
         ss_net_profit
)

     WITH truncate,
          fields terminated by '|'

      SET client_encoding to 'utf-8',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists store_sales; $$,
    $$ create table store_sales (
         ss_sold_date_sk           integer                       ,
         ss_sold_time_sk           integer                       ,
         ss_item_sk                integer               not null,
         ss_customer_sk            integer                       ,
         ss_cdemo_sk               integer                       ,
         ss_hdemo_sk               integer                       ,
         ss_addr_sk                integer                       ,
         ss_store_sk               integer                       ,
         ss_promo_sk               integer                       ,
         ss_ticket_number          integer               not null,
         ss_quantity               integer                       ,
         ss_wholesale_cost         decimal(7,2)                  ,
         ss_list_price             decimal(7,2)                  ,
         ss_sales_price            decimal(7,2)                  ,
         ss_ext_discount_amt       decimal(7,2)                  ,
         ss_ext_sales_price        decimal(7,2)                  ,
         ss_ext_wholesale_cost     decimal(7,2)                  ,
         ss_ext_list_price         decimal(7,2)                  ,
         ss_ext_tax                decimal(7,2)                  ,
         ss_coupon_amt             decimal(7,2)                  ,
         ss_net_paid               decimal(7,2)                  ,
         ss_net_paid_inc_tax       decimal(7,2)                  ,
         ss_net_profit             decimal(7,2)                  
       );
  $$;

