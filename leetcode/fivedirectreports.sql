-- MySQL
-- Write an SQL query to report the managers with at least five direct reports.
-- Return the result table in any order.
-- The query result format is in the following example.
-- Input: 
-- Employee table:
-- +-----+-------+------------+-----------+
-- | id  | name  | department | managerId |
-- +-----+-------+------------+-----------+
-- | 101 | John  | A          | None      |
-- | 102 | Dan   | A          | 101       |
-- | 103 | James | A          | 101       |
-- | 104 | Amy   | A          | 101       |
-- | 105 | Anne  | A          | 101       |
-- | 106 | Ron   | B          | 101       |
-- +-----+-------+------------+-----------+
SELECT name FROM Employee m join 
(
SELECT SUM(icount) as isum, managerId FROM
(
SELECT e.managerId, COUNT(distinct e.id) as icount from Employee e join Employee b ON e.managerId = b.managerId GROUP BY e.id
) n
GROUP BY managerId
) z
ON m.id = z.managerId WHERE isum > 4;
-- Output: 
-- +------+
-- | name |
-- +------+
-- | John |
-- +------+
-- ALSO WORKS
# Write your MySQL query statement below
select name from Employee where id in (select managerId from Employee group by managerId having count(*)>=5);