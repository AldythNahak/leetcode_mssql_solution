IF OBJECT_ID('Employee') IS NOT NULL
    DROP TABLE Employee

Create table Employee (id int, name varchar(255), salary int, managerId int)
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

SELECT a.name AS Employee
FROM Employee AS a
INNER JOIN Employee AS b
ON a.managerID = b.id
WHERE a.salary > b.salary
