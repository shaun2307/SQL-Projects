use PizzaDB;

select * from pizza_sales

--Find the sum of total price of the pizza orders

select sum(total_price) as Total_Revenue
from pizza_sales;

--find the average order value
select sum(total_price) / count (distinct order_id) as AOV
from pizza_sales

--find the total no of pizzas sold
select sum(quantity) as Total_Pizzas_Sold 
from pizza_sales;

--find the total no of orders placed
select count (distinct order_id) as total_order 
from pizza_sales;

--find average pizzas per order
select sum(quantity)/ count(distinct order_id) as avg_pizzas
from pizza_sales;