IF OBJECT_ID('Logs') IS NOT NULL
    DROP TABLE Logs

Create table Logs (id int, num int)
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')
    
WITH Counts AS (
    SELECT num, 
        LEAD(num) OVER (ORDER BY id ASC) AS n_num,
        LAG(num) OVER (ORDER BY id ASC) AS p_num
    FROM Logs
) SELECT DISTINCT num AS ConsecutiveNums 
FROM Counts
WHERE p_num = num AND n_num = num