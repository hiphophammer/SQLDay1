--All scenarios are based on Database NORTHWND.
USE Northwind
GO

--1.      List all cities that have both Employees and Customers.
SELECT DISTINCT c.City
FROM Customers AS c INNER JOIN Employees AS e ON c.City = e.City

--2.      List all cities that have Customers but no Employee.
  --a.      Use sub-query
  SELECT DISTINCT City
  FROM Customers
  WHERE City NOT IN ( SELECT DISTINCT City FROM Employees )

  --b.      Do not use sub-query
  SELECT DISTINCT c.City
  FROM Customers AS c LEFT JOIN Employees AS e ON c.City = e.City
  WHERE e.City IS NULL

--3.      List all products and their total order quantities throughout all orders.
SELECT quantity.ProductID, p.ProductName, quantity.TotalOrderQuantities
FROM 
( SELECT ProductID, SUM(Quantity) AS TotalOrderQuantities
FROM [Order Details]
GROUP BY ProductID
) AS quantity
LEFT JOIN
Products p ON quantity.ProductID = p.ProductID
ORDER BY ProductID

--4.      List all Customer Cities and total products ordered by that city.
SELECT c.City AS City, SUM(od.Quantity) AS TotalProductsOrdered
FROM
Customers AS c
INNER JOIN
Orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN
[Order Details] AS od ON od.OrderID = o.OrderID
GROUP BY c.City
ORDER BY c.City

--5.      List all Customer Cities that have at least two customers.
  SELECT TOP 5 *
  FROM Customers

  --a.      Use union

  --b.      Use sub-query and no union

--6.      List all Customer Cities that have ordered at least two different kinds of products.

--7.      List all Customers who have ordered products, but have the ¡®ship city¡¯ on the order different from their own customer cities.

--8.      List 5 most popular products, their average price, and the customer city that ordered most quantity of it.

--9.      List all cities that have never ordered something but we have employees there.
  --a.      Use sub-query
  --b.      Do not use sub-query

--10.  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)

--11. How do you remove the duplicates record of a table?