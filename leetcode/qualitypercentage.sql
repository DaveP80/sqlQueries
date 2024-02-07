-- LeetCode No. 1211 Queries Quality and Percentage
select query_name, round(avg(rating/position)*1.0, 2) as quality, round(avg(case when rating < 3 then 1 else 0 end)*100.0, 2) as poor_query_percentage from queries
where query_name is not null group by 1;
