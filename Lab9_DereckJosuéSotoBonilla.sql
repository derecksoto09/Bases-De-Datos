--Laboratorio 9 de Dereck Josué Soto Bonilla

--1. Cree una nueva base de datos llamada ControlInventario.
CREATE DATABASE ControlInventario
GO

--2. Cree dos tablas en la base de datos ControlInventario:
USE ControlInventario
GO

--Inventario: Contiene información sobre los productos en stock, incluyendo un identificador único para cada producto, su nombre y la cantidad disponible, precio del artículo
CREATE TABLE Inventario (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    NombreProducto NVARCHAR(100),
    CantidadDisponible INT,
    Precio DECIMAL(10, 2)
)
GO

--Ventas: Contiene información sobre las ventas, incluyendo un identificador único para cada venta, id cliente, el producto vendido y la cantidad vendida.
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    IdCliente INT,
    IdProducto INT,
    CantidadVendida INT,
    CONSTRAINT FK_Ventas_Inventario FOREIGN KEY (IdProducto) REFERENCES Inventario(IdProducto)
)
GO

--3.Desarrollar un trigger llamado Tr_ControlVentas que se dispare automáticamente cada vez que se registre una nueva venta en la tabla Ventas.
--4.El trigger Tr_ControlVentas debe realizar las siguientes acciones:
CREATE TRIGGER Tr_ControlVentas
ON Ventas AFTER INSERT
AS
BEGIN
    DECLARE @IdProducto INT,
    @CantidadVendida INT,
    @CantidadDisponible INT;

    SELECT @IdProducto = IdProducto, @CantidadVendida = CantidadVendida FROM inserted;

	--Verificar la cantidad disponible del producto antes de la venta
	SELECT @CantidadDisponible = CantidadDisponible
    FROM Inventario
    WHERE IdProducto = @IdProducto;

	--Deberá realizar el select previo mostrando las unidades disponibles antes del insert de la venta, adjunte captura 
    SELECT NombreProducto, CantidadDisponible
    FROM Inventario
    WHERE IdProducto = 3;

    --Verificar que haya suficientes existencias del producto antes de realizar la venta. Si la cantidad 
	--vendida es mayor que la cantidad disponible en el inventario, la venta no debe registrarse y se debe mostrar un mensaje de error. Parte de investigar :)
    SELECT @CantidadDisponible = CantidadDisponible 
	FROM Inventario
	WHERE IDProducto = @IdProducto

	IF @CantidadDisponible >= @CantidadVendida
		BEGIN
			--Restar la cantidad vendida del producto correspondiente en la tabla Inventario.
			UPDATE Inventario
			SET CantidadDisponible = CantidadDisponible - @CantidadVendida
			WHERE IdProducto = @IdProducto;

			--Deberá realizar el select posterior mostrando las unidades disponibles después del insert de la venta, adjunte captura 
			SELECT NombreProducto, CantidadDisponible 
			FROM Inventario 
			WHERE IdProducto = 4;
		END
    ELSE
		BEGIN
			-- Mostrar mensaje de error si no hay suficiente inventario y deshacer la venta
			PRINT 'Error: No hay suficientes existencias para realizar la venta.';
			ROLLBACK;
		END
END
GO

INSERT INTO Inventario (NombreProducto, CantidadDisponible, Precio)
VALUES 
	('Laptop Dell',48,1000000),
	('Mouse Dell',15,50000);
GO

INSERT INTO Ventas (IDCliente, IdProducto, CantidadVendida)
VALUES
	(1,3,2),
	(2,4,5);
GO

--Realice un insert donde la venta supere el monto disponible en el inventario, adjunte captura
INSERT INTO Ventas (IDCliente, IdProducto, CantidadVendida)
VALUES
	(3,4,20);
GO

--5. Adjunte el archivo sql con el nombre Lab9NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab9NOMBRE_ESTUDIANTE.pdf 