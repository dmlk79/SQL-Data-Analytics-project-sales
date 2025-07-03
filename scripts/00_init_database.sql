/*
=============================================================
Create Schemas
=============================================================
Script Purpose:
    This script creates a schema named gold, creates tables inside it, then inserts data.

    You can run this script after connecting to PSQL
	
WARNING:
    Before running this script, I advise you to create the database.
    Also create a /tmp directory from your terminal where you copy all the source system datasets.
    THIS SCRIPT MUST BE EXECUTED FROM PSQL TO SUPPORT \copy COMMANDS.
=============================================================
*/

-- Create schema
CREATE SCHEMA IF NOT EXISTS gold;

-- Drop and create tables
DROP TABLE IF EXISTS gold.dim_customers CASCADE;
CREATE TABLE gold.dim_customers (
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

DROP TABLE IF EXISTS gold.dim_products CASCADE;
CREATE TABLE gold.dim_products (
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

DROP TABLE IF EXISTS gold.fact_sales CASCADE;
CREATE TABLE gold.fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity SMALLINT,
    price INT
);

-- Truncate tables
TRUNCATE TABLE gold.dim_customer;
TRUNCATE TABLE gold.dim_products;
TRUNCATE TABLE gold.fact_sales;

-- Load data from /tmp
\copy gold.dim_customers FROM '/tmp/gold_datasets/dim_customer.csv' WITH (FORMAT csv, HEADER true);

\copy gold.dim_products FROM '/tmp/gold_datasets/dim_products.csv' WITH (FORMAT csv, HEADER true);

\copy gold.fact_sales FROM '/tmp/gold_datasets/fact_sales.csv' WITH (FORMAT csv, HEADER true);
