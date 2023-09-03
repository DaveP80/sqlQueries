-- MySQL
-- LeetCode 1341 Link: https://leetcode.com/problems/movie-rating
with cte as ( 
select name as results from users u join
(
select user_id, rank() over (order by count(*) desc) r from movierating group by user_id
) a on u.user_id = a.user_id where r = 1 order by name limit 1
), cte2 as
(
select title from movies m join
(
select movie_id, rank() over (order by avg(rating) desc) r from movierating 
where created_at between '2020-02-01' and '2020-02-28'
group by movie_id    
) z on m.movie_id = z.movie_id where r = 1 order by title limit 1
)
select * from cte
union all
select * from cte2;