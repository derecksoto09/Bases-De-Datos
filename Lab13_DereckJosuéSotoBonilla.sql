--Laboratorio 13 de Dereck Josué Soto Bonilla

--1. Utilice la base de datos Northwind
USE Northwind
GO

--2. Realice un full backup de la base de datos, adjunte captura
BACKUP DATABASE Northwind
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Northwind_Full.bak'
WITH FORMAT, NAME = 'Full Backup of Northwind';

--3. Inserte 10 registros a la tabla customers, adjunte captura
INSERT INTO Customers
VALUES
	('NEW1', 'Trunyx', 'Dana Bursell', 'Safety Technician III', '5437 Darwin Center', 'Bīrganj', 'LA-SV', null, 'Nepal', '395-965-8995', '538-382-2756'),
	('NEW2', 'Gigashots', 'Carly Vaugham', 'Senior Developer', '09 Nelson Trail', 'Zastron', 'RU-YAR', '9951', 'South Africa', '276-410-4928', '979-302-4218'),
	('NEW3', 'Pixonyx', 'Adair Robiot', 'Editor', '95 Waubesa Way', 'Strabychovo', 'DK-85', null, 'Ukraine', '179-553-2384', '765-775-0571'),
	('NEW4', 'Oyonder', 'Prentice Gilks', 'Office Assistant III', '9 Lakewood Gardens Drive', 'Ústí nad Orlicí', 'CA-AB', '5606', 'Czech Republic', '345-861-8493', '435-383-6014'),
	('NEW5', 'Aivee', 'Bastian Wallis', 'Web Developer IV', '722 Dakota Way', 'Ceuta', 'US-AL', '51005', 'Spain', '212-515-4930', '794-609-5568'),
	('NEW6', 'JumpXS', 'Sukey Ovize', 'Assistant Media Planner', '61 Ridgeway Center', 'Guarujá', 'CAQC', '114000', 'Brazil', '532-993-8967', '685-780-8120'),
	('NEW7', 'Edgeblab', 'Isidro Mecozzi', 'Project Manager', '7263 Hazelcrest Court', 'Mir', 'FR-V', null, 'Belarus', '516-770-4694', '128-191-5817'),
	('NEW8', 'Quatz', 'Ozzy Ivanchin', 'Recruiter', '80 Steensland Parkway', 'Mounlapamôk', 'US-AK', null, 'Laos', '720-245-0231', '120-956-5757'),
	('NEW9', 'Meetz', 'Maxy Putson', 'Staff Scientist', '9 Arrowood Crossing', 'Getahovit', 'PG-WPD', null, 'Armenia', '999-740-6838', '397-398-3553'),
	('NEW10', 'Gabvine', 'Nathaniel Essel', 'Professor', '2397 Hagan Way', 'Vitry-sur-Seine', 'NE-4', '94785', 'France', '373-642-6451', '875-689-7820');
GO

SELECT * FROM Customers
WHERE CustomerID LIKE 'NEW%';

--4. Realice un respaldo diferencial de la base de datos, adjunte captura
BACKUP DATABASE Northwind
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Northwind_Diferencial.bak'
WITH DIFFERENTIAL, NAME = 'Differential Backup of Northwind';

--5. Elimine la base de datos Northwind, adjunte captura
USE master
GO 

DROP DATABASE Northwind;

--6. Restaure el full backup, adjunte captura
RESTORE DATABASE Northwind
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Northwind_Full.bak'
WITH NORECOVERY

--7. Restaure el respaldo diferencial, adjunte captura
RESTORE DATABASE Northwind
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Backup\Northwind_Diferencial.bak'
WITH NORECOVERY;
RESTORE DATABASE Northwind WITH RECOVERY;

--8. Haga un select y valide la existencia de los 10 registros del punto 3, adjunte captura
USE Northwind
GO

SELECT * FROM Customers
WHERE CustomerID LIKE 'NEW%';

--9. Adjunte el archivo sql con el nombre Lab13NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab13NOMBRE_ESTUDIANTE.pdf