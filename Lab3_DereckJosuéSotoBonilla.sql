--Laboratorio 3 de Dereck Josué Soto Bonilla

USE master 
GO

--1 Cree una base de datos llamada Clase3
--2 Cree 3 carpetas en el disco C con sus respectivos nombres Clase3Primary, Clase3Log, Clase3NDF
--3 Cree los 3 grupos lógicos en la ruta correspondiente, para el primario asigne un tamaño de 60MB y un crecimiento de archivo del 15%, 
--para el log 40mb y 10%, para el adicional 40mb y 5%
CREATE DATABASE Clase3
ON PRIMARY --ARCHIVO PRIMARIO.mdf
( 
	NAME= 'Clase3Primary',
	FILENAME = 'C:\Clase3Primary\Clase3Primary.mdf',
	SIZE = 60MB,
	FILEGROWTH= 15%
)

LOG ON --ARCHIVO DE REGSITRO.ldf
(
	NAME= 'Clase3Log',
	FILENAME = 'C:\Clase3Log\Clase3Log.ldf',
	SIZE = 40MB,
	FILEGROWTH= 10%
)
GO

--CREACION DEL FILEGROUP ADICIONAL
ALTER DATABASE Clase3
ADD FILEGROUP Clase3NDF
GO

ALTER DATABASE Clase3 --ARCHIVO ADICIONAL.ndf
ADD FILE
(
	NAME= 'Clase3NDF',
	FILENAME = 'C:\Clase3NDF\Clase3NDF.ndf',
	SIZE = 40MB,
	FILEGROWTH= 5%
)
TO FILEGROUP Clase3NDF
GO

--4 Modifique el filegroup del primario al adicional
ALTER DATABASE Clase3
MODIFY FILEGROUP Clase3NDF DEFAULT
GO

--5 Cree el login UserABD
CREATE LOGIN UserABD
WITH PASSWORD= 'UserABD123456',
	CHECK_EXPIRATION = ON,
	CHECK_POLICY = ON;
GO

--6 Cree el esquema ClaseAdbdC3 para el usuario UserABD 
USE Clase3
GO

CREATE USER UserABD 
	FOR LOGIN UserABD
	WITH DEFAULT_SCHEMA = ClaseAdbdC3
GO

--crear esquema y asociar esquema al user
CREATE SCHEMA ClaseAdbdC3
	AUTHORIZATION UserABD
GO

GRANT CREATE TABLE TO UserABD
GO

--7 Cree la tabla Libro, agregue al menos 4 registros y declare al menos 1 campo en default = ('Autor desconocido') adjunte captura del select de los 4 registros
EXECUTE AS USER = 'UserABD'
GO

CREATE TABLE Libro
(
	CodigoLibro INT IDENTITY  (1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR (150) NOT NULL,
	Autor VARCHAR (300) DEFAULT ('Autor desconocido'),
	FechaPublicacion DATE,
);
GO

INSERT INTO Libro (Nombre,	Autor, FechaPublicacion)
VALUES
	('Libro1', 'Dereck Josué Soto Bonilla','2004-09-30'),
	('Libro2', 'Allan Ricardo Soto Bonilla','2016-08-17'),
	('Libro3', DEFAULT ,'2004-04-26'),
	('Libro4', 'Mathias Steven Soto Bonilla','2004-12-06')
GO

SELECT * FROM Libro
GO

--8 Adjunte el archivo sql con el nombre Lab3NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab3NOMBRE_ESTUDIANTE.pdf
