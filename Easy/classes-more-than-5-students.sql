IF OBJECT_ID('Courses') IS NOT NULL
BEGIN
    DROP TABLE Courses
END

Create table Courses (student varchar(255), class varchar(255))
insert into Courses (student, class) values ('A', 'Math')
insert into Courses (student, class) values ('B', 'English')
insert into Courses (student, class) values ('C', 'Math')
insert into Courses (student, class) values ('D', 'Biology')
insert into Courses (student, class) values ('E', 'Math')
insert into Courses (student, class) values ('F', 'Computer')
insert into Courses (student, class) values ('G', 'Math')
insert into Courses (student, class) values ('H', 'Math')
insert into Courses (student, class) values ('I', 'Math')

WITH listClass AS (
	SELECT class, COUNT(*) AS total
	FROM COURSES
	GROUP BY class
	HAVING COUNT(*) >= 5
) SELECT class FROM listClass
ORDER BY class ASC