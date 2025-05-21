IF OBJECT_ID('Person') IS NOT NULL
    DROP TABLE Person

Create table Person (id int, email varchar(255))
insert into Person (id, email) values ('1', 'a@b.com')
insert into Person (id, email) values ('2', 'c@d.com')
insert into Person (id, email) values ('3', 'a@b.com')

;WITH dupEmail AS (
	SELECT email AS Email, count(*) AS total
	FROM Person
	GROUP BY email
	HAVING count(*) > 1
) SELECT email FROM dupEmail
