-- Example query to unnest "tasks" arrays.
with cte as (
SELECT
	*
FROM
	json_tree('{
  "company": "Tech Corp",
  "location": "Silicon Valley",
  "employees": [
    {
      "name": "Alice",
      "age": 30,
      "department": "Engineering",
      "projects": [
        {
          "name": "Project X",
          "status": "In Progress",
          "tasks": [
            {
              "task_name": "Research",
              "progress": 80
            },
            {
              "task_name": "Development",
              "progress": 50
            }
          ]
        },
        {
          "name": "Project Y",
          "status": "Completed",
          "tasks": [
            {
              "task_name": "Testing",
              "progress": 100
            }
          ]
        }
      ]
    },
    {
      "name": "Bob",
      "age": 35,
      "department": "Marketing",
      "projects": []
    }
  ]
}
'))
,
cte2 as (
select
	id
from
	cte
where
	"key" = 'tasks'
),
cte3 as (
select
	*
from
	cte
where
	id in (
	select
		*
	from
		cte2)
)
select
	*
from
	cte3
union
select
	*
from
	cte
where
	parent in (
	select
		id
	from
		cte3)
order by
	id;
