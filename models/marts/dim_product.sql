SELECT 
    bulk_sku,
    min(category) as category,
    min(sub_category) as sub_category,
    min(current_9box) as current_9box,
FROM {{ref('stg_sales')}}
WHERE bulk_sku is not null
GROUP BY bulk_sku
