--Laboratorio 14 de Dereck Josu� Soto Bonilla

--1 Cree una base de datos llamada LabFinal
CREATE DATABASE LabFinal
GO

USE LabFinal
GO

--2 Cree 3 archivos con sus respectivos filegroups en el disco C con sus nombres ClaseF_Primary, ClaseF_Log, ClaseF_NDF
--3 Para los grupos l�gicos asigne un tama�o de 50MB y un crecimiento de archivo del 10%, para el log 40mb y 8%, para el adicional 30mb y 5%
ALTER DATABASE LabFinal
ADD FILEGROUP ClaseF_Primary
GO

ALTER DATABASE LabFinal
ADD FILEGROUP ClaseF_Log
GO

ALTER DATABASE LabFinal
ADD FILEGROUP ClaseF_NDF
GO

ALTER DATABASE LabFinal
ADD FILE 
(
	NAME=ClaseF_Primary, 
	FILENAME = 'C:\ADBD\ClaseF_Primary.mdf',
	SIZE= 50MB, 
	FILEGROWTH =10%
) TO FILEGROUP ClaseF_Primary
GO

ALTER DATABASE LabFinal
ADD FILE 
(
	NAME=ClaseF_Log, 
	FILENAME = 'C:\ADBD\ClaseF_Log.ldf',
	SIZE= 40MB, 
	FILEGROWTH =8%
) TO FILEGROUP ClaseF_Log
GO

ALTER DATABASE LabFinal
ADD FILE 
(
	NAME=ClaseF_NDF, 
	FILENAME = 'C:\ADBD\ClaseF_NDF.ndf',
	SIZE= 30MB, 
	FILEGROWTH =5%
) TO FILEGROUP ClaseF_NDF
GO

--4 Modifique el filegroup del primario al ClaseF_Primary
ALTER DATABASE LabFinal
MODIFY FILEGROUP ClaseF_Primary DEFAULT
GO

--5 Cree el login UserFBD, adjunte captura
USE LabFinal
GO

CREATE LOGIN UserFBD
WITH PASSWORD= 'UserFBD123456789',
	CHECK_EXPIRATION = ON,
	CHECK_POLICY = ON;
GO

CREATE USER UserFBD
	FOR LOGIN UserFBD
	WITH DEFAULT_SCHEMA = PracticaFinal
GO

--6 Cree el esquema PracticaFinal para el usuario UserFBD 
CREATE SCHEMA PracticaFinal
	AUTHORIZATION UserFBD
GO

GRANT CONTROL TO UserFBD
GO

--7 Cree las tablas Genero_Pelicula, Productora, agregue al menos 4 campos y declare al menos 1 campo en default = ('Fecha')
EXECUTE AS USER = 'UserFBD'
GO

CREATE TABLE Genero_Pelicula 
(
    GeneroID INT NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(255) DEFAULT ('No hay descripcion'),
    FechaCreacion DATE
);
GO

INSERT INTO Genero_Pelicula
VALUES
	(1, 'Drama|Mystery|Thriller', 'Muy larga', '2022/04/03'),
	(2, 'Documentary|War', 'Aburrida', '2022/09/26'),
	(3, 'Documentary', 'Lenta', '2022/02/27'),
	(4, 'Adventure|War', DEFAULT, '2022/01/22');
GO

CREATE TABLE Productora 
(
    ProductoraID INT NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Pais NVARCHAR(100) DEFAULT ('No hay pa�s'),
    FechaCreacion DATE 
);
GO

INSERT INTO Productora
VALUES
	(1, 'SotoProductions', 'Costa Rica', '2023/03/04'),
	(2, 'YipProductions', DEFAULT, '2023/04/04'),
	(3, 'FloresProductions', 'Alemania', '2023/09/26'),
	(4, 'AmoresProductions', 'Francia', '2223/01/27');
GO

--8 Cree la tabla pel�cula, la cual deber� estar relacionada con las tablas Genero_Pelicula y Productora, realice las relaciones de PK y FK seg�n corresponda
CREATE TABLE Pelicula 
(
    PeliculaID INT NOT NULL PRIMARY KEY,
    Titulo NVARCHAR(255) NOT NULL,
    GeneroID INT NOT NULL,
    ProductoraID INT NOT NULL,
    FechaEstreno DATE NOT NULL,
    CONSTRAINT FK_Pelicula_GeneroPelicula FOREIGN KEY (GeneroID) REFERENCES Genero_Pelicula(GeneroID),
    CONSTRAINT FK_Pelicula_Productora FOREIGN KEY (ProductoraID) REFERENCES Productora(ProductoraID)
);
GO

--9 Inserte 30 registros a la tabla pel�cula (puede hacer uso de IA)
INSERT INTO Pelicula
VALUES 
	(1, 'Reality', 4, 1, '2024/02/05'),
	(2, 'Boys', 2, 3, '2024/04/11'),
	(3, 'Yuva', 3, 2, '2024/12/16'),
	(4, 'Wuthering Heights', 4, 2, '2024/08/13'),
	(5, 'Dead Awake', 1, 4, '2024/05/28'),
	(6, 'Vagabond (Sans toit ni loi)', 4, 1, '2024/04/04'),
	(7, '2:37', 4, 2, '2024/04/29'),
	(8, 'Stromboli', 2, 1, '2024/06/30'),
	(9, 'Dolores Claiborne', 4, 3, '2024/09/26'),
	(10, 'Keeping Mum', 3, 1, '2024/05/24'),
	(11, 'Eyes of Laura Mars', 1, 2, '2024/11/26'),
	(12, 'Lila & Eve', 4, 3, '2024/10/13'),
	(13, 'Bless the Child', 4, 4, '2024/08/09'),
	(14, 'Jolly Boys'' Last Stand, The', 1, 1, '2024/06/24'),
	(15, 'The Overnight', 1, 2, '2024/07/30'),
	(16, 'Paprika (Papurika)', 1, 2, '2024/05/25'),
	(17, 'Snails, The (Escargots, Les)', 2, 4, '2024/12/26'),
	(18, 'White Sheik, The (Sceicco bianco, Lo)', 2, 3, '2024/03/27'),
	(19, 'Santa Claus Conquers the Martians', 3, 1, '2024/04/25'),
	(20, 'Extraction', 2, 4, '2024/01/06'),
	(21, 'Guns, Girls and Gambling', 2, 3, '2024/05/03'),
	(22, 'Soul of Bread, The (Ai de mian bao hun)', 2, 4, '2024/03/22'),
	(23, 'I Am the Law', 3, 4, '2024/05/25'),
	(24, 'Look at Me (Comme une image)', 1, 3, '2024/08/28'),
	(25, 'Chorus, The (Hamsarayan)', 1, 1, '2024/06/02'),
	(26, 'Barney''s Version', 4, 1, '2024/11/01'),
	(27, 'Beautiful City (Shah-re ziba)', 2, 4, '2024/12/15'),
	(28, 'Godzilla vs. Megaguirus (Gojira tai Megagirasu: J� sh�metsu sakusen)', 2, 2, '2024/07/30'),
	(29, 'Backflash (Backflash Blues)', 1, 3, '2024/01/20'),
	(30, 'Jersey Girl', 1, 4, '2024/09/14');
GO

--10 Haga una funci�n y esquema de partici�n para la tabla pel�cula, deber� hacer 3 particiones la cuales se realizar�n por el ID de las pel�culas
CREATE PARTITION FUNCTION FN_IdPelicula (INT)
AS RANGE LEFT
FOR VALUES (10,20)
GO

CREATE PARTITION SCHEME EsquemaPartitionPeliculaID AS PARTITION FN_IdPelicula
TO (ClaseF_Primary, ClaseF_Log, ClaseF_NDF)
GO

--11 Cree un �ndice particionado, basado en el esquema de partici�n de la tabla pel�cula
CREATE CLUSTERED INDEX IndexPeliculaID
ON Pelicula(PeliculaID)
ON EsquemaPartitionPeliculaID(PeliculaID);
GO

--12 Cree una tabla de suscriptores donde el cliente adquiere el servicio de streaming de pel�culas con un costo mensual de 
--$8 plan standard individual, $15 plan premium, $25 plan familiar
CREATE TABLE Suscriptores 
(
    ClienteID INT NOT NULL PRIMARY KEY,
    Nombre NVARCHAR(255) NOT NULL,
    PlanAdquirido NVARCHAR(50) NOT NULL,
    CostoMensual INT NOT NULL
);
GO

--13 Inserte 10 clientes con diferentes planes de suscripci�n
INSERT INTO Suscriptores
VALUES
	(1, 'Bailey Jeff', 'Standard Individual', 8),
	(2, 'Mureil Crichmer', 'Familiar', 25),
	(3, 'Kameko Bridewell', 'Standard Individual', 8),
	(4, 'Erminie Beecham', 'Premium', 15),
	(5, 'Dimitri Ritchings', 'Familiar', 25),
	(6, 'Brande Messham', 'Familiar', 25),
	(7, 'Pollyanna Winthrop', 'Premium', 15),
	(8, 'Nikolaus Dall', 'Standard Individual', 8),
	(9, 'Querida Blincoe', 'Standard Individual', 8),
	(10, 'Ned Onslow', 'Premium', 15);
GO

--14 Cree una vista que muestre las pel�culas, g�neros y productoras asociadas, utilice alias para cada campo
CREATE VIEW View_Peliculas_Resumen (ID_Pelicula, Nombre_Pelicula, Fecha_Estreno, Genero, Productora)
AS
SELECT
	P.PeliculaID, P.Titulo, P.FechaEstreno,
	G.Nombre, 
	PR.Nombre
FROM Pelicula AS P 
INNER JOIN Genero_Pelicula AS G ON P.GeneroID = G.GeneroID
INNER JOIN Productora AS PR ON P.ProductoraID = PR.ProductoraID;
GO

--15 Encripte la  vista, consulte el script que genera la vista y valide que est� encriptada, adjunte captura
ALTER VIEW View_Peliculas_Resumen (ID_Pelicula, Nombre_Pelicula, Fecha_Estreno, Genero, Productora)
WITH ENCRYPTION
AS
SELECT
	P.PeliculaID, P.Titulo, P.FechaEstreno,
	G.Nombre, 
	PR.Nombre
FROM Pelicula AS P 
INNER JOIN Genero_Pelicula AS G ON P.GeneroID = G.GeneroID
INNER JOIN Productora AS PR ON P.ProductoraID = PR.ProductoraID;
GO

SP_HELPTEXT View_Peliculas_Resumen
GO

--16 Ejecute la vista, adjunte captura
SELECT *, $PARTITION.FN_IdPelicula(ID_Pelicula) AS 'N�m Partici�n'
FROM View_Peliculas_Resumen
GO

--17 Respalde la base de datos y guarde el archivo .bak
BACKUP DATABASE LabFinal
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\LabFinal.bak'
WITH FORMAT, NAME = 'Full Backup of LabFinal';
GO

--18 Adjunte el archivo sql con el nombre Lab14NOMBRE_ESTUDIANTE.sql, las capturas deber�n adjuntarse en un PDF con el siguiente nombre Lab14NOMBRE_ESTUDIANTE.pdf