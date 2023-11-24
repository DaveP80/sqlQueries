-- StrataScratch Postgresql
-- ID 10297
with cte as (
select fu.id, count(*) c from fb_users fu join fb_comments fc on fu.id = fc.user_id where fc.created_at >= 
(select joined_at from fb_users where id = fc.user_id) and created_at between '2020-01-01' and '2020-01-31' and extract(year from joined_at) between 2018 and 2020 and extract(year from joined_at) 
between 2018 and 2020 group by 1
)
select te.c as comment_count, count(distinct te2.id) from (select distinct c from cte) te join (select distinct id, c from cte) te2 on te.c = te2.c group by te.c;