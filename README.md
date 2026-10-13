🍕 Pizza Sales Analysis Using SQL

📌 Project Overview

This project analyzes pizza sales data using MySQL to uncover business insights related to revenue, popular pizza types, customer ordering patterns, pizza sizes, and category-wise sales.

The goal is to use SQL to transform raw sales data into meaningful business insights that can support data-driven decisions.

🎯 Project Objectives

Calculate total revenue and total orders.

Identify the highest-revenue-generating pizza types.

Find the most frequently ordered pizza types.

Analyze pizza sales by category and size.

Understand ordering patterns throughout the day.

Calculate the average number of pizzas ordered per day.

Practice SQL joins, aggregations, subqueries, and window functions.

🛠️ Tools & Technologies

Database: MySQL

SQL Environment: MySQL Workbench

Version Control: Git and GitHub

🔍 Business Questions & Findings

1. How many total orders were placed?

Finding: A total of 21,350 orders were placed.

Business Insight: The total number of orders provides a baseline for understanding the business's sales activity.

2. What was the total revenue generated from pizza sales?

Finding: The total revenue was 817,860.05 in the dataset's currency units.

Business Insight: Total revenue provides an overview of sales performance before accounting for business costs and expenses.

3. Which three pizza types generated the highest revenue overall?

Findings:

The Thai Chicken Pizza — 43,434.25

The Barbecue Chicken Pizza — 42,768.00

The California Chicken Pizza — 41,409.50

Business Insight: These three pizza types were the highest revenue generators in the overall ranking.

4. Which five pizza types were ordered in the highest quantities?

Findings:

The Classic Deluxe Pizza — 2,453

The Barbecue Chicken Pizza — 2,432

The Hawaiian Pizza — 2,422

The Pepperoni Pizza — 2,418

The Thai Chicken Pizza — 2,371

Business Insight: These five pizza types had the highest order quantities in the query results. This information can help the business plan inventory and manage customer demand.

5. Which pizza size appeared most frequently in the order details?

Finding: The Large (L) size ranked first, with 18,526 order-detail records in the displayed results.

Business Insight: Large pizzas appeared most frequently according to this query's metric.

Note: This result counts order-detail records, not the total number of pizza units sold by size.

6. During which hour of the day were the most orders placed?

Finding: 12:00 PM had the highest visible order count, with 2,520 orders.

Other notable results included:

1:00 PM — 2,455 orders

6:00 PM — 2,399 orders

5:00 PM — 2,336 orders

7:00 PM — 2,009 orders

Business Insight: The results indicate strong order activity around lunchtime and early evening. These periods can be investigated further for staffing and operational planning.

7. What was the average number of pizzas ordered per day?

Finding: The query returned an average of 138.47 pizzas per day.

Business Insight: This average provides a daily demand benchmark that can support inventory and preparation planning.

8. How many pizza types were available in each category?

Findings:

Supreme: 9 pizza types

Veggie: 9 pizza types

Classic: 8 pizza types

Chicken: 6 pizza types

Business Insight: Supreme and Veggie had the highest number of pizza types, with 9 each, while Chicken had the fewest, with 6 pizza types.

9. Which pizza category had the highest total quantity sold?

Findings:

- Veggie: 446,166
- Supreme: 446,166
- Classic: 396,592
- Chicken: 297,444

Business Insight: Veggie and Supreme ranked highest in the query results, followed by Classic and Chicken. These results can help compare sales across pizza categories.

10. Which pizza had the highest listed price?

Finding: The Greek Pizza had the highest listed price at 35.95.

Business Insight: Identifying the highest-priced pizza helps distinguish premium-priced products from the rest of the menu. A higher price does not necessarily mean higher total revenue.

11. Which were the top three pizza types by revenue in each pizza category?

Findings — Chicken Category:

The Thai Chicken Pizza — 43,434.25

The Barbecue Chicken Pizza — 42,768.00

The California Chicken Pizza — 41,409.50

Business Insight: Within the Chicken category, The Thai Chicken Pizza generated the highest revenue, followed by The Barbecue Chicken Pizza and The California Chicken Pizza. This analysis helps identify the top-performing pizza types within each category and supports category-specific business decisions.

12. What was the cumulative revenue by the end of the sales period?

Finding: By December 31, 2015, cumulative revenue reached approximately 817,860.

Business Insight: Cumulative revenue tracks how sales revenue builds over time and provides an overview of the business's overall sales performance throughout the period.

🧠 SQL Concepts Practiced

SELECT, WHERE, GROUP BY, and ORDER BY

Aggregate functions: SUM(), COUNT(), and AVG()

Joins across related tables

Subqueries and derived tables

Date and time functions

Revenue calculations

Window functions such as RANK()

Cumulative revenue analysis

Business-oriented data analysis

📈 Key Learnings

Through this project, I practiced using SQL to analyze relational sales data, calculate revenue, identify popular products, examine ordering patterns, and answer business questions.

This project strengthened my understanding of SQL joins, aggregations, ranking, and analytical queries for business problem-solving.

🚀 Future Improvements

Validate category-level quantity calculations.

Add the verified top three revenue-generating pizzas for every category.

Analyze monthly and daily sales trends.

Create visualizations using Python or Power BI.

Build a dashboard to present important sales metrics.

👨‍💻 Author

Atharva Pandey
**Aspiring Data Science and AI/ML professional** building practical projects to strengthen technical skills, data analysis, and problem-solving abilities.



