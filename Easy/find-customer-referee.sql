IF OBJECT_ID('Customer') IS NOT NULL
BEGIN
    DROP TABLE Customer
END

Create table Customer (id int, name varchar(25), referee_id int)
insert into Customer (id, name, referee_id) values ('1', 'Will', NULL)
insert into Customer (id, name, referee_id) values ('2', 'Jane', NULL)
insert into Customer (id, name, referee_id) values ('3', 'Alex', '2')
insert into Customer (id, name, referee_id) values ('4', 'Bill', NULL)
insert into Customer (id, name, referee_id) values ('5', 'Zack', '1')
insert into Customer (id, name, referee_id) values ('6', 'Mark', '2')

SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2