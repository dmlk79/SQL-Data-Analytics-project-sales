/*
===============================================================================
Magnitude Analysis
===============================================================================
Purpose:
    - To quantify data and group results by specific dimensions.
    - For understanding data distribution across categories.

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT(), AVG()
    - GROUP BY, ORDER BY
===============================================================================
*/


-- Find total customers by countries
SELECT 
    country,
    COUNT(customer_id) AS total_customers,
    ROUND(100.0 * COUNT(customer_id) / SUM(COUNT(customer_id)) OVER (), 2) AS percentage
FROM gold.dim_customers
GROUP BY country
ORDER BY total_customers DESC;

-- Find total customers by gender
SELECT
	gender,
	COUNT(customer_id) as total_customers,
	ROUND(100 * COUNT(customer_id) / SUM(COUNT(customer_id)) OVER (), 2) AS percentage
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC


-- Find total products by category
SELECT
	category,
	COUNT(product_key) as total_products,
	ROUND(100 * COUNT(product_key) / SUM(COUNT(product_key)) OVER (), 2) AS percentage
FROM gold.dim_products
GROUP BY category
ORDER BY total_products DESC

-- What is the average costs in each category?
SELECT
	category,
	ROUND(AVG(cost), 2) AS avg_cost
FROM gold.dim_products dp
GROUP BY category
ORDER BY avg_cost DESC

-- What is the total revenue generated for each category?
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue,
    ROUND(100.0 * SUM(f.sales_amount) / (SELECT SUM(sales_amount) FROM gold.fact_sales), 2) AS revenue_share_percentage
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC;


-- What is the distribution of sold items across countries?
SELECT
    country,
    total_sold_items,
    ROUND(100.0 * total_sold_items / SUM(total_sold_items) OVER (), 2) || '%' AS percentage_sold_items
FROM (
    SELECT
        c.country,
        SUM(f.quantity) AS total_sold_items
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_customers c
        ON c.customer_key = f.customer_key
    GROUP BY c.country
) sub
ORDER BY total_sold_items DESC;




