IF OBJECT_ID('Customers') IS NOT NULL
    DROP TABLE Customers

IF OBJECT_ID('Orders') IS NOT NULL
    DROP TABLE Orders

Create table Customers (id int, name varchar(255))
Create table Orders (id int, customerId int)
insert into Customers (id, name) values ('1', 'Joe')
insert into Customers (id, name) values ('2', 'Henry')
insert into Customers (id, name) values ('3', 'Sam')
insert into Customers (id, name) values ('4', 'Max')
insert into Orders (id, customerId) values ('1', '3')
insert into Orders (id, customerId) values ('2', '1')

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (SELECT DISTINCT customerId FROM Orders)