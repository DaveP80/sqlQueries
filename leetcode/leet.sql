-- A company's executives are interested in seeing who earns the most money in each of the 
-- company's departments. A high earner in a department is an employee who has a salary in 
-- the top three unique salaries for that department.
-- Write an SQL query to find the employees who are high earners in each of the departments.
-- Return the result table in any order.

Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1');
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

-- create temporary ranking table
SELECT Department.name as "Department", e.Name AS "Employee", e.Salary FROM
(SELECT DepartmentId, name, salary, DENSE_RANK() OVER(PARTITION BY DepartmentId ORDER BY salary DESC) AS r
FROM Employee) e
JOIN Department ON e.departmentId = Department.id
WHERE r <= 3;

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      |  90000 |
| IT         | Joe      |  85000 |
| IT         | Randy    |  85000 |
| IT         | Will     |  70000 |
| Sales      | Henry    |  80000 |
| Sales      | Sam      |  60000 |
+------------+----------+--------+