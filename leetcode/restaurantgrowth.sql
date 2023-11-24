-- 1321. Restaurant Growth
-- MySQL
-- You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
-- Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
SELECT
	dna,
	TRANSLATE(dna,
	'ATGC',
	'TACG') AS res
FROM
	dnastrand;

WITH cte AS (
SELECT
	DISTINCT visited_on
FROM
	customer
WHERE
	visited_on >= DATE_ADD((SELECT min(visited_on) FROM customer), INTERVAL 6 DAY)
)
SELECT
	c.visited_on,
	ROUND((SELECT sum(amount) FROM customer cu WHERE DATE_ADD(cu.visited_on, INTERVAL 6 DAY) >= 
c.visited_on AND cu.visited_on <= c.visited_on), 2) amount,
	ROUND((SELECT sum(amount) FROM customer cs WHERE 
DATE_ADD(cs.visited_on, INTERVAL 6 DAY) >= c.visited_on AND cs.visited_on <= c.visited_on)/ 7, 2) average_amount
FROM
	cte c;