IF OBJECT_ID('Trips') IS NOT NULL
BEGIN
    DROP TABLE Trips
END

IF OBJECT_ID('Users') IS NOT NULL
BEGIN
    DROP TABLE Users
END

CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(25) CHECK (status IN ('completed', 'cancelled_by_driver', 'cancelled_by_client')),
    request_at VARCHAR(50)
);

CREATE TABLE Users (
    users_id INT,
    banned VARCHAR(50),
    role VARCHAR(10) CHECK (role IN ('client', 'driver', 'partner'))
);

insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03')
insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03')
insert into Users (users_id, banned, role) values ('1', 'No', 'client')
insert into Users (users_id, banned, role) values ('2', 'Yes', 'client')
insert into Users (users_id, banned, role) values ('3', 'No', 'client')
insert into Users (users_id, banned, role) values ('4', 'No', 'client')
insert into Users (users_id, banned, role) values ('10', 'No', 'driver')
insert into Users (users_id, banned, role) values ('11', 'No', 'driver')
insert into Users (users_id, banned, role) values ('12', 'No', 'driver')
insert into Users (users_id, banned, role) values ('13', 'No', 'driver')



;WITH collectSolidTrips AS (
	SELECT a.request_at, CASE
		WHEN a.status != 'completed' THEN 'canceled'
		ELSE a.status
	END AS status, COUNT(a.status) AS total
	FROM Trips AS a
	LEFT JOIN Users AS b
		ON a.client_id = b.users_id
	LEFT JOIN users AS c
		ON a.driver_id = c.users_id
	WHERE a.request_at BETWEEN '2013-10-01' AND '2013-10-03' AND (b.banned = 'No' AND  c.banned = 'No')
	GROUP BY a.request_at, CASE
		WHEN a.status != 'completed' THEN 'canceled'
		ELSE a.status
	END
) SELECT t.request_at AS [Day], ROUND(1 * (CAST(SUM(t.t_c) AS FLOAT) / CAST((SUM(t.t_s) + SUM(t.t_c)) AS FLOAT)), 2) AS [Cancellation Rate]  
FROM (
	SELECT request_at, 0 AS t_s, total AS t_c FROM collectSolidTrips WHERE status = 'canceled'
	UNION ALL
	SELECT request_at, total AS t_s, 0 AS tc FROM collectSolidTrips WHERE status = 'completed'
) AS t
GROUP BY t.request_at
ORDER BY t.request_at ASC