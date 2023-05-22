create table sales (
	branch VARCHAR(8),
	date DATE,
	seller VARCHAR(7),
	item VARCHAR(50),
	quantity INT,
	unit_price INT
);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('London-1', '2021-12-07', 'John', 'CDK Global, Inc.', 2, 57);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('London-1', '2021-12-07', 'Charles', 'Pinnacle West Capital Corporation', 5, 80);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('Paris-1', '2021-12-07', 'Mary', 'FB Financial Corporation', 2, 52);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('London-1', '2021-12-07', 'Charles', 'SPX Corporation', 1, 54);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('Paris-1', '2021-12-07', 'Sean', 'Gabelli Dividend', 5, 59);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('Paris-1', '2021-12-07', 'Sean', 'Apple Inc.', 3, 80);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('London-1', '2021-12-07', 'Mary', 'GAMCO Natural Resources, Gold & Income Tust ', 5, 55);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('London-2', '2021-12-07', 'Mary', 'Live Oak Bancshares, Inc.', 1, 80);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('Paris-1', '2021-12-07', 'Charles', 'Conifer Holdings, Inc.', 1, 78);
insert into sales (branch, date, seller, item, quantity, unit_price) values ('Paris-1', '2021-12-07', 'Charles', 'Adient plc', 2, 54);
-- add an extra column with the price of the most expensive item sold in the same 
-- branch that day. To obtain the price of the most expensive item, we use a common 
-- table expression like this, default is Ascending order.
WITH highest AS (
  SELECT
    branch,
    date,
    MAX(unit_price) AS highest_price
  FROM sales
  GROUP BY branch, date
)
SELECT
  sales.*,
  h.highest_price
FROM sales
JOIN highest h
  ON sales.branch = h.branch
    AND sales.date = h.date