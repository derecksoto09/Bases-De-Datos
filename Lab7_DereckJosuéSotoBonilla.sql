--Laboratorio 7 de Dereck Josué Soto Bonilla

--Utilice la base de datos Northwind
USE Northwind
GO

--1. cree la vista, View_Ventas2 utilizando las siguientes tablas
--    -Orders (order id, Employee id, shipname)
--    -Order Details (product id)
--    -products (category id)
--    -Categories (categoryname, description)

CREATE VIEW View_Ventas2
AS
SELECT O.OrderID, O.EmployeeID, O.ShipName,
OD.ProductID,
P.CategoryID,
C.CategoryName, C.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS C ON C.CategoryID = P.CategoryID
GO

--2. Consulte la vista, adjunte captura
SELECT *
FROM View_Ventas2
GO

--3. Agregue alias a la vista en español
ALTER VIEW View_Ventas2 (CodigoOrden, CodigoEmpleado, NombreEnvio, CodigoProducto, CodigoCategoria, NombreCategoria, DescripcionCategoria)
AS
SELECT O.OrderID, O.EmployeeID, O.ShipName,
OD.ProductID,
P.CategoryID,
C.CategoryName, C.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS C ON C.CategoryID = P.CategoryID
GO

--4. Consulte la vista, adjunte captura
SELECT *
FROM View_Ventas2
GO

--5. Ejecute el SP que muestra el script que origina la vista, adjunte captura
SP_HELPTEXT View_Ventas2
GO

--6. Encripte el SP, adjunte mensaje del objeto encriptado
ALTER VIEW View_Ventas2 (CodigoOrden, CodigoEmpleado, NombrePedido, CodigoProducto, CodigoCategoria, NombreCategoria, DescripcionCategoria)
WITH ENCRYPTION 
AS
SELECT O.OrderID, O.EmployeeID, O.ShipName,
OD.ProductID,
P.CategoryID,
C.CategoryName, C.Description
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID
INNER JOIN Categories AS C ON C.CategoryID = P.CategoryID
GO

SP_HELPTEXT View_Ventas2
GO

--7. Modifique la consulta, agregue un schemabinding
ALTER VIEW View_Ventas2 (CodigoOrden, CodigoEmpleado, NombrePedido, CodigoProducto, CodigoCategoria, NombreCategoria, DescripcionCategoria)
WITH ENCRYPTION, SCHEMABINDING 
AS
SELECT O.OrderID, O.EmployeeID, O.ShipName,
OD.ProductID,
P.CategoryID,
C.CategoryName, C.Description
FROM DBO.Orders AS O
INNER JOIN DBO.[Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN DBO.Products AS P ON OD.ProductID = P.ProductID
INNER JOIN DBO.Categories AS C ON C.CategoryID = P.CategoryID
GO

--8. Ejecute un drop table, adjunte captura.
DROP TABLE [Order Details]
GO

--9. Cree una vista de la tabla customers CUSTOMERID, COMPANYNAME, CONTACTNAME, CONTACTTITLE, COUNTRY usando el CHECK OPTION para el país Mexico
CREATE VIEW View_CostumersMexico
AS
SELECT CustomerID, CompanyName, ContactName, ContactTitle, Country
FROM Customers
WHERE Country = 'Mexico'
WITH CHECK OPTION 
GO

--10. Realice un insert a la vista con datos válidos, adjunte captura
INSERT INTO View_CostumersMexico (CustomerID, CompanyName, ContactName, ContactTitle, Country)
VALUES
	('ZZ42N', 'Farmacia Olivo', 'Paula Flores', 'Sales', 'Mexico')
GO

SELECT *
FROM View_CostumersMexico
GO 

--11. Realice un insert a la vista con datos inválidos, adjunte captura
INSERT INTO View_CostumersMexico (CustomerID, CompanyName, ContactName, ContactTitle, Country)
VALUES
	('TG48L', 'Restaurante Vivo', 'Dereck Soto', 'Sales', 'USA')
GO

--12. Adjunte el archivo sql con el nombre Lab7NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab7NOMBRE_ESTUDIANTE.pdf 