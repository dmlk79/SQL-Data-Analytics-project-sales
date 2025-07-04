/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/



/*
===============================================================================
For dim_customers
===============================================================================
*/
-- country 
SELECT DISTINCT country FROM gold.dim_customers;

-- marital_status
SELECT DISTINCT marital_status FROM gold.dim_customers;

-- gender
SELECT DISTINCT gender FROM gold.dim_customers;


/*
===============================================================================
For dim_products
===============================================================================
*/

-- Explore all category (major divisions)
SELECT DISTINCT category FROM gold.dim_products ORDER BY category;

-- subcategory and product_name
SELECT DISTINCT subcategory,product_name FROM gold.dim_products ORDER BY 1,2

-- maintenance
SELECT DISTINCT maintenance FROM gold.dim_products;

-- product_line
SELECT DISTINCT product_line FROM gold.dim_products;


