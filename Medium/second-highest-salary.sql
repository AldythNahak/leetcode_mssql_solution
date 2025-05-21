IF OBJECT_ID('Employee') IS NOT NULL
    DROP TABLE Employee

Create table Employee (id int, salary int)
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')

DECLARE @secondSalary INT;
SET @secondSalary = (SELECT TOP 1 CASE 
    WHEN a.salary = (SELECT MAX(salary) FROM Employee) THEN NULL
    ELSE a.salary
END AS SecondHighestSalary 
FROM (
    SELECT DISTINCT TOP 2 salary
    FROM Employee
    ORDER BY salary DESC
) AS a
ORDER BY a.salary ASC)

IF @secondSalary IS NULL
    SELECT NULL AS SecondHighestSalary
ELSE
    SELECT @secondSalary AS SecondHighestSalary
