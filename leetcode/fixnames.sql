-- Write an SQL query to fix the names so that only the first 
-- character is uppercase and the rest are lowercase.

-- Return the result table ordered by user_id.
-- Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output: 
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

select u.user_id,CONCAT(UCASE(LEFT(u.name, 1)),LCASE(SUBSTRING(u.name, 2))) as name from 
Users as u order by u.user_id;