-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- n = 2
-- Output: 
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+

-- Write an SQL query to report the nth highest salary 
-- from the Employee table. If there is no nth highest 
-- salary, the query should report null.

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  DECLARE result INT;
  SET result = NULL;
  SET N = N - 1;
  IF N >= 0 THEN
    SELECT salary INTO result
    FROM (
      SELECT DISTINCT salary
      FROM Employee
      ORDER BY salary DESC
      LIMIT N, 1
    ) AS tmp;
  END IF;
  RETURN result;
END