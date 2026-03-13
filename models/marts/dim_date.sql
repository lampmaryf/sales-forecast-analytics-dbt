WITH dates AS (
    SELECT DISTINCT 
        order_date
    FROM {{ref('stg_sales')}}
    WHERE order_date IS NOT NULL 
)

SELECT 
    order_date AS date_day,
    extract(year from order_date) as year,
    extract(month from order_date) as month,
    to_char(order_date, 'Mon') as month_abbrev,
    to_char(order_date, 'Month') as month_name
FROM dates 
