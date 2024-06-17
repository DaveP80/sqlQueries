
create table rides (
	id INT,
	request_date DATE,
	request_status VARCHAR(50),
	distance INT,
	cost INT
);
insert into rides (id, request_date, request_status, distance, cost) values (1, '2023-02-02', true, 8, 18);
insert into rides (id, request_date, request_status, distance, cost) values (2, '2022-03-27', true, 17, 13);
insert into rides (id, request_date, request_status, distance, cost) values (3, '2023-03-08', true, 10, 23);
insert into rides (id, request_date, request_status, distance, cost) values (4, '2023-02-10', true, 17, 45);
insert into rides (id, request_date, request_status, distance, cost) values (5, '2022-12-27', false, 14, 19);
insert into rides (id, request_date, request_status, distance, cost) values (6, '2022-04-30', false, 28, 22);
insert into rides (id, request_date, request_status, distance, cost) values (7, '2022-05-10', true, 14, 20);
insert into rides (id, request_date, request_status, distance, cost) values (8, '2022-05-02', true, 7, 21);
insert into rides (id, request_date, request_status, distance, cost) values (9, '2022-04-22', true, 28, 50);
insert into rides (id, request_date, request_status, distance, cost) values (10, '2022-10-24', false, 9, 37);
insert into rides (id, request_date, request_status, distance, cost) values (11, '2022-09-07', false, 7, 40);
insert into rides (id, request_date, request_status, distance, cost) values (12, '2022-09-21', false, 15, 9);
insert into rides (id, request_date, request_status, distance, cost) values (13, '2022-11-19', true, 7, 48);
insert into rides (id, request_date, request_status, distance, cost) values (14, '2022-11-08', true, 18, 24);
insert into rides (id, request_date, request_status, distance, cost) values (15, '2023-02-26', true, 15, 24);
insert into rides (id, request_date, request_status, distance, cost) values (16, '2022-06-18', false, 16, 36);
insert into rides (id, request_date, request_status, distance, cost) values (17, '2022-05-23', true, 26, 33);
insert into rides (id, request_date, request_status, distance, cost) values (18, '2022-11-14', true, 26, 17);
insert into rides (id, request_date, request_status, distance, cost) values (19, '2022-03-24', false, 25, 42);
insert into rides (id, request_date, request_status, distance, cost) values (20, '2022-08-13', false, 22, 20);

SELECT
    extract(month from request_date) as "month",
    request_status,
    SUM (cost) as "total_cost"
FROM
    rides
GROUP BY
    CUBE (extract(month from request_date), request_status)
ORDER BY
    1,3;

