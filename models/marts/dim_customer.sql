SELECT DISTINCT 
    customer,
    city,
    state,
    region,
FROM {{ref('stg_sales')}}
WHERE customer IS NOT NULL
