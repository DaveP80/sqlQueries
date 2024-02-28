-- Strata Scratch ID 10358
-- Hard Problem
with recursive cte as (
  SELECT 1 AS wn
  UNION ALL
  SELECT wn + 1
  FROM cte
  WHERE wn < 12

)
SELECT
	COALESCE(z.week_num,
	c.wn) AS week_num,
	COALESCE(avg_d,
	0) AS avg_d
FROM
	(
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
		AND date < '2023-04-01') z
RIGHT JOIN cte c ON
	z.week_num = c.wn;
