-- PostgreSQL
-- You have a table of in-app purchases by user. Users that make their first in-app purchase are placed in a marketing 
-- campaign where they see call-to-actions for more in-app purchases. Find the number of users that made additional in-app 
-- purchases due to the success of the marketing campaign.
-- The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one or 
-- multiple purchases on the first day do not count, nor do we count users that over time purchase only the products they 
-- purchased on the first day.
-- | user_id | created_at  | product_id | quantity | price |
-- |---------|-------------|------------|----------|-------|
-- | 10      | 2019-01-01  | 101        | 3        | 55    |
-- | 10      | 2019-01-02  | 119        | 5        | 29    |
-- | 10      | 2019-03-31  | 111        | 2        | 149   |
-- | 11      | 2019-01-02  | 105        | 3        | 234   |
-- | 11      | 2019-03-31  | 120        | 3        | 99    |
-- | 12      | 2019-01-02  | 112        | 2        | 200   |
-- | 12      | 2019-03-31  | 110        | 2        | 299   |
-- | 13      | 2019-01-05  | 113        | 1        | 67    |
-- | 13      | 2019-03-31  | 118        | 3        | 35    |
-- | 14      | 2019-01-06  | 109        | 5        | 199   |
-- | 14      | 2019-01-06  | 107        | 2        | 27    |
-- | 14      | 2019-03-31  | 112        | 3        | 200   |
-- | 15      | 2019-01-08  | 105        | 4        | 234   |
-- | 15      | 2019-01-09  | 110        | 4        | 299   |
-- | 15      | 2019-03-31  | 116        | 2        | 499   |
-- | 16      | 2019-01-10  | 113        | 2        | 67    |
-- | 16      | 2019-03-31  | 107        | 4        | 27    |
-- | 17      | 2019-01-11  | 116        | 2        | 499   |
-- | 17      | 2019-03-31  | 104        | 1        | 154   |
-- | 18      | 2019-01-12  | 114        | 2        | 248   |
-- | 18      | 2019-01-12  | 113        | 4        | 67    |
-- | 19      | 2019-01-12  | 114        | 3        | 248   |
-- | 20      | 2019-01-15  | 117        | 2        | 999   |
-- | 21      | 2019-01-16  | 105        | 3        | 234   |
-- | 21      | 2019-01-17  | 114        | 4        | 248   |
-- | 22      | 2019-01-18  | 113        | 3        | 67    |
WITH cte AS (
SELECT user_id
FROM marketing_campaign m
WHERE NOT EXISTS (
  SELECT 1
  FROM
(
SELECT user_id, product_id, COUNT(*) OVER (PARTITION BY user_id) FROM (
SELECT user_id, product_id, created_at FROM (
SELECT *, MIN(created_at) OVER (PARTITION BY user_id) AS firstday FROM marketing_campaign
) innb WHERE innb.created_at = innb.firstday) zz
) table2
  
  WHERE table2.user_id = m.user_id
    AND table2.product_id = m.product_id
)
)
SELECT SUM(count) as count FROM 
(
SELECT COUNT(distinct user_id) as count FROM cte GROUP BY user_id
) innz;
-- count
-- -----
--   23
