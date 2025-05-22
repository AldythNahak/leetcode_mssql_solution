IF OBJECT_ID('Insurance') IS NOT NULL
BEGIN
    DROP TABLE Insurance
END


Create Table Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float)
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20')
insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40')


SELECT ROUND(CAST(SUM(a.tiv_2016) AS FLOAT), 2) AS tiv_2016
FROM Insurance AS a
RIGHT JOIN (
	SELECT tiv_2015, COUNT(*) AS total_p
	FROM Insurance
	GROUP BY tiv_2015
	HAVING COUNT(*) > 1 
) AS b
ON a.tiv_2015 = b.tiv_2015
RIGHT JOIN (
	SELECT lat, lon, COUNT(*) AS total
	FROM Insurance
	GROUP BY lat, lon
	HAVING COUNT(*) = 1
) AS c
ON a.lat = c.lat AND a.lon = c.lon