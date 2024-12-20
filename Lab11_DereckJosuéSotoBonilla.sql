--Laboratorio 11 de Dereck Josué Soto Bonilla

--1. Cree la base datos transacciones TD
CREATE DATABASE TransaccionesTD
GO

USE TransaccionesTD
GO

--3. Cree la tabla cliente: id cliente, nombre cliente, num tarjeta, saldo disponible), establezca relaciones de PK y FK según corresponda
CREATE TABLE Cliente (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    NombreCliente VARCHAR(100) NOT NULL,
    NumTarjeta VARCHAR(100) NOT NULL,
    SaldoDisponible DECIMAL(18,2) NOT NULL
);
GO}

--2. Cree la tabla movimientos: id transacción, id cliente, tipo de transacción (1,2,3), monto transacción
CREATE TABLE Movimientos (
    IdTransaccion INT IDENTITY(1,1) PRIMARY KEY,
    IdCliente INT NOT NULL,
    TipoTransaccion INT NOT NULL, -- 1: Compra, 2: Reversión, 3: Depósito
    MontoTransaccion DECIMAL(18,2) NOT NULL,
    CONSTRAINT FK_Movimientos_Cliente FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente)
);
GO

--4. Inserte 4 clientes, donde todos los clientes tengan 100,000 de disponible
INSERT INTO Cliente
VALUES 
    ('Dereck Soto', '1234-5678-9012-3456', 100000),
    ('Allan Soto', '2345-6789-0123-4567', 100000),
    ('Mathias Soto', '3456-7890-1234-5678', 100000),
    ('Isaac Soto', '4567-8901-2345-6789', 100000);
GO

--deberá crear adicional una función que cobre un 2% de comisión
CREATE FUNCTION DBO.FN_CalcularComision (@Monto DECIMAL(18,2))
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN @Monto * 0.02;
END;
GO

--5. Cree un procedimiento almacenado utilizando transacciones explícitas (recibe parámetros) que realice lo siguiente
CREATE PROCEDURE SP_TipoMovimiento
    @IdCliente INT,
    @TipoTransaccion INT,
    @MontoTransaccion DECIMAL(18,2)
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY

        --    a. Inserte en la tabla movimientos la transacción realizada
        INSERT INTO Movimientos (IdCliente, TipoTransaccion, MontoTransaccion)
        VALUES (@IdCliente, @TipoTransaccion, @MontoTransaccion);

        DECLARE @SaldoActual DECIMAL(18,2),
			    @SaldoNuevo DECIMAL(18,2);

        SELECT @SaldoActual = SaldoDisponible 
		FROM cliente 
		WHERE IdCliente = @IdCliente;

--    b. valide lo siguiente:
--        -si el tipo de movimiento es 1 es una compra, debe restarse el saldo
--        -en el caso de la compra deberá realizar una validación del saldo disponible, si el monto es mayor al disponible, este deberá indicar 
--		  -que no hay fondos suficientes y realizar la anulación correspondiente 
        IF @TipoTransaccion = 1
			BEGIN
				IF @MontoTransaccion > @SaldoActual
					BEGIN
						RAISERROR ('Fondos insuficientes. Transacción anulada.', 16, 1);
						ROLLBACK TRANSACTION;
						RETURN;
					END
				SET @SaldoNuevo = @SaldoActual - @MontoTransaccion;
			END

--        -si el tipo de movimiento es 2 es una reversión, debe aumentar el saldo
        ELSE IF @TipoTransaccion = 2
			BEGIN
				SET @SaldoNuevo = @SaldoActual + @MontoTransaccion;
			END

--        -si el tipo de movimiento es 3 es una depósito, debe aumentar el saldo, deberá crear adicional una función que cobre un 2% de comisión
        ELSE IF @TipoTransaccion = 3
			BEGIN
				DECLARE @Comision DECIMAL(18,2) = DBO.FN_CalcularComision(@MontoTransaccion);
				SET @SaldoNuevo = @SaldoActual + @MontoTransaccion - @Comision;
			END

        UPDATE Cliente
        SET SaldoDisponible = @SaldoNuevo
        WHERE IdCliente = @IdCliente;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH;
END;

--6. Ejecute el procedimiento almacenado con los 3 diferentes tipos de movimientos, deberá adjuntar capturas de los resultados en base de datos, 
--donde se muestren los saldos según el tipo de movimiento realizado, ejecute una transacción donde el saldo sea mayor, adjunte captura.

EXEC SP_TipoMovimiento @IdCliente = 1, @TipoTransaccion = 1, @MontoTransaccion = 50000;
EXEC SP_TipoMovimiento @IdCliente = 2, @TipoTransaccion = 2, @MontoTransaccion = 20000;
EXEC SP_TipoMovimiento @IdCliente = 3, @TipoTransaccion = 3, @MontoTransaccion = 30000;

SELECT * FROM Movimientos;
SELECT * FROM Cliente;

EXEC SP_TipoMovimiento @IdCliente = 4, @TipoTransaccion = 1, @MontoTransaccion = 150000;



--7. Recuerde confirmar o descartar las transacciones según corresponda
--8. Adjunte el archivo sql con el nombre Lab11NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab11NOMBRE_ESTUDIANTE.pdf