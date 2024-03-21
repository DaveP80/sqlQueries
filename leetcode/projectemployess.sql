-- LeetCode No. 1075 Project Employee I
-- Natural Join solution
select project_id, round(avg(experience_years), 2) average_years from project
natural join employee group by 1;
