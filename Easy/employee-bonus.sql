IF OBJECT_ID('Employee') IS NOT NULL
BEGIN
    DROP TABLE Employee
END

IF OBJECT_ID('Bonus') IS NOT NULL
BEGIN
    DROP TABLE Bonus
END

Create table Employee (empId int, name varchar(255), supervisor int, salary int)
Create table Bonus (empId int, bonus int)
insert into Employee (empId, name, supervisor, salary) values ('3', 'Brad', NULL, '4000')
insert into Employee (empId, name, supervisor, salary) values ('1', 'John', '3', '1000')
insert into Employee (empId, name, supervisor, salary) values ('2', 'Dan', '3', '2000')
insert into Employee (empId, name, supervisor, salary) values ('4', 'Thomas', '3', '4000')
insert into Bonus (empId, bonus) values ('2', '500')
insert into Bonus (empId, bonus) values ('4', '2000')

SELECT a.name, b.bonus
FROM Employee AS a
LEFT JOIN Bonus AS b
ON a.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus < 1000