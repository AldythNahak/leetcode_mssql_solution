IF OBJECT_ID('orders') IS NOT NULL
BEGIN
    DROP TABLE orders
END


Create table orders (order_number int, customer_number int)
insert into orders (order_number, customer_number) values ('1', '1')
insert into orders (order_number, customer_number) values ('2', '2')
insert into orders (order_number, customer_number) values ('3', '3')
insert into orders (order_number, customer_number) values ('4', '3')

;WITH collectMaxOrder AS (
	SELECT customer_number, COUNT(customer_number) AS total
	FROM orders
	GROUP BY customer_number
) SELECT TOP 1 customer_number
FROM collectMaxOrder
ORDER BY total DESC