-- Codewars
-- For each category in the tree-like categories table, calculate how many records in the items 
-- table belong to it and its parent categories across all the tree levels.
-- Input table
-- -----------------------------------
-- |   Table    |   Column    | Type |
-- |------------+-------------+------|
-- | categories | id          | int  |
-- |            | parent      | int  |
-- |------------+-------------+------|
-- | items      | id          | int  |
-- |            | category_id | int  |
-- -----------------------------------
-- Output table
-- ------------------
-- | Column | Type  |
-- |--------+-------|
-- | id     | int   |
-- | total  | int   |
-- ------------------
with recursive
  cte_hierarchy(id, parent, item) as (
    select a.id, a.parent, b.id
    from
      categories a
      left join items b on a.id = b.category_id
    union all
    select b.id, b.parent, a.item
    from
      cte_hierarchy a
      join categories b on a.parent = b.id
  )
select id, count(item) total
from cte_hierarchy
group by 1
order by 1