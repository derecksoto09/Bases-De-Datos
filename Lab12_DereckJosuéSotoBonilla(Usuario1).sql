--Laboratorio 12 de Dereck Josu� Soto Bonilla

--Usuario1
--1. Cree la base de datos Costa_Rica
CREATE DATABASE Costa_Rica
GO

--2. Cree la tabla canton (idcanton, nombrecanton)
USE Costa_Rica
GO

CREATE TABLE Canton (
    IdCanton NVARCHAR(5) PRIMARY KEY,
    NombreCanton NVARCHAR(50)
);
GO

--3. Cargue 20 cantones
INSERT INTO Canton
VALUES 
    ('SJO', 'San Jos�'),
    ('ALA', 'Alajuela'),
    ('CAR', 'Cartago'),
    ('HER', 'Heredia'),
    ('PUN', 'Puntarenas'),
    ('LIM', 'Lim�n'),
    ('GUA', 'Guanacaste'),
    ('ESC', 'Escaz�'),
    ('SAA', 'Santa Ana'),
    ('DES', 'Desamparados'),
    ('CUR', 'Curridabat'),
    ('MOR', 'Moravia'),
    ('MON', 'Montes de Oca'),
    ('GOI', 'Goicoechea'),
    ('TIB', 'Tib�s'),
    ('BAR', 'Barva'),
    ('STD', 'Santo Domingo'),
    ('SAR', 'San Rafael'),
    ('BEL', 'Bel�n'),
    ('FLO', 'Flores');
GO

--4. Cree un nuevo login de sql
CREATE LOGIN Usuario2 WITH PASSWORD = 'Usuario2123!';
GO

USE Costa_Rica;
CREATE USER Usuario2 FOR LOGIN Usuario2;
GO

GRANT SELECT ON Canton TO Usuario2;
GO

--Usuario1
--6. Inicie una transacci�n expl�cita, inserte 1 nuevo cant�n (sin dar commit o rollback)
BEGIN TRANSACTION 
	INSERT INTO Canton
	VALUES ('TUR', 'Turrialba');
GO