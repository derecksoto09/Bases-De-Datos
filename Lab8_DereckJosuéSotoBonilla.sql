--Laboratorio 8 de Dereck Josué Soto Bonilla

USE Northwind
GO

--1. Cree un procedimiento para insertar registros en la tabla Employees utilizando los campos, LastName, FirstName, Title, Address, City
CREATE PROCEDURE SP_InsertarEmpleado
    @LastName VARCHAR(50),
    @FirstName VARCHAR(50),
    @Title VARCHAR(50),
    @Address VARCHAR(50),
    @City VARCHAR(50)
AS
INSERT INTO Employees(LastName, FirstName, Title, Address, City)
VALUES (@LastName, @FirstName, @Title, @Address, @City)
GO

--2. Ejecute 5 veces el procedimiento de insertar (En el campo City envíe provincias de CR, al menos 2 deben ser Heredia) adjunte captura
EXEC SP_InsertarEmpleado 'Martinez', 'Ana', 'Manager', '123 Main St', 'San Jose'
GO
EXEC SP_InsertarEmpleado 'Gonzalez', 'Luis', 'Sales Rep', '456 Elm St', 'Heredia';
GO
EXEC SP_InsertarEmpleado 'Rojas', 'Maria', 'Analyst', '789 Oak St', 'Heredia';
GO
EXEC SP_InsertarEmpleado 'Castro', 'Juan', 'Engineer', '321 Pine St', 'Alajuela';
GO
EXEC SP_InsertarEmpleado 'Sanchez', 'Laura', 'Assistant', '654 Maple St', 'Cartago';
GO

SELECT *
FROM Employees
GO

--3. Cree un procedimiento para editar registros donde el campo City sea Heredia, actualice el campo Title por DBA. adjunte captura
CREATE PROCEDURE SP_CityHeredia
AS
UPDATE Employees
SET Title = 'DBA'
WHERE City = 'Heredia';
GO

EXEC SP_CityHeredia
GO

SELECT *
FROM Employees
GO

--4. Cree un procedimiento para eliminar registros en la tabla Employees donde el campo City sea Heredia, agregue el conteo de registros ROWCOUNT adjunte captura
CREATE PROCEDURE SP_EliminarEmpelados (@City VARCHAR (50), @FILAS INT OUTPUT)
AS
DELETE FROM Employees
WHERE City = @City
SET @FILAS = @@ROWCOUNT
GO

DECLARE @DATOS INT
EXEC SP_EliminarEmpelados 'Heredia', @DATOS OUTPUT
SELECT @DATOS AS BORRADOS
GO

--5. Cree un procedimiento para consultar las tablas ORDERS, [ORDER DETAILS], PRODUCTS 
--debe incluir los campos CUSTOMERID,  ORDERID, ORDDERDATE, 
--PRODUCTNAME, UNITPRICE, QUANTITY adjunte captura
CREATE PROCEDURE SP_ConsultarOrdenes
AS
SELECT O.CustomerID, O.OrderID, O.OrderDate, 
        P.ProductName, OD.UnitPrice, OD.Quantity
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID;
GO

EXEC SP_ConsultarOrdenes
GO

--6. Cree una función que calcule un descuento del 10% para la tabla [ORDER DETAILS], 
--deberá mostrarlo en un select que llame la función, utilice el alias descuento para mostrarlo en pantalla, adjunte captura
CREATE FUNCTION FN_CalcularDescuento (@UnitPrice MONEY, @Quantity INT)
RETURNS MONEY
AS
BEGIN
	DECLARE @DESCUENTO MONEY
	SET @DESCUENTO = (@UnitPrice * @Quantity) * 0.10
    RETURN @DESCUENTO
END
GO

SELECT  OrderID, ProductID, UnitPrice, Quantity, DBO.FN_CalcularDescuento(UnitPrice, Quantity) AS Descuento
FROM [Order Details]
GO

--7. Encripte las funciones y Procedimientos creados.
ALTER PROCEDURE SP_InsertarEmpleado
    @LastName VARCHAR(50),
    @FirstName VARCHAR(50),
    @Title VARCHAR(50),
    @Address VARCHAR(50),
    @City VARCHAR(50)
WITH ENCRYPTION
AS
INSERT INTO Employees(LastName, FirstName, Title, Address, City)
VALUES (@LastName, @FirstName, @Title, @Address, @City)
GO

ALTER PROCEDURE SP_CityHeredia
WITH ENCRYPTION
AS
UPDATE Employees
SET Title = 'DBA'
WHERE City = 'Heredia';
GO

ALTER PROCEDURE SP_EliminarEmpelados (@City VARCHAR (50), @FILAS INT OUTPUT)
WITH ENCRYPTION
AS
DELETE FROM Employees
WHERE City = @City
SET @FILAS = @@ROWCOUNT
GO

ALTER PROCEDURE SP_ConsultarOrdenes
WITH ENCRYPTION
AS
SELECT O.CustomerID, O.OrderID, O.OrderDate, 
        P.ProductName, OD.UnitPrice, OD.Quantity
FROM Orders AS O
INNER JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID
INNER JOIN Products AS P ON OD.ProductID = P.ProductID;
GO

ALTER FUNCTION FN_CalcularDescuento (@UnitPrice MONEY, @Quantity INT)
RETURNS MONEY
WITH ENCRYPTION
AS
BEGIN
	DECLARE @DESCUENTO MONEY
	SET @DESCUENTO = (@UnitPrice * @Quantity) * 0.10
    RETURN @DESCUENTO
END
GO

--8. Ejecute el sp que da el script que genera los objetos para validar encriptado, adjunte captura 
SP_HELPTEXT SP_InsertarEmpleado
GO

SP_HELPTEXT SP_CityHeredia
GO

SP_HELPTEXT SP_EliminarEmpelados
GO

SP_HELPTEXT SP_ConsultarOrdenes
GO

SP_HELPTEXT FN_CalcularDescuento
GO

--9. Adjunte el archivo sql con el nombre Lab8NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab8NOMBRE_ESTUDIANTE.pdf 