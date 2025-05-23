IF OBJECT_ID('Activity') IS NOT NULL
BEGIN
    DROP TABLE Activity
END

Create table Activity (player_id int, device_id int, event_date date, games_played int)
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
insert into Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')

DECLARE @total_player INT
SET @total_player = (SELECT COUNT(DISTINCT player_id) FROM Activity)

;WITH logActivity AS (
	SELECT DISTINCT player_id, LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date ASC) AS n_date
	FROM Activity
	GROUP BY player_id, event_date
) 
SELECT ROUND(1 * (CAST(COUNT(DISTINCT a.player_id) AS FLOAT) / CAST(@total_player AS FLOAT)), 2) AS fraction 
FROM logActivity AS a
LEFT JOIN (
	SELECT player_id, MIN(event_date) AS first_date_login
	FROM Activity
	GROUP BY player_id
) AS b
ON a.player_id = b.player_id
WHERE a.n_date IS NOT NULL AND DATEDIFF(DAY, b.first_date_login, n_date) < 2
