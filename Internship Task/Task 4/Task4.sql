-- a.Use SELECT, WHERE, ORDER BY, GROUP BY

SELECT 
    product_category,
    SUM(total_revenue) AS total_revenue,
    SUM(units_sold) AS total_units
FROM online_sales_data
WHERE YEAR(date) = 2024
GROUP BY product_category
ORDER BY total_revenue DESC;


-- c.Write subqueries

SELECT 
    product_name,
    total_revenue
FROM online_sales_data
WHERE total_revenue > (
    SELECT AVG(total_revenue)
    FROM online_sales_data
);

-- d.Use aggregate functions (SUM, AVG)

SELECT
    product_category,
    COUNT(*) AS total_transactions,
    SUM(units_sold) AS total_units,
    AVG(unit_price) AS avg_price,
    MAX(total_revenue) AS highest_revenue
FROM online_sales_data
GROUP BY product_category;


-- e.Create views for analysis

CREATE VIEW sales_summary AS
SELECT
    product_category,
    region,
    SUM(total_revenue) AS total_revenue,
    SUM(units_sold) AS total_units,
    AVG(unit_price) AS avg_price
FROM online_sales_data
GROUP BY product_category, region;

SELECT * FROM sales_summary WHERE region = 'Europe';


-- F. Create indexes for faster filtering and grouping

CREATE INDEX idx_date ON online_sales_data(date);
CREATE INDEX idx_category ON online_sales_data(product_category);
CREATE INDEX idx_region ON online_sales_data(region);
