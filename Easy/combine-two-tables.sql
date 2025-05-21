IF OBJECT_ID('Person') IS NOT NULL
    DROP TABLE Person

IF OBJECT_ID('Person') IS NOT NULL
    DROP TABLE Address

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')


SELECT a.firstName, a.lastName , b.city, b.state
FROM Person AS a
LEFT JOIN Address AS b
ON a.personId = b.personId