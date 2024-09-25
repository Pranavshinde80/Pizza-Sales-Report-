select * from pizza_sales

 1-- Total revenue:
select sum(total_price) as Total_Revenue from pizza_sales;

 2 -- Average Order value:
 select (sum(total_price) / count(DISTINCT order_id)) as Avg_order_Value from pizza_sales

3 --Total pizza sold
select SUM(quantity) as Total_pizza_sold from pizza_sales


4 ----Total Orders
select COUNT(distinct order_id) as Total_orders from pizza_sales

5 -- Average Pizzas per Order
select CAST(cast(sum(quantity) as decimal (10,2)) /
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))as Avg_pizzas_per_orders from pizza_sales


 B -- Daily Trend for total Orders
 SELECT DATENAME(DW, order_date ) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

 C --- Monthly Trend for Orders
 select DATENAME(month, order_date) as Month_Name, COUNT(distinct order_id) as Total_Orders from pizza_sales
 group by DATENAME(month,order_date)


 D -- %of SAles by pizza Category

 select pizza_category,CAST(sum(total_price) as decimal(10,2)) as Total_revenue,
 CAST(sum(total_price) * 100 / (select sum (total_price) from pizza_sales)
 as decimal(10,2)) as PCT
 from pizza_sales
 group by  pizza_category


 E ---% of sales by pizza Size
 SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

 F---- Total pizzas sold by pizza Category
 select pizza_category, sum(quantity) as Total_Quantity_Sold
 from pizza_sales
 where month(order_date)=  2
 group by pizza_category
 order  by Total_Quantity_Sold desc


 G --- TOP 5 PIZZA by Revenue

 select Top 5 pizza_name, sum(total_price) as Total_Revenue
 from pizza_sales
 group by pizza_name
 order by Total_Revenue desc


 H--- Bottom 5 pizza by revenue

 SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


i--- Top 5 pizzas by Quantity
select top 5 pizza_name,sum(quantity)as Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold desc


J --- Bottom 5 pizzas by Quantity

select top 5 pizza_name,sum(quantity) AS Total_pizza_sold
from pizza_sales
group by pizza_name
order by Total_pizza_sold asc

K--- TOP 5 pizza by Total Order
select top 5 pizza_name, COUNT(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name 
order by Total_Orders desc

L----Bottom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

M--- note pizza_category or pizza_size 
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC





 