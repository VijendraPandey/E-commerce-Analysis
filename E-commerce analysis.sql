USE ecommerce_sales_data;
SHOW TABLES;

SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales_Dataset.csv'
INTO TABLE Sales_Dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM sales_dataset;

-- Identify the top 3 states with highest shipping costs
SELECT state, SUM(shipping_cost) AS highest_sum_shipping_cost 
FROM sales_dataset 
GROUP BY state 
ORDER BY highest_sum_shipping_cost DESC 
LIMIT 3;

-- Top 5 Products by Total Sales
-- Helps identify the highest revenue-generating products.
SELECT product_name, SUM(sales) AS total_sales
FROM Sales_Dataset
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- Total Profit by Country and Region
-- Reveals which regions and countries contribute the most to overall profit.
SELECT country, region, SUM(profit) AS total_profit
FROM Sales_Dataset
GROUP BY country, region
ORDER BY total_profit DESC;

-- Average Discount by Category
-- Shows which categories have the highest average discounts.
SELECT category, AVG(discount) AS avg_discount
FROM Sales_Dataset
GROUP BY category
ORDER BY avg_discount DESC;

-- Total Sales and Profit by Year
-- Offers a year-over-year comparison of sales and profit performance.
SELECT year, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Sales_Dataset
GROUP BY year
ORDER BY year ASC;

-- Sales and Profit Analysis by Shipping Mode
-- Helps analyze which shipping methods are associated with higher sales and profitability.
SELECT ship_mode, SUM(sales) AS total_sales, SUM(profit) AS total_profit
FROM Sales_Dataset
GROUP BY ship_mode
ORDER BY total_sales DESC;