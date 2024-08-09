use PizzaDB;

select * from pizza_sales

--Daily trend for total orders
Select DATENAME(DW , order_date) as OrderDays, Count (distinct order_id) as Total_orders
from pizza_sales
Group By DATENAME(DW, order_date);

--Monthly trend for total orders
Select Datename(Month, order_date) as Months, Count (distinct order_id) as Total_orders
from pizza_sales
Group By DATENAME(Month, order_date)
ORDER BY Total_orders DESC;

--Percentage of sales by pizza category
Select pizza_category, Sum(total_price) as total_sales, Sum(total_price) * 100 / (Select Sum(total_price) from pizza_sales) as PCT
from pizza_sales
Where Month(order_date)=1
GROUP BY pizza_category;

--Percentage of Sales by pizza size
Select pizza_size, Cast (Sum(total_price)As Decimal(10,2)) as total_sales, Cast(Sum(total_price) * 100 / 
(Select sum(total_price) from pizza_sales)As decimal(10,2)) as PCT
from pizza_sales
GROUP BY pizza_size
ORDER BY PCT;

--Top 5 bestsellers by revenue, quantity and orders
Select top 5 pizza_name, Sum(total_price) as Total_revenue from pizza_sales
GROUP BY pizza_name
order by Total_revenue desc;

--Bottom 5 bestsellers by revenue, quantity and orders
Select top 5 pizza_name, Sum(total_price) as Total_revenue from pizza_sales
GROUP BY pizza_name
order by Total_revenue;
