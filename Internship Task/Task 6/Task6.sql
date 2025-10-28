-- a. Use EXTRACT(MONTH FROM order_a.date) for month

SELECT 
    EXTRACT(MONTH FROM order_a.date) AS sales_month
FROM online_sales_data AS order_a;


-- b. GROUP BY year/month
SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month
FROM online_sales_data
GROUP BY sales_year, sales_month;

-- c. Use SUM() for revenue

SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(total_revenue) AS total_revenue
FROM online_sales_data
GROUP BY sales_year, sales_month;

-- d. COUNT(DISTINCT order_id) for volume

SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM online_sales_data
GROUP BY sales_year, sales_month;

-- e. Use ORDER BY for sorting

SELECT 
    EXTRACT(YEAR FROM date) AS sales_year,
    EXTRACT(MONTH FROM date) AS sales_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM
    online_sales_data
GROUP BY sales_year , sales_month
ORDER BY sales_year , sales_month;

-- f. Limit results for specific time periods







