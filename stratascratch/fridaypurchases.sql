-- Strata Scratch ID 10358
-- Hard Problem
SELECT
	DISTINCT date,
	(EXTRACT(MONTH
FROM
	date) - 1)* 4 + CASE
		WHEN EXTRACT(DAY
	FROM
		date) < 8 THEN 1
		WHEN EXTRACT(DAY
	FROM
		date) < 15 THEN 2
		WHEN EXTRACT(DAY
	FROM
		date) < 22 THEN 3
		WHEN EXTRACT(DAY
	FROM
		date) < 32 THEN 4
		ELSE 0
	END AS week_num,
	avg(amount_spent) OVER(PARTITION BY date) AS avg_d
FROM
	user_purchases a
WHERE
	day_name = 'Friday'
	AND date < '2023-04-01';
