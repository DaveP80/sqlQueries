-- Codewars PSQL
-- https://www.codewars.com/kata/6481e0cf55c8621eb1389a65
-- You have been provided with a PostgreSQL table named users. This table includes a jsonb column, info, which holds JSON data. 
-- Here is a simplified schema of the table:

-- id: primary key, integer.
-- info: JSON column which includes:
-- name: a string (user's name).
-- age: an age of the user
-- pets: an array of JSON objects, each with two keys: name (a string that represents the pet's name) and type (a string that 
-- represents the type of pet, which could be 'Dog', 'Cat', 'Bird', 'Fish', 'Reptile', or 'Rodent').
-- Your task is to determine the most preferred pet type within each age group of users. Assume the age groups are as follows: 
-- "18-30", "31-45", "46-60", "61 and above". All pet owners are adults (>=18 years) - you can be sure that in the tests all 
-- users' ages are within these groups.
with cte as (
  select (r ->> 'type')::TEXT as c from (
  select jsonb_array_elements(arr) as r from (
select info -> 'pets' AS arr from users where (info ->> 'age')::int between 18 and 30
    ) a
    ) b
  order by c
),
cte2 as (
  select (r ->> 'type')::TEXT as c from (
  select jsonb_array_elements(arr) as r from (
select info -> 'pets' AS arr from users where (info ->> 'age')::int between 31 and 45
    ) a
    ) b
  order by c
),
cte3 as (
  select (r ->> 'type')::TEXT as c from (
  select jsonb_array_elements(arr) as r from (
select info -> 'pets' AS arr from users where (info ->> 'age')::int between 46 and 60
    ) a
    ) b
  order by c
),
cte4 as (
  select (r ->> 'type')::TEXT as c from (
  select jsonb_array_elements(arr) as r from (
select info -> 'pets' AS arr from users where (info ->> 'age')::int > 60
    ) a
    ) b
  order by c
)
select age_group, preferred_pet_type, count from (
SELECT
  '18-30' AS age_group,
  1 as id,
  array_agg(c) AS preferred_pet_type,
  max(count_c) AS count
FROM (
  SELECT
    c,
    COUNT(*) AS count_c,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
  FROM cte
  GROUP BY c
) subquery
WHERE rnk = 1
union
SELECT
  '31-45' AS age_group,
  2 as id,
  array_agg(c) AS preferred_pet_type,
  max(count_c) AS count
FROM (
  SELECT
    c,
    COUNT(*) AS count_c,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
  FROM cte2
  GROUP BY c
) subquery
WHERE rnk = 1
union
SELECT
  '46-60' AS age_group,
  3 as id,
  array_agg(c) AS preferred_pet_type,
  max(count_c) AS count
FROM (
  SELECT
    c,
    COUNT(*) AS count_c,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
  FROM cte3
  GROUP BY c
) subquery
WHERE rnk = 1
union
SELECT
  '61 and above' AS age_group,
  4 as id,
  array_agg(c) AS preferred_pet_type,
  max(count_c) AS count
FROM (
  SELECT
    c,
    COUNT(*) AS count_c,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
  FROM cte4
  GROUP BY c
) subquery
WHERE rnk = 1 order by id
  ) innq;