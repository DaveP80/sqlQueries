-- stratascratch No. 10318
-- You are given a table of product launches by company by year. Write a query to count the net 
-- difference between the number of products companies launched in 2020 with the number of products 
-- companies launched in the previous year.
with cte as (
select
	distinct company_name,
	year,
	count(*) over(partition by company_name,
	year) as cc
from
	car_launches
)
select
	c.company_name,
	cd.cc - c.cc as net_products
from
	cte c
join cte cd on
	c.company_name = cd.company_name
	and cd.year >
c.year;

