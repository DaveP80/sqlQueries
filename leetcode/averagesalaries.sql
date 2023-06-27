-- Postgres
-- We need to obtain a list of departments with an average salary lower than the overall
-- average salary of the company. However, when calculating the company's average salary, you must exclude
-- the salaries of the department you are comparing it with. For instance, when comparing the average salary
-- of the HR department with company's average, the HR department's salaries shouldn't be taken into consideration
-- for the calculation of company average salary.
create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp
values (3, 'Vikas', 100, 10000,4,37);
insert into emp
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp
values (6, 'Agam', 200, 12000,2, 14);
insert into emp
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp
values (8, 'Ashish', 200,5000,2,12);
insert into emp
values (9, 'Mukesh',300,6000,6,51);
insert into emp
values (10, 'Rakesh',300,7000,6,50);

SELECT * FROM
(
SELECT department_id, AVG(salary) AS avg_sal FROM 
emp GROUP BY department_id
) a
JOIN
(
SELECT c.department_id, AVG(salary) AS avg_sal FROM 
(
SELECT DISTINCT department_id FROM emp
) c
JOIN emp e 
ON e.department_id != c.department_id GROUP BY c.department_id
) b
ON a.department_id = b.department_id WHERE a.avg_sal < b.avg_sal;
-- department_id|avg_sal              |department_id|avg_sal              |
-- -------------+---------------------+-------------+---------------------+
--           300|6500.0000000000000000|          300|9750.0000000000000000|
-- Similar shorter Query
select department_id,avg(salary) as dept_sal
from emp e
group by department_id
having avg(salary) < (select avg(salary) from emp f where f.department_id not in (e.department_id));