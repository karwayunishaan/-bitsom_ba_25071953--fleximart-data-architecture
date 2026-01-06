#Query 1: Monthly Sales Drill-Down Analysis (5 marks)
#Business Scenario: "The CEO wants to see sales performance broken down by time periods. Start with yearly total, then quarterly, then monthly sales for 2024."
#Requirements:
#Show: year, quarter, month, total_sales, total_quantity
#Group by year, quarter, month
#Order chronologically
#This demonstrates drill-down (Year → Quarter → Month)

select d.year, d.quarter, d.month_name, sum(s.total_amount), sum(s.quantity_sold) 
from dim_date as d
left join fact_sales as s
on d.date_key = s.date_key
group by d.year,d.quarter, d.month_name;

#Query 2: Product Performance Analysis (5 marks)
#Business Scenario: The product manager needs to identify top-performing products. Show the top 10 products by revenue, along with their category, total units sold, and revenue contribution percentage.Requirements:
#Join fact_sales with dim_product
#Calculate: total revenue, total quantity per product
#Calculate: percentage of total revenue (each products revenue / overall revenue × 100)
#Order by revenue descending
#Limit to top 10

select p.product_name, p.category, sum(f.unit_sold) as unit_sold, sum(f.revenue)as revenue, round(sum(f.revenue) *100/
 (select sum(total_amount) from fact_sales),2) as revenue_percentage
from dim_product as p
join (select product_key, quantity_sold as unit_sold, total_amount as revenue from fact_sales) as f
on p.product_key = f.product_key
group by p.product_name, p.category
order by revenue desc
limit 10;

--  Query 3: Customer Segmentation Analysis (5 marks)
--  Business Scenario: "Marketing wants to target high-value customers. Segment customers into 'High Value' (>₹50,000 spent), 'Medium Value' (₹20,000-₹50,000), and 'Low Value' (<₹20,000). Show count of customers and total revenue in each segment."
--  Requirements:
--  Calculate total spending per customer
--  Use CASE statement to create segments
--  Group by segment
--  Show: segment, customer_count, total_revenue, avg_revenue_per_customer
with customer_spending as (select customer_key, sum(total_amount) as total_spent from fact_sales group by customer_key)
select case
when total_spent > 50000 then "high value"
when total_spent between 20000 and 50000 then "medium value"
when total_spent <20000 then "low value" end as customer_segment, count(customer_key) as customer_count,
sum(total_spent) as revenue , round(sum(total_spent)/ count(customer_key),2) as average_revenue
from customer_spending 
group by customer_segment;


