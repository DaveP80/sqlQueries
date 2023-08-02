-- Codewars Postgresql
-- https://www.codewars.com/kata/6479b3a881616a003732a726
-- A table named users. This table includes a jsonb column, info, which holds JSON data. Here is a simplified schema of the table:
-- id: primary key, integer.
-- info: JSON column which includes:
-- name: a string (user's name).
-- pets: an array of JSON objects (each object represents a pet and has a name field and type field).
-- In this task, you need to extract and analyze the initial letters of the pet names to find the most popular ones. The query 
-- should return a list of the initial letters, the count of pets starting with each letter, and the names of the users who own 
-- pets whose names start with each letter.
select first_letter, pet_count, (select string_agg(info->>'name'::text, ', ') from users where id in (select unnest(user_ids))) as user_names from (
select f first_letter, count(*) as pet_count, array_agg(distinct id) user_ids from (
select left(obj ->> 'name', 1) f, id from (
select jsonb_array_elements(info -> 'pets') obj, id from users
  ) z order by id
  ) n group by first_letter order by pet_count desc, first_letter
  ) q;