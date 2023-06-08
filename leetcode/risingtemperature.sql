-- MySQL
-- 197
-- Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
-- Return the result table in any order.
SELECT id FROM
(
SELECT id, DATEDIFF(recordDate, LAG(recordDate) OVER (ORDER BY recordDate)) diffcolumn,
CASE WHEN temperature > LAG(temperature) OVER (ORDER BY recordDate) THEN 1 else null END flag
 FROM Weather
) a
WHERE diffcolumn = 1 and flag is not null;
-- Input: 
-- Weather table:
-- +----+------------+-------------+
-- | id | recordDate | temperature |
-- +----+------------+-------------+
-- | 1  | 2015-01-01 | 10          |
-- | 2  | 2015-01-02 | 25          |
-- | 3  | 2015-01-03 | 20          |
-- | 4  | 2015-01-04 | 30          |
-- +----+------------+-------------+
-- Output: 
-- +----+
-- | id |
-- +----+
-- | 2  |
-- | 4  |
-- +----+

