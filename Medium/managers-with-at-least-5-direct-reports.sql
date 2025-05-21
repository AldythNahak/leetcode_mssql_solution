IF OBJECT_ID('Employee') IS NOT NULL
BEGIN
    DROP TABLE Employee
END

Create table Employee (id int, name varchar(255), department varchar(255), managerId int)
insert into Employee (id, name, department, managerId) values ('101', 'John', 'A', NULL)
insert into Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101')
insert into Employee (id, name, department, managerId) values ('103', 'James', 'A', '101')
insert into Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101')
insert into Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101')
insert into Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101')


WITH dirReport AS ( 
	SELECT managerId, COUNT(*) AS total 
	FROM Employee
	GROUP BY managerId
	HAVING COUNT(*) >= 5
) SELECT name
FROM Employee
WHERE id IN (SELECT DISTINCT managerId FROM dirReport)