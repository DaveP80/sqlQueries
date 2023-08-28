-- For explanation of problem https://youtu.be/HiscSRv7zWk?si=yWPiyFqH86U8XCKf
-- Postgresql
drop table if exists job_positions;
create table job_positions
(
	id			int,
	title 		varchar(100),
	groups 		varchar(10),
	levels		varchar(10),
	payscale	int,
	totalpost	int
);
insert into job_positions values (1, 'General manager', 'A', 'l-15', 10000, 1);
insert into job_positions values (2, 'Manager', 'B', 'l-14', 9000, 5);
insert into job_positions values (3, 'Asst. Manager', 'C', 'l-13', 8000, 10);

drop table if exists job_employees;
create table job_employees
(
	id				int,
	name 			varchar(100),
	position_id 	int
);
insert into job_employees values (1, 'John Smith', 1);
insert into job_employees values (2, 'Jane Doe', 2);
insert into job_employees values (3, 'Michael Brown', 2);
insert into job_employees values (4, 'Emily Johnson', 2);
insert into job_employees values (5, 'William Lee', 3);
insert into job_employees values (6, 'Jessica Clark', 3);
insert into job_employees values (7, 'Christopher Harris', 3);
insert into job_employees values (8, 'Olivia Wilson', 3);
insert into job_employees values (9, 'Daniel Martinez', 3);
insert into job_employees values (10, 'Sophia Miller', 3);
-- Solution
with recursive union_rows as (
select
	t1.id,
	title,
	t1.groups,
	levels,
	payscale,
	name,
	totalpost
from
	job_positions t1
join job_employees t2 on
	t1.id = t2.position_id
union
select
	ur.id,
	title,
	ur.groups,
	levels,
	payscale,
	name,
	totalpost-1
from
	union_rows ur
where
	ur.totalpost > 1
)
select
	z.title,
	z.groups,
	z.levels,
	z.payscale,
	name
from
	(
	select
		*,
		rank() over (partition by title
	order by
		totalpost desc)
	from
		(
		select
			distinct ur.id,
			title,
			groups,
			levels,
			payscale,
			case
				when totalpost < (
				select
					totalpost
				from
					job_positions
 jp
				where
					jp.id = ur.id) then 'Vacant'
				else name
			end as name,
			totalpost
		from
			union_rows ur
 ) a) z
join job_positions j on
	z.id = j.id
where
	rank <= j.totalpost
order by
	z.id,
	rank;
-- Result
title          |groups|levels|payscale|name              |
---------------+------+------+--------+------------------+
General manager|A     |l-15  |   10000|John Smith        |
Manager        |B     |l-14  |    9000|Jane Doe          |
Manager        |B     |l-14  |    9000|Michael Brown     |
Manager        |B     |l-14  |    9000|Emily Johnson     |
Manager        |B     |l-14  |    9000|Vacant            |
Manager        |B     |l-14  |    9000|Vacant            |
Asst. Manager  |C     |l-13  |    8000|William Lee       |
Asst. Manager  |C     |l-13  |    8000|Daniel Martinez   |
Asst. Manager  |C     |l-13  |    8000|Jessica Clark     |
Asst. Manager  |C     |l-13  |    8000|Olivia Wilson     |
Asst. Manager  |C     |l-13  |    8000|Sophia Miller     |
Asst. Manager  |C     |l-13  |    8000|Christopher Harris|
Asst. Manager  |C     |l-13  |    8000|Vacant            |
Asst. Manager  |C     |l-13  |    8000|Vacant            |
Asst. Manager  |C     |l-13  |    8000|Vacant            |
Asst. Manager  |C     |l-13  |    8000|Vacant            |