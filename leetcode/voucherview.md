## Codewars PSQL
### hard difficulty
![Imgur](https://i.imgur.com/aHLIDin.png)
create a VIEW. This VIEW is used by a sales store to give out vouches to members who have 
spent over $1000 in departments that have brought in more than $10000 total ordered by the members id. 
The VIEW must be called members_approved_for_voucher then you must create a SELECT query using the view.
```sql
CREATE VIEW members_approved_for_voucher AS 
WITH cte AS (
SELECT
	SUM(price) total,
	department_id
FROM
	(
	SELECT
		p.price,
		department_id
	FROM
		products p
	JOIN sales ON
		p.id = sales.product_id
  ) a
GROUP BY
	department_id
  )
SELECT
	member_id AS id,
	name,
	email,
	SUM(price) AS total_spending
FROM
	(
	SELECT
		member_id,
		m.name,
		m.email,
		price,
		c.department_id
	FROM
		products p
	JOIN sales s ON
		p.id = s.product_id
	JOIN members m ON
		m.id = s.member_id
	JOIN cte c ON
		s.department_id = c.department_id
	WHERE
		total > 10000
  ) z
GROUP BY
	member_id,
	z.name,
	z.email
HAVING
	SUM(price) > 1000
ORDER BY
	member_id;

SELECT
	*
FROM
	members_approved_for_voucher;
```
id  | name                | email                          | total_spending
----+---------------------+--------------------------------+---------------
6   | Kaylee Legros III   | dannie_smith@kirlin.info       | 1009.26
12  | Roselyn Hackett     | marcellus@kemmer.biz           | 1259.59
13  | Betsy VonRueden     | marlee_fahey@bins.org          | 1215.51
17  | Kelsie Runte        | verna@klein.io                 | 1169.74
19  | Samara Schaden      | georgianna@rathtrantow.net     | 1130
23  | Guy Collier V       | brooklyn@mitchell.biz          | 1183.55
24  | Baylee Marks        | juanita@swiftbrakus.net        | 1341
25  | Althea Hahn Jr.     | kendra.schultz@stantonbartell.name | 1354.47
29  | Felton Stehr        | johathan@kuhnwiegand.io        | 1287.8
33  | Susana Beahan       | leonor@rempelmedhurst.name     | 1089.96
34  | Tremaine Kovacek    | elyse@tromparmstrong.com       | 1154.48
39  | Elroy O'Hara        | spencer.keebler@schuppe.io     | 1086.35
42  | Cleora Grant        | jabari_zboncak@mohr.org        | 1141.59
43  | Jarrett Harber Jr.  | amya@durgan.org                | 1162.37
45  | Lizeth Lynch        | edwardo_wuckert@baumbach.info  | 1033.78
48  | Mr. Andreane Luettgen | benedict@huelgutkowski.net     | 1493.1