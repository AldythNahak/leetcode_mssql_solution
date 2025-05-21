/* Write your T-SQL query statement below */
WITH Counts AS (
    SELECT num, 
        LEAD(num) OVER (ORDER BY id ASC) AS n_num,
        LAG(num) OVER (ORDER BY id ASC) AS p_num
    FROM Logs
) SELECT num AS ConsecutiveNums 
FROM Counts
WHERE p_num = num AND n_num = num