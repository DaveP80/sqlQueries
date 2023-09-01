CREATE TABLE public.exercise (
	id serial4 NOT NULL,
	"name" varchar(50) NULL,
	difficulty int4 NOT NULL DEFAULT 10,
	CONSTRAINT exercise_pkey PRIMARY KEY (id)
);
CREATE TABLE public.exercise_task (
	done_on date NULL,
	ex_id int4 NULL,
	CONSTRAINT done_on_ex_key UNIQUE (done_on, ex_id)
);
ALTER TABLE public.exercise_task ADD CONSTRAINT exercise_task_ex_id_fkey FOREIGN KEY (ex_id) REFERENCES public.exercise(id);
INSERT INTO public.exercise ("name",difficulty) VALUES
	 ('run 10k',10),
	 ('pushups',5),
	 ('walking',5),
	 ('heavy lifting',10);
INSERT INTO public.exercise_task (done_on,ex_id) VALUES
	 ('2023-01-01',1),
	 ('2023-01-02',1),
	 ('2023-01-05',2),
	 ('2023-01-06',2),
	 ('2023-01-07',3),
	 ('2023-01-08',4),
	 ('2023-01-09',4),
	 ('2023-01-10',2),
	 ('2023-02-01',2),
	 ('2023-02-02',2),
	 ('2023-02-03',2),
	 ('2023-02-04',2),
	 ('2023-02-05',2);
WITH RECURSIVE cte AS (
SELECT
	id,
	name,
	difficulty
FROM
	exercise
UNION
SELECT
	id,
	name,
	difficulty-1 AS difficulty
FROM
	cte
WHERE
	difficulty > 1
)
SELECT
	c.id,
	c.name,
	c.difficulty,
	t.done_on
FROM
	(
	SELECT
		*,
		ROW_NUMBER() OVER (PARTITION BY id
	ORDER BY
		difficulty DESC) r
	FROM
		cte) c
JOIN
(
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY ex_id
	ORDER BY
		done_on) r
	FROM
		exercise_task)
t
ON
	t.ex_id = c.id
	AND t.r = c.r
UNION 
SELECT
	c.id,
	c.name,
	0 AS difficulty,
	t.done_on
FROM
	(
	SELECT
		*,
		ROW_NUMBER() OVER (PARTITION BY id
	ORDER BY
		difficulty DESC) r
	FROM
		cte) c
JOIN
(
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY ex_id
	ORDER BY
		done_on) r
	FROM
		exercise_task) t
ON
	t.ex_id = c.id
WHERE
	t.r NOT IN (
	SELECT
		difficulty
	FROM
		cte
	WHERE
		id = c.id)
ORDER BY
	id,
	difficulty DESC;
--query output
id|name         |difficulty|done_on   |
--+-------------+----------+----------+
 1|run 10k      |        10|2023-01-01|
 1|run 10k      |         9|2023-01-02|
 2|pushups      |         5|2023-01-05|
 2|pushups      |         4|2023-01-06|
 2|pushups      |         3|2023-01-10|
 2|pushups      |         2|2023-02-01|
 2|pushups      |         1|2023-02-02|
 2|pushups      |         0|2023-02-03|
 2|pushups      |         0|2023-02-04|
 2|pushups      |         0|2023-02-05|
 3|walking      |         5|2023-01-07|
 4|heavy lifting|        10|2023-01-08|
 4|heavy lifting|         9|2023-01-09|