IF OBJECT_ID('RequestAccepted') IS NOT NULL
BEGIN
    DROP TABLE RequestAccepted
END

Create table RequestAccepted (requester_id int not null, accepter_id int null, accept_date date null)
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')

;WITH friends AS (
	SELECT requester_id AS id, COUNT(*) AS TOTAL
	FROM RequestAccepted
	GROUP BY requester_id
	UNION ALL
	SELECT accepter_id AS id, COUNT(*) AS TOTAL
	FROM RequestAccepted
	GROUP BY accepter_id
) SELECT TOP 1 id, SUM(total) AS num
FROM friends
GROUP BY id
ORDER BY SUM(total) DESC