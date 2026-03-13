SELECT
    order_id,
    bulk_sku,
    customer,
    order_date,
    sales,
    discount,
    profit,
FROM {{ref('stg_sales')}}
WHERE order_id IS NOT NULL 
