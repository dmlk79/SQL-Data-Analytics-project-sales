/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the total sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales;

-- Find how many items are sold
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales; 
-- Find the average selling price
SELECT AVG(sales_amount) AS avg_price FROM gold.fact_sales;

-- Find the total number of orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

-- Find the total number of customers
SELECT COUNT(DISTINCT customer_id) FROM gold.dim_customers

-- Find the total number of products
SELECT COUNT(product_name) total_products FROM gold.dim_products

-- Find the total number of customers who has placed and order
SELECT COUNT(DISTINCT customer_key) AS total_customers_order FROM gold.fact_sales;




-- we generate report that shows all key metrics of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity)  FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Nr. Products', COUNT(product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Nr. Customers', COUNT(customer_key) FROM gold.dim_customers ;

	







