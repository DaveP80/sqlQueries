-- MySQL Leet no. 1179
-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
-- Return the result table in any order.
-- Input: 
-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+
SELECT id,
       MAX(a) AS Jan_Revenue,
       MAX(b) AS Feb_Revenue,
       MAX(c) AS Mar_Revenue,
       MAX(d) AS Apr_Revenue,
       MAX(e) AS May_Revenue,
       MAX(f) AS Jun_Revenue,
       MAX(g) AS Jul_Revenue,
       MAX(h) AS Aug_Revenue,
       MAX(i) AS Sep_Revenue,
       MAX(j) AS Oct_Revenue,
       MAX(k) AS Nov_Revenue,
       MAX(l) AS Dec_Revenue
FROM
(
SELECT id, 
CASE WHEN month = 'Jan' THEN revenue ELSE null END AS a,
CASE WHEN month = 'Feb' THEN revenue ELSE null END AS b,
CASE WHEN month = 'Mar' THEN revenue ELSE null END AS c,
CASE WHEN month = 'Apr' THEN revenue ELSE null END AS d,
CASE WHEN month = 'May' THEN revenue ELSE null END AS e,
CASE WHEN month = 'Jun' THEN revenue ELSE null END AS f,
CASE WHEN month = 'Jul' THEN revenue ELSE null END AS g,
CASE WHEN month = 'Aug' THEN revenue ELSE null END AS h,
CASE WHEN month = 'Sep' THEN revenue ELSE null END AS i,
CASE WHEN month = 'Oct' THEN revenue ELSE null END AS j,
CASE WHEN month = 'Nov' THEN revenue ELSE null END AS k,
CASE WHEN month = 'Dec' THEN revenue ELSE null END AS l FROM department
) z
GROUP BY id;