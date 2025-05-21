IF OBJECT_ID('Employee') IS NOT NULL
BEGIN
    DROP TABLE Employee
END
    

IF OBJECT_ID('Department') IS NOT NULL
BEGIN
    DROP TABLE Department
END
    
Create table Employee (id int, name varchar(255), salary int, departmentId int)
Create table Department (id int, name varchar(255))
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1')
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1')
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1')
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')


;WITH maxSalary AS (
	SELECT DENSE_RANK() OVER (PARTITION BY a.departmentId ORDER BY a.salary DESC) AS ranks, a.departmentId, b.name AS departmentName, a.salary AS max_salary
	FROM Employee AS a
	LEFT JOIN Department AS b
	ON a.departmentId = b.id
) SELECT DISTINCT b.departmentName AS Department, a.name AS Employee, b.max_salary AS Salary
FROM Employee AS a
RIGHT JOIN maxSalary AS b
ON a.departmentId = b.departmentId AND a.salary = b.max_salary and b.ranks <= 3
WHERE b.ranks <= 3