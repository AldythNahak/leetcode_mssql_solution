IF OBJECT_ID('Person') IS NOT NULL
BEGIN
    DROP TABLE Person
END

Create table Person (Id int, Email varchar(255))
insert into Person (id, email) values ('1', 'john@example.com')
insert into Person (id, email) values ('2', 'bob@example.com')
insert into Person (id, email) values ('3', 'john@example.com')

WITH rankDuplicate AS (
	SELECT DENSE_RANK() OVER (PARTITION BY email ORDER BY id ASC) AS ranks, * 
	FROM (
		SELECT id, email, LEAD(email) OVER (ORDER BY email ASC) AS n_email,  LAG(email) OVER (ORDER BY email ASC) AS p_email
		FROM Person
	) as a
	WHERE email = n_email OR email = p_email
)
DELETE FROM Person
WHERE id IN (SELECT DISTINCT id FROM rankDuplicate WHERE ranks > 1)