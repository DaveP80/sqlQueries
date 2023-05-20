-- PSQL
create table input (id int, formula varchar(10), value int);
insert into
    input
values
    (1, '1+4', 10),
(2, '2+1', 5),
(3, '3-2', 40),
(4, '4-1', 20);

--  id | formula | value 
-- ----+---------+-------
--   1 | 1+4     |    10
--   2 | 2+1     |     5
--   3 | 3-2     |    40
--   4 | 4-1     |    20
-- Target
--  id | value | formula | new_value 
-- ----+-------+---------+-----------
--   2 |     5 | 2+1     |        15
--   4 |    20 | 4-1     |        10
--   3 |    40 | 3-2     |        35
--   1 |    10 | 1+4     |        30
SELECT
    a.id,
    a.value,
    a.formula,
    a.new_value
FROM
    (
        with cte as (
            select
                *,
                left(formula, 1) as d1,
                right(formula, 1) as d2,
                SUBSTRING(formula, 2, 1) as o
            FROM
                input
        )
        SELECT
            cte.id,
            cte.value,
            cte.formula,
            cte.o,
            ip1.value as d1_value,
            ip2.value as d2_value,
            case
                when cte.o = '+' then ip1.value + ip2.value
                else ip1.value - ip2.value
            end as new_value
        FROM
            cte
            inner join input ip1 on CAST(cte.d1 AS integer) = ip1.id
            inner join input ip2 on CAST(cte.d2 AS integer) = ip2.id
    ) AS a;