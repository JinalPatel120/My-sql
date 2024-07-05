SELECT * FROM Student.products;

select product_name , unit_price from products;

select * from products where category='electronics';

select product_name, unit_price from products where unit_price between 40 and 90;

commit;
-- Retrieve the product_name and category from the Products table, ordering the results by category in ascending order.

select product_name, category from products order by category;

-- calculate the total quantity_sold of products in the ‘Electronics’ category.

select sum(s.quantity) as quantity_sold ,p.category from sales s join products p on s.product_id=p.product_id where p.category='electronics';

select sum(s.quantity) as quantity_sold, p.category from sales s join products p on s.product_id=p.product_id where p.category= 'stationary';


--  Retrieve the product_name and total_price from the Sales table, calculating the total_price as quantity_sold multiplied by unit_price.

select p.product_name , s.quantity * p.unit_price as total_price from products p join sales s on p.product_id=s.product_id;

-- Calculate the total revenue generated from sales for each product category.

select p.category , sum(s.total_price) as total_revenue from sales s join products p on s.product_id=p.product_id group by p.category;

-- Find the product category with the highest average unit price.

select category from products group by category order by avg(unit_price) desc limit 1;

select  category , sum(unit_price) as total from products;

-- SELECT list contains nonaggregated column 'Student.products.category'; this is incompatible with sql_mode=only_full_group_by

create table stud (stud_id int primary key , name varchar(50));
create table course( course_id int primary key , name varchar(50));
create table data( course_id int, stud_id int);

-- 2. Find the product category with the highest average unit price

select category from products group by category order by avg(unit_price) desc limit 1,2;

-- 4. Count the number of sales made in each month.

select date_format(s.sales_date,'%Y-%m') as month, count(*) as sales_count from sales s group by month;

-- Retrieve the product name and total sales revenue for each product.

select p.product_name , avg(s.total_price) as sales_revenue from products p join sales s on p.product_id=s.product_id group by p.product_name;

-- List all sales along with the corresponding product names.

select s.sales_id,p.product_name from sales s join products p on s.product_id=p.product_id;

-- Retrieve the product name and total sales revenue for each product.

 select p.category, sum(s.total_price) as sales_revenue from products p join sales s group by p.category;
 
 SELECT p.category, 
       SUM(s.total_price) AS category_revenue,
       (SUM(s.total_price) / (SELECT SUM(total_price) FROM sales)) * 100 AS revenue_percentage
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;

select current_date();
select current_time();
select current_timestamp();
select now ();
select greatest(78,90,56,76,34,12);

insert into products ( product_id,product_name) select sales_id, product_id from sales;

-- 6. Retrieve the product name and total sales revenue for each product.
select  p.category ,sum(s.total_price) as sales_revenue from products p join sales s on p.product_id=s.product_id group by p.category;

-- List all sales along with the corresponding product names.

select s.sales_id, s.quantity, s.sales_date , s.total_price , p.product_name from sales s join products p on s.product_id=p.product_id;

select * from sales;

select * from sales where total_price > (select avg(total_price) from sales);

select * from sales where total_price > (select avg(total_price) from sales);

show databases;

use Student;




