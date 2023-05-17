CREATE TABLE Grades(
  [Student] VARCHAR(50),
  [Subject] VARCHAR(50),
  [Marks]   INT
)
GO
 
INSERT INTO Grades VALUES 
('Jacob','Mathematics',100),
('Jacob','Science',95),
('Jacob','Geography',90),
('Amilee','Mathematics',90),
('Amilee','Science',90),
('Amilee','Geography',100)
GO
-- Pivot Statement to make the 3 subjects as Columns
SELECT * FROM (
  SELECT
    [Student],
    [Subject],
    [Marks]
  FROM Grades
) StudentResults
PIVOT (
  SUM([Marks])
  FOR [Subject]
  IN (
    [Mathematics],
    [Science],
    [Geography]
  )
) AS PivotTable
GO

-- Student       Mathematics       Science    Geography
-- Amilee          90                  90          100
-- Jacob           100                 95          90

-- Azure syntax to Select the Student with the highest TotalMarks
SELECT TOP 1 Student, SUM(Marks) AS TotalMarks
FROM Grades
GROUP BY Student
ORDER BY TotalMarks DESC;