-- 1321. Restaurant Growth
-- MySQL
-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
with cte as (
select
	distinct visited_on
from
	customer
where
	visited_on >= DATE_ADD((
	select
		min(visited_on)
	from
		customer),
	interval 6 day)
)
select
	z.*,
	round(z.amount / 7,
	2) average_amount
from
	(
	select
		c.visited_on,
		(
		select
			sum(amount)
		from
			customer cu
		where
			DATE_add(cu.visited_on,
			interval 6 day) >= c.visited_on
				and cu.visited_on <= c.visited_on) amount
	from
		cte c) z;
