-- LeetCode No. 1204
select person_name from Queue q
where (select sum(weight) from Queue where turn <= q.turn) <= 1000 order by turn desc
limit 1;
