# 📊 EDA Summary – SQL Analytics Project

This document summarizes the results, insightss, and s from running the SQL scripts for exploratory data analysis and reporting.

***P.S***: we divide our data into `dimension`and `measure` to ease our analysis and insightss retrieval.
A measure is an column which is either not numerical or if it's numerical it doesn't make sense to aggregate it (e.g: ID, product_name) while a `measure` is  numerical and it makes sense to aggregate it (sales, quantity, salary, age).
`Date` is a special type of dimension that we explore separately.



## `00_init_database.sql`
**Objective:** Initialize database schema and load initial datasets.  
**Results:**  
✅ Tables and schemas created successfully.  
✅ Data loaded into `dim_customers`, `dim_products`, `fact_sales`.  
**Insights:** Data model follows a star schema. 

---

## `01_database_exploration.sql`
**Objective:** Explore all tables and columns in the database.  
**Insights:**  
We have 3 tables: `dim_customers`, ``dim_products`` and `fact_sales`.

For `dim_products`:
- we have **11 columns**:
     -  9 `dimension`:product_key   
,product_id,start_date,category ,subcategory, maintenance, product_line ,product_number 
, product_name 

   - 2 `measure`: cost, category_id

For `dim_customers`:
- we have 10 **columns** and all of them are `dimension`
  - customer_key,customer_id, birthdate,create_date,last_name,country,marital_status,gender,customer_number,first_name

  - No `measure`
 
For `fact_sales`:
- we have **9 columns**:
    - 6  `dimension`:product_key, customer_key,
     order_date,shipping_date, due_date,  order_number

   - 3 `measure`: price,quantity ,sales_amount  




## `02_dimensions_exploration.sql`
**Objective:** Explore the dimension columns of table (`dim_customers`, `dim_products`,`fact_sales`).  

Let's explore some interesting dimensions inside our diff. tables
**Insights:** 

For `dim_products`:
- We have 4 categories (`category`):**Accessories**, **Bikes**,**Clothing**,**Components**.
- We have 295 distinct product (**product_name**) grouped into many subcategory (36).
- the maintenance column has 2 values: Yes/No
- The product_line is grouped into 4 categories:Other Sales,n/a,Mountain,Road,Touring


For `dim_customers`:
- Customers come from 6 **country** which are :United Kingdom,Australia,Germany,Canada,France,United States then we have an 'n/a' for some customers that means country not specified
- Customers marital_status are either **single** or **married**
- Customers gender is either **Male** or **Female** then we have some of them which it's not specified so it's **'n/a'**

For `fact_sales`:
All the dimensions are date we'll explore it later.



## `03_date_range_exploration.sql`
**Objective:** Explore date ranges and temporal coverage of `fact_sales`.  
**Insights:**  
- The first order was done at 2010-12-29	the last order at 2014-01-28 it means 37 months separate the orders.
- The oldest customer is 109 years old and the youngest one is 39 years old.


## `04_measures_exploration.sql`
**Objective:** Analyze available measures metrics.  

**Insights:**

- 💰 Revenue Performance:
The business generated a total sales amount of 29.36M, demonstrating strong revenue over the observed period.

- 📦 Sales Volume:
A total of 60,423 units were sold, indicating an average order size of approximately 2.18 units per order (60,423 ÷ 27,659).

- 💵 Pricing:
The average unit price across all transactions was 486.04, suggesting a mid-to-high price point in the product portfolio.

- 🛒 Customer Base:
The dataset records sales to 18,484 unique customers, reflecting a substantial reach and market penetration.

- 🧾 Product Variety:
Sales spanned across 295 distinct products, indicating a diversified offering to meet different customer needs.




## `05_magnitude_analysis.sql`
**Objective:** Analyze magnitude of key measures (sales, quantity).  
**Insights:**  
### For total customers by countries
The United States is the leading country, accounting for nearly half of the total (7,482 records; 48.3%), significantly ahead of all others.

Australia ranks second, contributing almost a quarter of the total (3,591 records; 23.2%).

European countries — United Kingdom (1,913 records; 12.4%), France (1,810 records; 11.7%), and Germany (1,780 records; 11.5%) — show similar representation, each contributing between 11% and 12%.

Canada follows closely with just over 10% of records (1,571 records; 10.1%).

Records with unspecified or missing country data (n/a) account for a small share (337 records; 2.2%).

### For customers gender repartition
- 50.54%(9341) customers are Male while Female are 49.38%(9128) but we have 0.08% (15) n/a.

### For the total products by category
- Components represent the largest share of the catalog, accounting for 43% of products, which suggests a strong focus on replacement parts and upgrades.

- Bikes come second with approximately 33%, consistent with the core business of selling complete bicycles.

- Clothing and Accessories together make up about 22%, providing complementary products to the main items.

- A small portion (2.37%) of products fall into an uncategorized bucket.

### For the average cost for each category
- Bikes command the highest average cost (949.44), aligning with expectations as the core and most premium offering.

- Components are priced moderately (264.72), reflecting mid-tier replacement parts or upgrades.

- Clothing and  Accessories exhibit lower average costs (24.80 and 13.17, respectively), which is consistent with their roles as supplementary items.

- A category value of NULL appears in the dataset, associated with products averaging 28.57 — indicating missing or unclassified category information.

### For the total revenue by each category
- Bikes overwhelmingly dominate revenue, accounting for over 96% of total sales. This confirms Bikes as the company’s core product line and main value generator.

- Accessories contribute 2.39%, while 👕 Clothing represents just 1.16%, highlighting relatively marginal roles in the overall business.

The extremely high concentration of revenue in Bikes signals potential business risk if demand for Bikes were to decline.

### For the distribution of sold items across countries
- 🇺🇸 United States leads with ~34% of total sold items, significantly ahead of other countries.

- 🇦🇺 Australia and 🇨🇦 Canada follow with ~22% and ~13% respectively.

- 🇬🇧 United Kingdom, 🇩🇪 Germany, and 🇫🇷 France contribute similar shares, between ~9–11%.

Unclassified (n/a) accounts for ~1.4%, indicating some sales lack country attribution.



## `06_ranking_analysis.sql`
**Objective:** Perform ranking analyses (top customers/products).  
**Insights:**   
### Which 5 products Generating the Highest Revenue?
The Mountain-200 series dominates the top-selling products, with different color and size variants occupying the top 5 spots.

The Mountain-200 Black - 46 is the top-performing product, generating a total sales amount of 1,373,454, slightly ahead of the Mountain-200 Black - 42 at 1,363,128.

The Mountain-200 Silver - 38 follows closely, with sales of 1,339,394, demonstrating strong demand for the Silver variant as well.

Both Black and Silver colorways are well-represented in the top ranks, showing customer preference for these two colors.

Sizes 46, 42, and 38 dominate, suggesting these are the most popular sizes within the Mountain-200 series.

The difference between the top and fifth product is just about 78,600, indicating a relatively even distribution of demand among the leading variants.

### What are the 5 worst-performing products in terms of sales? 
The Racing Socks - L is the lowest-selling product, with total sales amounting to just 2,430, followed closely by the Racing Socks - M at 2,682.

Other low performers include Patch Kit / 8 Patches (6,382), Bike Wash - Dissolver (7,272), and Touring Tire Tube (7,440).

All five products have sales below 7,500, which is significantly lower than the top-performing products in the catalog.

The two worst-performing items belong to the same product line (Racing Socks), which may indicate low demand or poor positioning.


### top 10 customers who has generated highest revenue to the sales
Nichole Nara and Kaitlyn Henderson tie as the top customers, each contributing 13,294 in revenue.

The gap between the top 5 customers is marginal, with less than 1% difference in revenue from rank 1 to rank 5.

The 10th customer, Maurice Shan, generated 12,914, which is only about 2.9% lower than the top customers — suggesting a very tight distribution at the top

### The 3 customers with the fewest orders placed

Angela Ward, Franklin Liu, and Tamara Tang are tied as the customers with the fewest orders, having placed just one order each.

