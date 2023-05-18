-- Cleaner insert into statements with many rows of data
create table students (
	Student_Id INT,
	Student_Name VARCHAR(50),
	Gender VARCHAR(50),
	Subject_Name VARCHAR(50),
	Marks_Scored INT,
	Total_Marks INT
);

-- Define the common part of the INSERT INTO statement as a variable
DECLARE @insertStmt AS VARCHAR(MAX) = 'INSERT INTO students (Student_Id, Student_Name, Gender, Subject_Name, Marks_Scored, Total_Marks) VALUES ';

-- Insert records using the variable and specific values
EXEC (@insertStmt + '(1, ''Jabez'', ''Male'', ''Computers'', 27, 100)');
EXEC (@insertStmt + '(2, ''Ivor'', ''Male'', ''Tools'', 100, 100)');
EXEC (@insertStmt + '(3, ''Emmye'', ''Female'', ''Grocery'', 72, 100)');
EXEC (@insertStmt + '(4, ''Meghan'', ''Female'', ''Movies'', 87, 100)');
EXEC (@insertStmt + '(5, ''Crystie'', ''Female'', ''Tools'', 12, 100)');
EXEC (@insertStmt + '(6, ''Curry'', ''Male'', ''Baby'', 86, 100)');