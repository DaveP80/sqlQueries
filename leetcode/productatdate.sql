-- MySQL
-- Leet No 1164 Product Price at a Given Date
-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before 
-- any change is 10.
-- Input: 
-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+
-- Output: 
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+
WITH cte AS (
SELECT *, MAX(change_date) OVER (PARTITION BY product_id) AS mchange FROM 
Products WHERE change_date < '2019-08-17'
)
SELECT product_id, 10 AS 'price' FROM 
Products where product_id not in (SELECT product_id FROM cte)
UNION
SELECT product_id, new_price AS 'price' FROM cte WHERE mchange = change_date
ORDER BY product_id;
