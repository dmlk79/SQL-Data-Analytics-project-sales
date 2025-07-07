# 📈📊 Advanced Data Analytics Summary – SQL Analytics Project
This document summarizes Advanced data analytics insights from our gold tables schema. It's the extension of the EDA document. 



## `07_change_over_time_analysis.sql`
**Objective:** Analyze trends and changes over time.  
**Insights:**  
This report summarizes the yearly performance of sales, customer acquisition, and quantity sold between 2010 and 2014.
- ✅ Sales peaked in 2013 at 16,344,878, a growth of nearly 180% over 2012.
- ✅ The largest customer base was acquired in 2013, reaching 17,427 customers.
- ✅ 2013 also saw the highest quantity sold (52,807 units), aligning with sales and customer trends.
- ✅ A sharp decline is observed in 2014, where sales fell back to 2010 levels and customer count dropped significantly.
- ✅ The trend indicates a strong growth phase from 2010–2013, followed by a steep drop-off in 2014, suggesting potential market saturation, operational issues, or external factors.

To be more precise when looking at monthly sales throughout the years:
- 📌 2011 marked the start of scaling, with monthly sales crossing 700K by November.
- 📌 2012 remained stable with moderate growth, peaking at 624K in Dec 2012.
- 📌 2013 was a breakout year — sales grew nearly 3× vs 2012, consistently over 1M per month from March onward.
- 📌 Both customer acquisition and quantity sold followed similar growth patterns, indicating strong market adoption.

## `08_cumulative_analysis.sql`
**Objective:** Perform cumulative analyses over time.  
**Insights:**  
- ✅ Sales grew >40× over 3 years — strong volume expansion
- ✅ Average price declined steadily — potential margin pressure
- ✅ Growth driven by higher volumes, but profitability risk noted



## `09_performance_analysis.sql`
**Objective:** Analyze performance metrics by dimension.  
**Insights:** 

✅ Both products showed strong growth in 2013, outperforming historical averages significantly.

✅ The AWC Logo Cap could not sustain its momentum in 2014, with sales dropping back below average.

✅ All-Purpose Bike Stand maintained strong performance in 2013 (no data shown beyond that in this sample).

✅ Initial sales in 2012 for both products were far below historical averages, suggesting a ramp-up phase or underperformance that year.


## `10_part_to_whole_analysis.sql`
**Objective:** Analyze proportions of parts to whole (e.g., sales share).  
**Insights:** 

Most of the business revenue comes from the bike which has 96.46% of the sales proportions.The threat is if selling bikes fails, the business will fail .



## `11_data_segmentation.sql`
**Objective:** Segment customers or products by relevant criteria.  
**Insights:**  
 
 We group our customers into three segments based on their spending behavior:
- VIP: Customers with at least 12 months of history and spending more than €5,000.
- 	 Regular: Customers with at least 12 months of history but spending €5,000 or less.
- New: Customers with a lifespan less than 12 months.

Based on these results we have:

- Regular	: 2037 customers
- New	: 14828 customers
- VIP: 1619 customers
  


On the other hand by segmenting our product by cost range we get this:
- 110 products are "Below 100"
- 101 products are in "100-500" range
- And 45 products in  "500-1000"	range
- finally 39 products are "Above 1000"



## `12_report_customers.sql`
**Objective:** Generate a detailed report for customers.  
**Insights:**  

This file is a sql script that creates a view which display summary of customers reports ( report carried out previously)


## `13_report_products.sql`
**Objective:** Generate a detailed report for products.  
**Insights:**  

This file is a sql script that creates a view which display summary of products reports ( report carried out previously). 

