-- Write an SQL query to report the largest single number. If there is no single number, report null.
-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output: 
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
SELECT MAX(num) as num
FROM (
  SELECT num
  FROM MyNumbers
  GROUP BY num
  HAVING COUNT(*) = 1
) as ans
