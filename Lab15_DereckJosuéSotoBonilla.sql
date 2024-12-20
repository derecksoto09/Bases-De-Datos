--Laboratorio 14 de Dereck Josué Soto Bonilla

--19 Elimine la base de datos LabFinal adjunte captura
DROP DATABASE LabFinal
GO

--20 Utilice el respaldo .bak que creó en el punto 17 de este laboratorio y haga la restauración del respaldo
RESTORE DATABASE LabFinal 
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\LabFinal.bak'
WITH MOVE 'ClaseF_Log' TO 'C:\ADBD\ClaseF_Log.ldf',
     MOVE 'ClaseF_NDF' TO 'C:\ADBD\ClaseF_NDF.ndf',
	 MOVE 'ClaseF_Primary' TO 'C:\ADBD\ClaseF_Primary.mdf';

--21 Renombre la base de Datos LabFinal por el nombre DisneyPlus
ALTER DATABASE LabFinal MODIFY NAME = DisneyPlus
GO

USE DisneyPlus
GO

--22 A la tabla suscriptores, agregue los campos (correo, password, numero de tarjeta)
ALTER TABLE [PracticaFinal].[Suscriptores] 
ADD Correo NVARCHAR(100),
    Password NVARCHAR(50),
    Num_Tarjeta NVARCHAR(19);
GO

UPDATE PracticaFinal.Suscriptores
SET Correo = 'bailey.jeff@gmail.com',
    Password = '123456',
    Num_Tarjeta = '1111-2222-3333-4444'
WHERE ClienteID = 1;

UPDATE PracticaFinal.Suscriptores
SET Correo = 'mureil.crichmer@hotmail.com',
    Password = 'Mur123456789!',
    Num_Tarjeta = '5555-6666-7777-8888'
WHERE ClienteID = 2;

UPDATE PracticaFinal.Suscriptores
SET Correo = 'kameko.bridewell@gmail.com',
    Password = 'Kamke123',
    Num_Tarjeta = '9999-0000-1111-2222'
WHERE ClienteID = 3;

SELECT *
FROM [PracticaFinal].[Suscriptores]

--23 Haga una vista que muestre la tabla suscriptores encripte el correo (alejandro.serrano2@ulatina.net --> a****@correo.net) y el número de tarjeta (1111-1111-1111-1111 --> 1111-****-****-***1)
ALTER TABLE PracticaFinal.Suscriptores ALTER COLUMN Correo 
	ADD MASKED WITH (FUNCTION = 'partial(1,"****@correo.net",0)');

ALTER TABLE PracticaFinal.Suscriptores ALTER COLUMN Num_Tarjeta 
	ADD MASKED WITH (FUNCTION = 'partial(4,"-****-****-***",1)');

CREATE VIEW VW_Suscriptores_Encriptados
AS
SELECT *
FROM PracticaFinal.Suscriptores
GO

CREATE USER UserTest1 WITHOUT LOGIN;
GO

GRANT SELECT ON PracticaFinal.Suscriptores TO UserTest1;
GRANT SELECT ON VW_Suscriptores_Encriptados TO UserTest1;
GO


EXECUTE ('SELECT * FROM VW_Suscriptores_Encriptados') AS USER = 'UserTest1';
REVERT;
GO

--24 Cree una tabla llamada facturas la cual registra los pagos mensuales de los suscriptores, haga las relaciones de PK y FK con las tablas existentes, según corresponda
CREATE TABLE PracticaFinal.Facturas 
(
    IdFactura INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
    ClienteID INT,
    FechaPago DATE,
	MontoPago DECIMAL (10,2),
	MetodoPago NVARCHAR (50),
	CONSTRAINT FK_Facturas_Suscriptores FOREIGN KEY (ClienteID) REFERENCES PracticaFinal.Suscriptores(ClienteID)
);
GO

INSERT INTO PracticaFinal.Facturas 
VALUES
	(1, '2025/12/18', 8, 'Tarjeta'),
	(2, '2025/12/20', 25, 'Sinpe'),
	(3, '2025/12/30', 8, 'Efectivo');
GO

--25 Realice una función que calcule los siguientes impuestos IVA (13%) PANI (1%), modifique la tabla facturas y cree 3 campos nuevos, los dos impuestos y un campo de total (monto suscripción + IVA + PANI), no olvide la nomenclatura de las funciones
ALTER TABLE PracticaFinal.Facturas  
ADD IVA DECIMAL(10, 2),
    PANI DECIMAL(10, 2),
    Total DECIMAL(10, 2);
GO

CREATE FUNCTION DBO.FN_CalcularImpuestos (@MontoPago DECIMAL(10,2))
RETURNS TABLE
AS
RETURN
	(SELECT
        @MontoPago * 0.13 AS IVA,
        @MontoPago * 0.01 AS PANI,
        @MontoPago + (@MontoPago * 0.13) + (@MontoPago * 0.01) AS Total
	);
GO


--26 Cree un trigger after insert que al insertar un suscriptor nuevo, llame a la función que calcula los impuestos e inserte los datos correctamente en la tabla
CREATE TRIGGER Tr_CalculoImpuestos
ON [PracticaFinal].[Suscriptores]
AFTER INSERT
AS
BEGIN
    DECLARE @ClienteID INT,
			@FechaPago DATE,
            @MontoPago DECIMAL(10, 2),
			@MetodoPago NVARCHAR (50),
			@IVA DECIMAL(10, 2),
            @PANI DECIMAL(10, 2),
            @Total DECIMAL(10, 2);

    SELECT @ClienteID = ClienteID FROM inserted;

	SELECT @MontoPago = MontoPago, 
           @MetodoPago = MetodoPago, 
           @FechaPago = FechaPago
    FROM [PracticaFinal].[Facturas]
    WHERE ClienteID = @ClienteID
    AND FechaPago = (SELECT MAX(FechaPago) 
                     FROM [PracticaFinal].[Facturas] 
                     WHERE ClienteID = @ClienteID);

    SELECT 
        @IVA = IVA,
        @PANI = PANI,
        @Total = Total
    FROM dbo.FN_CalcularImpuestos(@MontoPago);

    INSERT INTO [PracticaFinal].[Facturas] (ClienteID, FechaPago, MontoPago, MetodoPago, IVA, PANI, Total)
    VALUES (@ClienteID, @FechaPago, @MontoPago, @MetodoPago, @IVA, @PANI, @Total);
END
GO

--27 Cree un procedimiento almacenado que permita registrar nuevos suscriptores (tome en cuenta que el SP tiene que disparar el trigger)
CREATE PROCEDURE PracticaFinal.SP_RegistrarSuscriptor
    @ClienteID INT,
    @Nombre NVARCHAR(255),
    @PlanAdquirido NVARCHAR(50),
    @CostoMensual INT,
	@Correo NVARCHAR (100),
    @Password NVARCHAR(50),
    @Num_Tarjeta NVARCHAR(19),
	@FechaPago DATE,
    @MontoPago DECIMAL(10, 2),
    @MetodoPago NVARCHAR(50)
AS
BEGIN

    INSERT INTO [PracticaFinal].[Suscriptores] (ClienteID, Nombre, PlanAdquirido, CostoMensual, Correo, Password, Num_Tarjeta)
    VALUES (@ClienteID, @Nombre, @PlanAdquirido, @CostoMensual, @Correo, @Password, @Num_Tarjeta);

    INSERT INTO PracticaFinal.Facturas (ClienteID, FechaPago, MontoPago, MetodoPago)
    VALUES (@ClienteID, @FechaPago, @MontoPago, @MetodoPago);

	--AQUÍ SE EJECUTA EL TRIGGER
END;
GO

--28 Cree una tabla donde se registren las visualizaciones de películas de los suscriptores, deberá relacionarlo con las demás tablas según corresponda
CREATE TABLE PracticaFinal.Visualizaciones
(
    IdVisualizacion INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ClienteID INT,
    PeliculaID INT,
    FechaVisualizacion DATE,
    CONSTRAINT FK_Visualizaciones_Suscriptores FOREIGN KEY (ClienteID) REFERENCES PracticaFinal.Suscriptores(ClienteID),
    CONSTRAINT FK_Visualizaciones_Peliculas FOREIGN KEY (PeliculaID) REFERENCES PracticaFinal.Pelicula(PeliculaID)
);
GO

--29 Utilice la página mockaroo (por ejemplo, puede usar otra) y genere registros para hacer el insert de la siguiente manera
--    - Suscriptor 1, 4 visualizaciones de películas 
--    - Suscriptor 2, 6 visualizaciones de películas 
--    - Suscriptor 3, 8 visualizaciones de películas 
--    - Suscriptor 4, 10 visualizaciones de películas 
--    - Suscriptor 5, 17 visualizaciones de películas 
--Utilice los ID de las 30 películas existentes creados en el punto 9
INSERT INTO PracticaFinal.Visualizaciones
VALUES
    (1, 1, '2025-12-01'),
    (1, 2, '2025-12-02'),
    (1, 3, '2025-12-03'),
    (1, 4, '2025-12-04'),
    (2, 5, '2025-12-05'),
    (2, 6, '2025-12-06'),
    (2, 7, '2025-12-07'),
    (2, 8, '2025-12-08'),
    (2, 9, '2025-12-09'),
    (2, 10, '2025-12-10'),
    (3, 12, '2025-12-12'),
    (3, 13, '2025-12-13'),
    (3, 14, '2025-12-14'),
    (3, 15, '2025-12-15'),
    (3, 16, '2025-12-16'),
    (3, 17, '2025-12-17'),
    (3, 18, '2025-12-18'),
    (3, 19, '2025-12-19'),
    (4, 21, '2025-12-21'),
    (4, 22, '2025-12-22'),
    (4, 23, '2025-12-23'),
    (4, 24, '2025-12-24'),
    (4, 25, '2025-12-25'),
    (4, 26, '2025-12-26'),
    (4, 27, '2025-12-27'),
    (4, 28, '2025-12-28'),
    (4, 29, '2025-12-29'),
    (4, 30, '2025-12-30'),
    (5, 1, '2025-12-01'),
    (5, 2, '2025-12-02'),
    (5, 3, '2025-12-03'),
    (5, 4, '2025-12-04'),
    (5, 5, '2025-12-05'),
    (5, 6, '2025-12-06'),
    (5, 7, '2025-12-07'),
    (5, 8, '2025-12-08'),
    (5, 9, '2025-12-09'),
    (5, 10, '2025-12-10'),
    (5, 11, '2025-12-11'),
    (5, 12, '2025-12-12'),
    (5, 13, '2025-12-13'),
    (5, 14, '2025-12-14'),
    (5, 15, '2025-12-15'),
    (5, 16, '2025-12-16'),
    (5, 17, '2025-12-17');
GO

--30 Cree la tabla descuentos, la cual deberá estar relacionada a la tabla de suscriptores, a la de visualizaciones
CREATE TABLE PracticaFinal.Descuentos
(
    IdDescuento INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ClienteID INT,
	IdVisualizacion INT,
    TotalVisualizaciones INT,
    Descuento DECIMAL(10,2),
    CONSTRAINT FK_Descuentos_Suscriptores FOREIGN KEY (ClienteID) REFERENCES PracticaFinal.Suscriptores(ClienteID),
    CONSTRAINT FK_Descuentos_Visualizaciones FOREIGN KEY (IdVisualizacion) REFERENCES PracticaFinal.Visualizaciones(IdVisualizacion)
);
GO

--31 Cree un procedimiento almacenado que realice al ejecutarse, consulte la tabla de visualizaciones y realice lo siguiente
--    - Si el suscriptor vio menos de 5 películas el descuento es 0
--    - Si el suscriptor vio 6 películas el descuento es 1%
--    - Si el suscriptor vio 9 películas el descuento es 2%
--    - Si el suscriptor vio 12 películas el descuento es 3%
--    - Si el suscriptor vio 15 películas el descuento es 5%
CREATE PROCEDURE PracticaFinal.SP_AsignarDescuento

    @ClienteID INT,
    @IdVisualizacion INT
AS
BEGIN
    DECLARE @TotalVisualizaciones INT,
			@Descuento DECIMAL(10, 2);

    SELECT @TotalVisualizaciones = COUNT(*)
    FROM [PracticaFinal].[Visualizaciones]
    WHERE ClienteID = @ClienteID;

    SET @Descuento = CASE
        WHEN @TotalVisualizaciones < 5 THEN 0           
        WHEN @TotalVisualizaciones = 6 THEN 0.01   
        WHEN @TotalVisualizaciones = 9 THEN 0.02      
        WHEN @TotalVisualizaciones = 12 THEN 0.03    
        WHEN @TotalVisualizaciones = 15 THEN 0.05      
        ELSE 0                       
    END;
    INSERT INTO [PracticaFinal].[Descuentos] (ClienteID, IdVisualizacion, TotalVisualizaciones, Descuento)
    VALUES (@ClienteID, @IdVisualizacion, @TotalVisualizaciones, @Descuento);
END
GO

--32 Adjunte captura de la tabla descuentos después de haber ejecutado el SP
EXEC PracticaFinal.SP_AsignarDescuento  @ClienteID = 5, @IdVisualizacion = 5;
GO

EXEC PracticaFinal.SP_AsignarDescuento  @ClienteID = 2, @IdVisualizacion = 5;
GO

SELECT * 
FROM PracticaFinal.Descuentos;
GO

--33 Adjunte el archivo sql con el nombre Lab15NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab15NOMBRE_ESTUDIANTE.pdf