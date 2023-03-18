create table brands (
	id INT,
	year INT,
	brand VARCHAR(50),
	amount INT
);
insert into brands (id, year, brand, amount) values (1, 2021, 'Apple', 5130);
insert into brands (id, year, brand, amount) values (2, 2009, 'Apple', 21034);
insert into brands (id, year, brand, amount) values (3, 2003, 'Apple', 41516);
insert into brands (id, year, brand, amount) values (4, 2022, 'Apple', 14374);
insert into brands (id, year, brand, amount) values (5, 2003, 'Nokia', 16219);
insert into brands (id, year, brand, amount) values (6, 2022, 'Nokia', 48208);
insert into brands (id, year, brand, amount) values (7, 2021, 'Nokia', 29576);
insert into brands (id, year, brand, amount) values (8, 1993, 'Nokia', 8849);
insert into brands (id, year, brand, amount) values (9, 2017, 'Nokia', 43483);
insert into brands (id, year, brand, amount) values (10, 2019, 'Samsung', 16590);
insert into brands (id, year, brand, amount) values (11, 2009, 'Samsung', 32443);
insert into brands (id, year, brand, amount) values (12, 2007, 'Samsung', 41659);
insert into brands (id, year, brand, amount) values (13, 2013, 'Samsung', 14914);
insert into brands (id, year, brand, amount) values (14, 2022, 'Samsung', 41350);
insert into brands (id, year, brand, amount) values (15, 1992, 'Samsung', 33497);

-- refactor brands table so it is sorted by year column (id serialization is unimportant)
create table brands_new (
        id INT,
        year INT,
        brand VARCHAR(50),
        amount INT
);
-- order brands_new table by year column
insert into brands_new(id, year, brand, amount) select id, year, brand, amount from brands order by year asc;

drop table brands;

ALTER TABLE brands_new
RENAME TO brands;

-- delete rows with duplicate year value
DELETE FROM brands
WHERE id NOT IN (
  SELECT MIN(id)
  FROM brands
  GROUP BY year
);

-- write a query to fetch the record of brand whose amount is increasing every year.
-- create new flag column for each row with amount greater than previous row amount.

-- create new column (flag) with 1 or 0 value if lead column condition is true.
select *, (case when amount < lead(amount) over(partition by brand order by year) then 1 else 0 end) as flag from brands;

-- improved query which includes final year in partition
select *, (case when amount < lead(amount, 1, amount+1) over(partition by brand order by year) then 1 else 0 end) as flag from brands;

-- now get the year, brand, and amount of brand with all 1 flags
with cte as (select *, (case when amount < lead(amount, 1, amount+1) over(partition by brand order by year) then 1 else 0 end) as flag from brands)
 select * from brands where brand not in (select brand from cte where flag = 0);

 id | year | brand | amount 
----+------+-------+--------
  8 | 1993 | Nokia |   8849
  9 | 2017 | Nokia |  43483
