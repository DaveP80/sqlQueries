-- PSQL
-- Recursive example of SQL. This returns a level i.e. ranking of employees. 
-- Employees with no manager (null) are level 1. The next level is an employee with
-- a manager who is a level 1. The next level is an employee with a manager who is a level 2 
-- employee.
create table employees (
    employee_id int,
    name varchar(20),
    manager_id int
);

insert into employees (employee_id, name, manager_id) values (1, 'bill', null);
insert into employees (employee_id, name, manager_id) values (2, 'tommy', 5);
insert into employees (employee_id, name, manager_id) values (3, 'feather', 6);
insert into employees (employee_id, name, manager_id) values (4, 'shoe', 1);
insert into employees (employee_id, name, manager_id) values (5, 'trevor', 1);
insert into employees (employee_id, name, manager_id) values (6, 'sam', null);
insert into employees (employee_id, name, manager_id) values (7, 'erica', 6);
insert into employees (employee_id, name, manager_id) values (8, 'mark', 5);
insert into employees (employee_id, name, manager_id) values (9, 'hillary', null);
insert into employees (employee_id, name, manager_id) values (10, 'space', 9);

WITH RECURSIVE employee_hierarchy AS (
    SELECT
        employee_id,
        name,
        manager_id,
        1 AS level
    FROM
        employees
    WHERE
        manager_id IS NULL -- Root employees (those without a manager)
    UNION
    ALL
    SELECT
        e.employee_id,
        e.name,
        e.manager_id,
        eh.level + 1
    FROM
        employees e
        JOIN employee_hierarchy eh ON e.manager_id = eh.employee_id
)
SELECT
    employee_id,
    name,
    manager_id,
    level
FROM
    employee_hierarchy
ORDER BY
    level,
    employee_id;
--  employee_id |  name   | manager_id | level 
-- -------------+---------+------------+-------
--            1 | bill    |            |     1
--            6 | sam     |            |     1
--            9 | hillary |            |     1
--            3 | feather |          6 |     2
--            4 | shoe    |          1 |     2
--            5 | trevor  |          1 |     2
--            7 | erica   |          6 |     2
--           10 | space   |          9 |     2
--            2 | tommy   |          5 |     3
--            8 | mark    |          5 |     3