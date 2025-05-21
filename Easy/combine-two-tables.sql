SELECT a.firstName, a.lastName , b.city, b.state
FROM Person AS a
LEFT JOIN Address AS b
ON a.personId = b.personId