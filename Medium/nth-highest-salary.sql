IF OBJECT_ID('Employee') IS NOT NULL
    DROP TABLE Employee

Create table  Employee (Id int, Salary int)
insert into Employee (id, salary) values ('1', '100')
insert into Employee (id, salary) values ('2', '200')
insert into Employee (id, salary) values ('3', '300')


CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @nHighestSalary INT;

    SET @nHighestSalary = (
        SELECT DISTINCT CASE 
            WHEN @N > 1 AND a.salary = (SELECT MAX(salary) FROM Employee) THEN NULL
            ELSE a.salary
        END AS nHighestSalary
        FROM (
            SELECT DISTINCT ROW_NUMBER() OVER(ORDER BY s.salary DESC) AS orders, s.salary 
            FROM (SELECT DISTINCT salary FROM Employee) AS s
        ) AS a
        WHERE orders = @N
    )

    RETURN (
        @nHighestSalary    
    );
END