--Laboratorio 10 de Dereck Josu� Soto Bonilla

--1. Cree la base datos Spotify
CREATE DATABASE Spotify
GO

USE Spotify
GO

--2. Cree la tabla Usuarios: id, nombre usuario, correo electr�nico, fecha nacimiento, n�m tarjeta cr�dito (formato 1111-2222-3333-4444), fecha registro, fecha suscripci�n premium
CREATE TABLE Usuarios (
    ID INT IDENTITY (1,1) NOT NULL,
    NombreUsuario NVARCHAR(50) NOT NULL,
    CorreoElectronico NVARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    NumTarjetaCredito NVARCHAR(50) NOT NULL,
    FechaRegistro DATE NOT NULL,
    FechaSuscripcionPremium DATE NOT NULL,
	Contrase�a NVARCHAR(50),
    CONSTRAINT PK_ID PRIMARY KEY (ID)
);
GO

--3. Inserte un usuario, adjunte captura del select
INSERT INTO Usuarios
VALUES 
	('Paula Flores', 'paulaflores@gmail.com', '2005-07-31', '1234-5678-9012-3456', '2024-07-31', '2024-08-01', '123');
GO

SELECT * FROM Usuarios;
GO

--4. Cree una funci�n para registro de contrase�as seguras (may�scula, min�scula, n�meros y s�mbolos, m�nimo 12 caracteres)
CREATE FUNCTION DBO.VerificarContrase�asSeguras (@Contrase�a NVARCHAR (50))
RETURNS BIT
AS
BEGIN
	DECLARE @Mayusculas BIT,
			@Minusculas BIT,
			@Numeros BIT,
			@Simbolos BIT,
			@Result BIT;
	SET @Mayusculas = CASE WHEN @Contrase�a COLLATE Latin1_General_BIN LIKE N'%[ABCDEFGHIJKLMNOPQRSTUVWXYZ]%' THEN 1 ELSE 0 END;
	SET @Minusculas = CASE WHEN @Contrase�a COLLATE Latin1_General_BIN LIKE N'%[abcdefghijklmnopqrstuvwxyz]%' THEN 1 ELSE 0 END;
	SET @Numeros = CASE WHEN @Contrase�a COLLATE Latin1_General_BIN LIKE N'%[123456789]%' THEN 1 ELSE 0 END;
	SET @Simbolos = CASE WHEN @Contrase�a COLLATE Latin1_General_BIN LIKE N'%[!@#$%^&*()]%' THEN 1 ELSE 0 END;

	IF LEN (@Contrase�a) >= 12 AND @Mayusculas = 1
							   AND @Mayusculas = 1
							   AND @Numeros = 1
							   AND @Simbolos = 1
	SET @Result = 1

	ELSE
	SET @Result = 0;

	RETURN @Result;
END
GO

--5. Modifique la tabla agregando el check de la funci�n contrase�a segura
ALTER TABLE Usuarios
	WITH NOCHECK
	ADD CONSTRAINT CHK_VerificarContrase�asSeguras
	CHECK (DBO.VerificarContrase�asSeguras (Contrase�a)=1);
GO

--6. Inserte un usuario que de error de constraint, adjunte captura
INSERT INTO Usuarios
VALUES 
	('Ana Lopez', 'analopez@gmail.com', '1985-10-22', '4321-8765-2109-6543', '2024-07-31', '2024-08-01', 'ana123');
GO

SELECT * FROM Usuarios;
GO

--7. Inserte un usuario que cumpla la regla, adjunte captura
INSERT INTO Usuarios
VALUES 
	('Juan Lopez', 'juanlopez@gmail.com', '1985-10-22', '4321-8765-2109-6543', '2024-07-31', '2024-08-01', 'JuanLopez123$');
GO

SELECT * FROM Usuarios;
GO

--8. Edite la tabla, agregue m�scara al correo, de manera que muestre las 4 primeras letras del correo, el 
--resto lo sustituye por '***@mail.' y las �ltimas 3 letras, ejemplo alejandro.serrano2@ulatina.net = alej***@mail.net
ALTER TABLE DBO.Usuarios ALTER COLUMN CorreoElectronico
	ADD MASKED WITH (FUNCTION = 'PARTIAL(4,"***@mail.",3)');

--9 Edite la tabla, agregue m�scara a la tarjeta de cr�dito con el siguiente formato 11111-****-****-4444
ALTER TABLE DBO.Usuarios ALTER COLUMN NumTarjetaCredito
	ADD MASKED WITH (FUNCTION = 'PARTIAL(4,"-****-****-",4)');

--10. Cree un usuario con permisos de lectura a la tabla
CREATE USER UserTest2 WITHOUT LOGIN;
GO

GRANT SELECT ON DBO.Usuarios TO UserTest2;
GO

--11. Haga un select a la tabla con el usuario creado, deber� mostrar los campos enmascarados, adjunte captura.
EXECUTE ('SELECT * FROM Usuarios') AS USER = 'UserTest2';
GO

--12. Adjunte el archivo sql con el nombre Lab10NOMBRE_ESTUDIANTE.sql, las capturas deber�n adjuntarse en un PDF con el siguiente nombre Lab10NOMBRE_ESTUDIANTE.pdf