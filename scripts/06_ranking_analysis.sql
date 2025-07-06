/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.

SQL Functions Used:
    - Window Ranking Functions.
    - Clauses: GROUP BY, ORDER BY
===============================================================================
*/

-- Which 5 products Generating the Highest Revenue?
-- Simple Ranking

SELECT 
	*
FROM
(SELECT 
	p.product_name,
	SUM(s.sales_amount),
	RANK() OVER(ORDER BY SUM(s.sales_amount) DESC ) AS rank_5_best_products
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY SUM(s.sales_amount) DESC
LIMIT 5 )
WHERE rank_5_best_products <= 5 ;


-- What are the 5 worst-performing products in terms of sales?
SELECT 
	p.product_name,
	SUM(s.sales_amount),
	RANK() OVER(ORDER BY SUM(s.sales_amount) ASC ) AS rank_5_worst_products
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY SUM(s.sales_amount) ASC
LIMIT 5 

-- Find the top 10 customers who have generated the highest revenue to the sales
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_sales_amount,
	RANK() OVER(ORDER BY SUM(f.sales_amount) DESC) AS top_10_customers
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_sales_amount DESC
LIMIT 10


-- The 3 customers with the fewest orders placed
SELECT 
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders
LIMIT 3;
