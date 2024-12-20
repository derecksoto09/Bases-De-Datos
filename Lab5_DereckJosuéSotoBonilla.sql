--Laboratorio 5 de Dereck Josué Soto Bonilla

USE master
GO

--1 Cree la base de datos Pais
CREATE DATABASE Pais 
GO

USE Pais
GO

--2 Cree una tabla persona, con campos ID, nombre, provincia, edad, salario
CREATE TABLE Persona (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Provincia VARCHAR(50),
    Edad INT,
    Salario DECIMAL(18,2)
)
GO

--3 Cree 3 archivos para almacenar los filegroups, llamados padron, indique size y filegrowth 20bm y 30% respectivamente
ALTER DATABASE Pais
ADD FILEGROUP Padron1
GO

ALTER DATABASE Pais
ADD FILEGROUP Padron2
GO

ALTER DATABASE Pais
ADD FILEGROUP Padron3
GO

ALTER DATABASE Pais
ADD FILE
(
	NAME = Padron1,
	FILENAME = 'C:\ADBD\Padron1.ndf',
	SIZE= 20MB, 
	FILEGROWTH =30%
) TO FILEGROUP Padron1
GO

ALTER DATABASE Pais
ADD FILE
(
	NAME = Padron2,
	FILENAME = 'C:\ADBD\Padron2.ndf',
	SIZE= 20MB, 
	FILEGROWTH =30%
) TO FILEGROUP Padron2
GO

ALTER DATABASE Pais
ADD FILE
(
	NAME = Padron3,
	FILENAME = 'C:\ADBD\Padron3.ndf',
	SIZE= 20MB, 
	FILEGROWTH =30%
) TO FILEGROUP Padron3
GO

--4 Cree la función de partición
CREATE PARTITION FUNCTION FuncionParticionSalario (Decimal(18,2))
AS RANGE RIGHT FOR VALUES (500000, 1000000)
GO

--5 Cree el esquema de partición, este realizará la partición por salario de menor a mayor 
CREATE PARTITION SCHEME EsquemaPaticionSalario AS PARTITION FuncionParticionSalario
TO (Padron1, Padron2, Padron3)
GO

--6 Inserte 90 registros (30 por cada rango de salario aproximadamente, los 3 rangos de salarios son de 1 a 1,500,000), al insertar en la tabla,
--deberá filtrarse por salario e insertar en la partición correspondiente
INSERT INTO Persona
VALUES
	(1, 'Coleen', 'Connecticut', 29, 463897),
	(2, 'Viki', 'Missouri', 43, 170818),
	(3, 'Lothaire', 'California', 68, 259660),
	(4, 'Rozalie', 'Alabama', 89, 496085),
	(5, 'Marris', 'South Carolina', 21, 146336),
	(6, 'Jaquith', 'Ohio', 84, 394104),
	(7, 'Angele', 'District of Columbia', 75, 76930),
	(8, 'Dorian', 'Louisiana', 89, 106019),
	(9, 'Carin', 'North Carolina', 41, 278197),
	(10, 'Querida', 'Connecticut', 82, 403917),
	(11, 'Haily', 'Oregon', 28, 417103),
	(12, 'Tommie', 'Florida', 61, 138122),
	(13, 'Rosie', 'Tennessee', 86, 234791),
	(14, 'Ingunna', 'California', 71, 208540),
	(15, 'Raynell', 'Colorado', 41, 272272),
	(16, 'Sapphire', 'Texas', 75, 312498),
	(17, 'Alyssa', 'Nebraska', 98, 241500),
	(18, 'Suzi', 'California', 93, 399392),
	(19, 'Madelyn', 'Virginia', 99, 77307),
	(20, 'Wyatt', 'Illinois', 87, 113428),
	(21, 'Fania', 'California', 79, 373866),
	(22, 'Bunny', 'Washington', 95, 142588),
	(23, 'Arlina', 'Mississippi', 82, 421167),
	(24, 'Baron', 'Alabama', 36, 393496),
	(25, 'Marabel', 'Arizona', 74, 192485),
	(26, 'Melisse', 'North Carolina', 75, 326541),
	(27, 'Marshall', 'Tennessee', 69, 21782),
	(28, 'Winslow', 'Texas', 64, 215013),
	(29, 'Rudolph', 'Georgia', 31, 337580),
	(30, 'Benedicta', 'Texas', 46, 499883),
	(31, 'Tore', 'Indiana', 49, 574396),
	(32, 'Daphene', 'Michigan', 96, 640690),
	(33, 'Grayce', 'Oklahoma', 29, 576447),
	(34, 'Barnebas', 'Nevada', 29, 773305),
	(35, 'Early', 'Arizona', 19, 971485),
	(36, 'Sharia', 'New York', 42, 775685),
	(37, 'Rhoda', 'Texas', 40, 677184),
	(38, 'Bertine', 'California', 40, 706526),
	(39, 'Kalli', 'Oregon', 88, 917317),
	(40, 'Blancha', 'Maryland', 73, 992980),
	(41, 'Deana', 'Texas', 42, 843129),
	(42, 'Shelley', 'Pennsylvania', 36, 954030),
	(43, 'Joeann', 'Louisiana', 20, 875158),
	(44, 'Arnaldo', 'Texas', 35, 617980),
	(45, 'Berky', 'Oklahoma', 46, 741529),
	(46, 'Gerri', 'California', 98, 572610),
	(47, 'Link', 'New York', 75, 878527),
	(48, 'Ronalda', 'Indiana', 41, 637837),
	(49, 'Josefina', 'Florida', 61, 992043),
	(50, 'Eugenie', 'Washington', 39, 510418),
	(51, 'Justino', 'California', 30, 992262),
	(52, 'Dulcea', 'South Carolina', 29, 722616),
	(53, 'Fernandina', 'Texas', 27, 757007),
	(54, 'Phebe', 'Georgia', 53, 616390),
	(55, 'Del', 'Nebraska', 22, 662751),
	(56, 'Wyn', 'Texas', 94, 717386),
	(57, 'Jenine', 'Wisconsin', 95, 717112),
	(58, 'Betsy', 'Kansas', 18, 861911),
	(59, 'Vicki', 'California', 100, 818348),
	(60, 'Feodor', 'Minnesota', 39, 778365),
	(61, 'Dora', 'California', 62, 1040742),
	(62, 'Jandy', 'Mississippi', 55, 1198245),
	(63, 'Melessa', 'Connecticut', 23, 1194554),
	(64, 'Harvey', 'Florida', 93, 1386891),
	(65, 'Luke', 'Michigan', 89, 1127529),
	(66, 'Valentine', 'New Mexico', 93, 1242484),
	(67, 'Vite', 'Michigan', 75, 1341815),
	(68, 'George', 'Arizona', 28, 1286199),
	(69, 'Chad', 'California', 58, 1409176),
	(70, 'Jude', 'Florida', 47, 1035903),
	(71, 'Jerrilyn', 'Washington', 61, 1061030),
	(72, 'Paige', 'Alabama', 83, 1174422),
	(73, 'Vincent', 'Massachusetts', 57, 1367159),
	(74, 'Tobey', 'California', 35, 1068246),
	(75, 'Caterina', 'Virginia', 47, 1128867),
	(76, 'Tyson', 'Alabama', 57, 1421243),
	(77, 'Cori', 'Ohio', 47, 1237250),
	(78, 'Lorenzo', 'Connecticut', 87, 1077601),
	(79, 'Brewster', 'Colorado', 57, 1278969),
	(80, 'Norah', 'Illinois', 37, 1407364),
	(81, 'Pepe', 'Florida', 60, 1293583),
	(82, 'Lishe', 'Oregon', 61, 1409758),
	(83, 'Woodman', 'Ohio', 92, 1329994),
	(84, 'Luciano', 'Maryland', 28, 1264194),
	(85, 'Elmore', 'Texas', 80, 1264413),
	(86, 'Sallie', 'Montana', 26, 1435138),
	(87, 'Jackie', 'Louisiana', 33, 1426767),
	(88, 'Valma', 'District of Columbia', 83, 1064302),
	(89, 'Tedda', 'Oklahoma', 45, 1179487),
	(90, 'Dale', 'New Jersey', 99, 1245018)
GO

--7 Adjunte captura del select con particiones
SELECT ID, Nombre, Provincia, Edad, Salario, $PARTITION.FuncionParticionSalario(Salario) AS 'Núm Partición'
FROM Persona

--8 Inserte 5 registros con salarios mayores a 1,500,000, adjunte captura con las particiones
INSERT INTO Persona
VALUES
	(91, 'Vanni', 'Indiana', 81, 1651939),
	(92, 'Hortense', 'District of Columbia', 43, 1615317),
	(93, 'Koral', 'Tennessee', 72, 1745827),
	(94, 'Austina', 'Ohio', 32, 1713778),
	(95, 'Lyndsay', 'Texas', 90, 1659501)
GO

SELECT ID, Nombre, Provincia, Edad, Salario, $PARTITION.FuncionParticionSalario(Salario) AS 'Núm Partición'
FROM Persona

--9 Modifique la base de datos cree un filegroup adicional para un monto mayor de salarios superior al 1,500,000
ALTER DATABASE Pais
ADD FILEGROUP Padron4
GO

ALTER DATABASE Pais
ADD FILE
(
	NAME = Padron4,
	FILENAME = 'C:\ADBD\Padron4.ndf',
	SIZE= 20MB, 
	FILEGROWTH =30%
) TO FILEGROUP Padron4
GO

--10 Los registros con salarios mayores a 1,500,000 deberán mostrarse en la partición 4
ALTER PARTITION SCHEME EsquemaPaticionSalario NEXT USED Padron4
GO
ALTER PARTITION FUNCTION FuncionParticionSalario () SPLIT RANGE (1500000)
GO

--11 adjunte captura del select con los datos particionados
SELECT ID, Nombre, Provincia, Edad, Salario, $PARTITION.FuncionParticionSalario(Salario) AS 'Núm Partición'
FROM Persona

--12 Cree Índice agrupado para el ID y uno no agrupado por nombre
CREATE CLUSTERED INDEX idxPersonaID ON Persona(ID);
GO

CREATE NONCLUSTERED INDEX idxPersonaNombre ON Persona(Nombre);
GO

--13 Adjunte el archivo sql con el nombre Lab5NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab5NOMBRE_ESTUDIANTE.pdf