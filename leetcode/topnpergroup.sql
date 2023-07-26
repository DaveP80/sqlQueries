-- Codewars 5kyu
-- https://www.codewars.com/kata/582001237a3a630ce8000a41
-- Order the result set by:
-- category name alphabetically
-- number of post views largest to lowest
-- post id lowest to largest
-- Note:
-- Some categories may have less than two or no posts at all.
-- Two or more posts within the category can be tied by (have the same) the number of views. Use post id 
-- as a tie breaker - a post with a lower id gets a higher rank.
-- Desired Output
-- category_id | category | title                             | views | post_id
-- ------------+----------+-----------------------------------+-------+--------
-- 5           | art      | Most viewed post about Art        | 9234  | 234
-- 5           | art      | Second most viewed post about Art | 9234  | 712
-- 2           | business | NULL                              | NULL  | NULL
-- 7           | sport    | Most viewed post about Sport      | 10    | 126
select coalesce(category_id, cid) category_id, category, title, views, post_id from (
select *,p.id post_id, c.id as cid, dense_rank() over (partition by c.id 
    order by views desc, p.id) r from categories c left join posts p on c.id = p.category_id
  ) a where r < 3 order by category, views desc, post_id;