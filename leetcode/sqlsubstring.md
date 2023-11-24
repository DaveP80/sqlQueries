### StratScratch No. 2166

One quick way to get a specific char or substring from a column of type TEXT in
SQL is to use the RIGHT() and or LEFT() functions.

```sql
select * from random_id;
```
+------+-------+
|  id  | Value |
+------+-------+
| 2DQS4| 2ABS5 |
| 2CBS6| 2DYS7 |
| 2SUI8| 2POI9 |
| 2PTY1| 3DUU1 |
| 3ASD1| 3TQS1 |
| 3CYS1| 3CGY1 |
| 3CUY1| 3NOS8 |
| 4DSS1| 4AOS9 |
| 5TLS2| 5NES1 |
| 5MQS2| 5ZQS3 |
+------+-------+
-- Solution
```sql
-- You've been asked to arrange a column of random IDs in ascending -- alphabetical order based on their second character.
select id, right(left(id, 2), 1) as second from random_id order by second;
```
+-------+---------+
|   id  | second  |
+-------+---------+
| 2ABS5 |   A     |
| 3ASD1 |   A     |
| 4AOS9 |   A     |
| 2CBS6 |   C     |
| 3CGY1 |   C     |
| 3CUY1 |   C     |
| 3CYS1 |   C     |
| 2DQS4 |   D     |
| 2DYS7 |   D     |
| 3DUU1 |   D     |
| 4DSS1 |   D     |
| 5MQS2 |   M     |
| 5NES1 |   N     |
| 3NOS8 |   N     |
| 2POI9 |   P     |
| 2PTY1 |   P     |
| 2SUI8 |   S     |
| 5TLS2 |   T     |
| 3TQS1 |   T     |
| 5ZQS3 |   Z     |
+-------+---------+