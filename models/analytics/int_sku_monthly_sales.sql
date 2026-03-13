SELECT 
    bulk_sku,
    date_trunc('month', order_date) as sales_month,
    sum(sales) as monthly_sales,
    sum(profit) as monthly_profit,
    sum(discount) as monthly_discount,
FROM {{ref('fct_sales')}}
WHERE order_date is not null
GROUP BY bulk_sku, sales_month 
