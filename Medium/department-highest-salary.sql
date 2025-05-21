IF OBJECT_ID('Employee') IS NOT NULL
    DROP TABLE Employee

IF OBJECT_ID('Department') IS NOT NULL
    DROP TABLE Department

Create table Employee (id int, name varchar(255), salary int, departmentId int)
Create table Department (id int, name varchar(255))
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')


;WITH maxSalary AS (
	SELECT a.departmentId, b.name AS departmentName, MAX(a.salary) AS max_salary
	FROM Employee AS a
	LEFT JOIN Department AS b
	ON a.departmentId = b.id
	GROUP BY a.departmentId, b.name
) SELECT b.departmentName AS Department, a.name AS Employee, b.max_salary AS Salary
FROM Employee AS a
RIGHT JOIN maxSalary AS b
ON a.departmentId = b.departmentId AND a.salary = b.max_salary
ORDER BY a.id ASC