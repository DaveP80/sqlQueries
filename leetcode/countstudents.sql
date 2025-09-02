//Leetcode 580: Count Student Number in Departments
WITH cte
     AS (SELECT DISTINCT dept_name,
                         0 AS student_number
         FROM   department),
     cte2
     AS (SELECT dept_name,
                Count(student_id) AS student_number
         FROM   student s
                RIGHT JOIN department d
                        ON s.dept_id = d.dept_id
         GROUP  BY s.dept_id
         ORDER  BY 2 DESC,
                   1) SELECT *
FROM   cte2
UNION
SELECT *
FROM   cte
WHERE  ( cte.dept_name NOT IN (SELECT dept_name
                               FROM   cte2) ); 