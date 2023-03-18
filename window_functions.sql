create table students (
	Student_Id INT,
	Student_Name VARCHAR(50),
	Gender VARCHAR(50),
	Subject_Name VARCHAR(50),
	Marks_Scored INT,
	Total_Marks INT
);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (1, 'Jabez', 'Male', 'Computers', 27, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (2, 'Ivor', 'Male', 'Tools', 100, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (3, 'Emmye', 'Female', 'Grocery', 72, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (4, 'Meghan', 'Female', 'Movies', 87, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (5, 'Crystie', 'Female', 'Tools', 12, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (6, 'Curry', 'Male', 'Baby', 86, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (7, 'Magda', 'Female', 'Electronics', 90, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (8, 'Elisha', 'Male', 'Outdoors', 22, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (9, 'Tally', 'Female', 'Sports', 62, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (10, 'Boone', 'Male', 'Jewelry', 49, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (11, 'Crichton', 'Male', 'Movies', 50, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (12, 'Doria', 'Female', 'Computers', 56, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (13, 'Melisa', 'Female', 'Home', 91, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (14, 'Norry', 'Male', 'Toys', 12, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (15, 'Shanda', 'Female', 'Sports', 50, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (16, 'Raimundo', 'Male', 'Grocery', 64, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (17, 'Marris', 'Female', 'Garden', 67, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (18, 'Ainsley', 'Female', 'Grocery', 50, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (19, 'Ephrayim', 'Male', 'Kids', 34, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (20, 'Raina', 'Female', 'Sports', 29, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (21, 'Lucienne', 'Female', 'Beauty', 68, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (22, 'Maddy', 'Female', 'Home', 89, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (23, 'Waylen', 'Male', 'Electronics', 55, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (24, 'Veronica', 'Female', 'Music', 100, 100);
insert into students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) values (25, 'Jody', 'Male', 'Baby', 23, 100);

-- normal group by aggregate function
select subject_name,MAX(marks_scored) as max_marks from students group by subject_name;

-- aggregate window with something linke the over() clause
with cte as (select AVG(marks_scored) as Average_marks from students), cte2 as (select MIN(marks_scored) as Min_marks from students),
cte3 as (select MAX(marks_scored) as Max_marks from students) select students.*, cte.Average_marks, cte2.Min_marks, cte3.Max_marks 
from students, cte, cte2, cte3;
