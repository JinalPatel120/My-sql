SELECT * FROM Student.sales;

select sales_id , sales_date from sales;

select * from sales where total_price > 200;

select sum(total_price) as revenue from sales;



--  Calculate the total revenue generated from sales of products in the ‘Electronics’ category
select sum(s.total_price) as total_revenue from sales  s join products  p on s.product_id=p.product_id where p.category='electronics';

select sum(s.total_price) as total_revenue , p.category from sales s join products p on s.product_id=p.product_id group by p.category;




