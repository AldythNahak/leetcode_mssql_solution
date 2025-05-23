IF OBJECT_ID('Weather') IS NOT NULL
BEGIN
    DROP TABLE Weather
END

Create table Weather (id int, recordDate date, temperature int)
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')

WITH collectTemp AS (
	SELECT id, recordDate, temperature, LEAD(temperature) OVER(ORDER BY recordDate DESC) AS n_temp, 
		LEAD(recordDate) OVER(ORDER BY recordDate DESC) AS n_record_date
	FROM Weather
) SELECT id FROM collectTemp
WHERE temperature > n_temp AND DATEDIFF(DAY,n_record_date, recordDate) = 1
ORDER BY id ASC