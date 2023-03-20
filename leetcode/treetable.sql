create table treetable(
id int primary key not null,
p_id int);

insert into treetable (id, p_id) values (1, null);
insert into treetable (id, p_id) values (2, 1);
insert into treetable (id, p_id) values (3, 1);
insert into treetable (id, p_id) values (4, 2);
insert into treetable (id, p_id) values (5, 2);

select id, case when p_id is null then 'Root'
	when p_id is not null and id in (select distinct p_id from treetable)
	 then 'Inner' else 'Leaf'
	 end as type 
from treetable;