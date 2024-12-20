--Laboratorio 12 de Dereck Josué Soto Bonilla

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
    ('SJO', 'San José'),
    ('ALA', 'Alajuela'),
    ('CAR', 'Cartago'),
    ('HER', 'Heredia'),
    ('PUN', 'Puntarenas'),
    ('LIM', 'Limón'),
    ('GUA', 'Guanacaste'),
    ('ESC', 'Escazú'),
    ('SAA', 'Santa Ana'),
    ('DES', 'Desamparados'),
    ('CUR', 'Curridabat'),
    ('MOR', 'Moravia'),
    ('MON', 'Montes de Oca'),
    ('GOI', 'Goicoechea'),
    ('TIB', 'Tibás'),
    ('BAR', 'Barva'),
    ('STD', 'Santo Domingo'),
    ('SAR', 'San Rafael'),
    ('BEL', 'Belén'),
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
--6. Inicie una transacción explícita, inserte 1 nuevo cantón (sin dar commit o rollback)
BEGIN TRANSACTION 
	INSERT INTO Canton
	VALUES ('TUR', 'Turrialba');
GO