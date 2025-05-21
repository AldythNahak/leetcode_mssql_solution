CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @nHighestSalary INT;
    
    SET @nHighestSalary = (
        SELECT a.salary 
        FROM (
            SELECT DISTINCT ROW_NUMBER() OVER(ORDER BY salary DESC) AS orders, salary 
            FROM Employee
        ) AS a
        WHERE orders = @N
    )

    RETURN (
        @nHighestSalary    
    );
END