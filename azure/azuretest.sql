-- starter sql query for azure (ms sql server), data from mockaroo
create table azuretest (
	customer_id INT,
	product_name TEXT,
	product_category VARCHAR(11),
	product_price DECIMAL(6,2),
	quantity INT,
	total_price DECIMAL(10,2),
	shipping_address VARCHAR(50),
	order_status VARCHAR(10)
);
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (1, 'phasellus', 'electronics', 66.82, 73, 4877.86, '19 Pearson Court', 'delivered');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (2, 'quis', 'groceries', 238.2, 78, 18579.6, '0031 Westerfield Park', 'pending');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (3, 'nulla', 'home goods', 519.56, 63, 32732.28, '830 Dwight Pass', 'shipped');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (4, 'enim', 'groceries', 429.83, 78, 33526.74, '1474 Hazelcrest Center', 'delivered');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (5, 'feugiat', 'electronics', 889.22, 49, 43571.78, '248 Butternut Street', 'shipped');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (6, 'turpis', 'beauty', 642.44, 34, 21842.96, '30 East Circle', 'delivered');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (7, 'ligula', 'electronics', 126.39, 54, 6825.06, '92901 Pankratz Road', 'pending');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (8, 'nulla', 'beauty', 307.98, 34, 10471.32, '5884 Lake View Lane', 'delivered');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (9, 'sem', 'home goods', 456.84, 26, 11877.84, '2 Luster Center', 'processing');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (10, 'vulputate', 'home goods', 942.94, 64, 60348.16, '41729 Reinke Place', 'pending');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (11, 'tincidunt', 'electronics', 132.56, 34, 4507.04, '30 Fisk Hill', 'pending');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (12, 'ultrices', 'home goods', 295.46, 60, 17727.6, '4671 Vahlen Lane', 'processing');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (13, 'integer', 'electronics', 730.68, 24, 17536.32, '3 Sycamore Terrace', 'pending');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (14, 'massa', 'beauty', 412.88, 87, 35920.56, '921 Iowa Avenue', 'processing');
insert into azuretest (customer_id, product_name, product_category, product_price, quantity, total_price, shipping_address, order_status) values (15, 'semper', 'home goods', 543.41, 2, 1086.82, '678 Pennsylvania Drive', 'shipped');
--two similar window functions
SELECT
    [dbo].[azuretest].customer_id,
    [dbo].[azuretest].product_name,
    [dbo].[azuretest].total_price,
    [dbo].[azuretest].product_category,
    ROUND(AVG(product_price) OVER (
        PARTITION BY product_category
    ), 2) avg_product_price
FROM
    [dbo].[azuretest];
-- another similar window function
SELECT
    [dbo].[azuretest].product_name,
    [dbo].[azuretest].total_price,
    [dbo].[azuretest].product_category,
    ROUND(AVG(product_price) OVER (
        PARTITION BY product_category
    ), 2) avg_product_price
FROM
    [dbo].[azuretest];
