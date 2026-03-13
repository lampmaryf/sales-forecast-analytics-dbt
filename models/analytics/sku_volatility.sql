SELECT 
    bulk_sku,
    avg(monthly_sales) as avg_monthly_sales,
    stddev(monthly_sales) as stddev_monthly_sales,
    stddev(monthly_sales) / nullif(avg(monthly_sales), 0) as cov 
FROM {{ref('int_sku_monthly_sales')}}
GROUP BY bulk_sku 
