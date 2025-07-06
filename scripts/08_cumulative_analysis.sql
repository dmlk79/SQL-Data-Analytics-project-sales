/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
===============================================================================
*/

-- Calculate the total sales per month 
-- and the running total of sales over time 

SELECT
order_date,
total_sales,
SUM(total_sales) OVER(PARTITION BY order_date ORDER BY order_date ASC) rolling_total,
ROUND(AVG(avg_price) OVER (ORDER BY order_date), 2) AS moving_average_price
FROM
(
SELECT
	DATE_TRUNC('month', order_date) AS order_date,
	AVG(price) as avg_price,
	SUM(sales_amount) AS total_sales
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY DATE_TRUNC('month', order_date)
)










