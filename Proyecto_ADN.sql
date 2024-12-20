/** SE CREA LA BASE DE DATOS**/
CREATE DATABASE Proyecto_ADN
GO

/** SE SELECCIONA LA BASE DE DATOS CREADA**/
USE Proyecto_ADN
GO

/** INSTRUCCION QUE PERMITE CREAR LOS DIAGRAMAS**/
Alter authorization on database::Proyecto_ADN to sa 


/*Establece el formato de la fecha en dia/mes/año, 
cualquiera de las dos*/
SET DATEFORMAT dmy --Comentariosa nivel de linea
SET LANGUAGE spanish


/*Instruccion que indica que la proxima consulta 
se ejecutará hasta que termine de ejecutarse la sentencia anterior*/
GO 

-- CREACIÓN DE TABLAS Y DE LOS SCRIPT DE INSERCIÓN DE LOS DATOS, DE LAS RESPECTIVAS TABLAS --

-- SECTOR --

CREATE TABLE Sector 
(
Codigo_Sector VARCHAR(20) NOT NULL,
Nombre_Sector VARCHAR (30) NOT NULL,
	CONSTRAINT PK_CodSector PRIMARY KEY(Codigo_Sector)
)
GO

INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S01','San José')
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S02','Alajuela') 
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S03','Cartago')
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S04','Heredia') 
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S05','Guanacaste')
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S06','Puntarenas') 
INSERT INTO Sector(Codigo_Sector,Nombre_Sector) VALUES('S07','Limón')
GO

-- PACIENTE --

CREATE TABLE Paciente

(
Cedula_Paciente VARCHAR (20) NOT NULL,
Fecha_Nacimiento DATETIME NOT NULL,
Nombre_Paciente VARCHAR (30) NOT NULL,
Correo_Electronico VARCHAR (30) NOT NULL,
Apellidos_Paciente VARCHAR (30) NOT NULL,
Direccion_Exacta VARCHAR (50) NOT NULL,
Codigo_Sector VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CedPaciente PRIMARY KEY(Cedula_Paciente),
	CONSTRAINT FK_Paciente_Sector FOREIGN KEY (Codigo_Sector) REFERENCES Sector(Codigo_Sector)
)
GO

INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('1-2466-7845','12/11/2010','Juan','juan@gmail.com','Rodríguez Soto','200mts Este del Mall San Pedro','S01')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('2-8568-6954','06/03/2009','Pedro','pedro@gmail.com','Aguilar Chavarría','600mts Oeste del City Mall','S02')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('3-5620-6395','05/12/1997','María','maria@gmail.com','Pérez Bonilla','1km al Norte de la Basílica de Los Ángeles','S03')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('4-2589-5632','23/03/2004','Sofía','sofia@gmail.com','Alfaro Vargas','400mts Sur del Mall Paseo de las Flores','S04')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('5-5203-7894','06/07/2000','Steven','steven@gmail.com','Rodríguez Alfaro','2km Oeste de la Municipalidad de Guanacaste','S05')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('6-7896-1235','24/09/1999','Emmanuel','emmanuel@gmail.com','Quesada López','100mts Este del Estadio Lito Pérez','S06')
INSERT INTO Paciente(Cedula_Paciente,Fecha_Nacimiento,Nombre_Paciente,Correo_Electronico,Apellidos_Paciente,Direccion_Exacta,Codigo_Sector)
VALUES('7-8520-5631','14/07/2019','Melissa','melissa@gmail.com','Vargas Madríz','800mts Norte del parque central de Limón','S07')

GO

-- LISTA TELEFONOS --

CREATE TABLE Lista_Telefonos
(
Numero_Telefonos VARCHAR(20) NOT NULL,
Cedula_Paciente VARCHAR(20) NOT NULL,
	CONSTRAINT PK_NumTelefonos PRIMARY KEY(Numero_Telefonos),
	CONSTRAINT FK_Lista_Telefonos_Paciente FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente)
)
GO

INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('8877-7410','1-2466-7845')
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('8826-4648','2-8568-6954') 
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('6598-8532','3-5620-6395')
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('7895-5698','4-2589-5632')
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('8536-9526','5-5203-7894')
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('7965-3659','6-7896-1235')
INSERT INTO Lista_Telefonos(Numero_Telefonos,Cedula_Paciente) VALUES('6489-7523','7-8520-5631')
GO

-- SERVICIOS --

CREATE TABLE Servicios
(
Codigo_Servicios VARCHAR(20) NOT NULL,
Nombre_Servicios VARCHAR(40) NOT NULL,
Costo_Maximo NUMERIC (10,2) NOT NULL,
Costo_Minimo NUMERIC (10,2) NOT NULL,
	CONSTRAINT PK_CodServicios PRIMARY KEY(Codigo_Servicios),
)
GO

INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('B05','Blanqueamiento',50000,20000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('L10','Limpieza',50000,30000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('C25','Calza',20000,10000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('E10','Extracción',40000,20000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('I20','Implementación de carillas dentales',80000,40000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('R01','Revisión general',50000,40000)
INSERT INTO Servicios(Codigo_Servicios,Nombre_Servicios,Costo_Maximo,Costo_Minimo)
VALUES('T20','Tratamiento de nervio',100000,50000)
GO

-- ESPECIALIDADES --

CREATE TABLE Especialidades
(
Codigo_Especialidad VARCHAR(20) NOT NULL,
Nombre_Especialidad VARCHAR(30) NOT NULL,
	CONSTRAINT PK_CodEspecialidad PRIMARY KEY(Codigo_Especialidad),
)
GO

INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('O69','Odontologia general')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('O24','Odontopediatría')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('E10','Endodoncia')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('O20','Ortodoncia')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('P40','Prostodoncia')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('P56','Periodoncia')
INSERT INTO Especialidades(Codigo_Especialidad,Nombre_Especialidad)
VALUES('C20','Cirugía maxilofacial y oral')
GO

-- ODONTOLOGO --

CREATE TABLE Odontologo
(
Cedula_Odontologo VARCHAR(20) NOT NULL,
Nombre_Odontologo VARCHAR(30) NOT NULL,
Apellidos_Odontologo VARCHAR(30) NOT NULL,
Telefono VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CedOdontologo PRIMARY KEY(Cedula_Odontologo),
)
GO

INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('4-9382-3844','Ricardo','Monge Pereira','6045-5436')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('7-1234-8956','Jimena','Sanchez Vargas','7866-8745')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('1-5967-8962','Ramón','Alfaro Rodríguez','8563-9856')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('2-8963-5698','Sara','Fajarado Chacón','78965-4589')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('3-6549-7895','Andrea','Soto Fajardo','89654-1356')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('5-7896-6359','Gabriel','Bonilla Quesada','6589-4567')
INSERT INTO Odontologo(Cedula_Odontologo,Nombre_Odontologo,Apellidos_Odontologo,Telefono)
VALUES('6-4598-1254','Andrés','Vargas Castillo','8756-2584')
GO

-- RELACION DE ODONTOLGO CON ESPECIALIDADES --

CREATE TABLE Relacion_ODONTOLOGO_ESPECIALIDAD 
( 
Cedula_Odontologo VARCHAR(20) NOT NULL,
Codigo_Especialidad VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CedOdontologo_CodEspecialidad PRIMARY KEY(Cedula_Odontologo,Codigo_Especialidad),
	CONSTRAINT FK_Relacion_ODONTOLOGO_ESPECIALIDAD_Odontologo FOREIGN KEY (Cedula_Odontologo) REFERENCES Odontologo(Cedula_Odontologo),
	CONSTRAINT FK_Relacion_ODONTOLOGO_ESPECIALIDAD_Servicios FOREIGN KEY (Codigo_Especialidad) REFERENCES Especialidades(Codigo_Especialidad),
)
GO

INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('4-9382-3844','O69')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('7-1234-8956','O24')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('1-5967-8962','E10')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('2-8963-5698','O20')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('3-6549-7895','P40')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('5-7896-6359','P56')
INSERT INTO Relacion_ODONTOLOGO_ESPECIALIDAD(Cedula_Odontologo,Codigo_Especialidad)
VALUES('6-4598-1254','C20')
GO

-- CITAS --

CREATE TABLE Citas
(
Codigo_Citas VARCHAR(20) NOT NULL,
Asistencia BIT NOT NULL,
Fecha DATE  NOT NULL,
Hora TIME NOT NULL,
Costo_Aproximado NUMERIC (10,2) NOT NULL,
Cedula_Paciente VARCHAR (20) NOT NULL,
Cedula_Odontologo VARCHAR(20) NOT NULL,
Codigo_Servicios VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CodCitas PRIMARY KEY(Codigo_Citas),
	CONSTRAINT FK_Citas_Paciente FOREIGN KEY (Cedula_Paciente) REFERENCES Paciente(Cedula_Paciente),
	CONSTRAINT FK_Citas_Odontologo FOREIGN KEY (Cedula_Odontologo) REFERENCES Odontologo(Cedula_Odontologo),
	CONSTRAINT FK_Citas_Servicios FOREIGN KEY (Codigo_Servicios) REFERENCES Servicios(Codigo_Servicios),
)
GO

INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C098',1,'16/06/2023','15:30:00',35000,'1-2466-7845','4-9382-3844','B05')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C348',0,'23/07/2023','09:30:00',40000,'2-8568-6954','7-1234-8956','L10')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C875',1,'01/06/2023','10:30:00',15000,'3-5620-6395','1-5967-8962','C25')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C156',0,'14/07/2023','13:00:00',30000,'4-2589-5632','2-8963-5698','E10')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C496',1,'26/05/2023','15:30:00',60000,'5-5203-7894','3-6549-7895','I20')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C659',0,'29/03/2023','08:30:00',45000,'6-7896-1235','5-7896-6359','R01')
INSERT INTO Citas(Codigo_Citas,Asistencia,Fecha,Hora,Costo_Aproximado,Cedula_Paciente,Cedula_Odontologo,Codigo_Servicios)
VALUES('C267',1,'10/06/2023','10:00:00',75000,'7-8520-5631','6-4598-1254','T20')
GO

-- CONSULTAS SOLICITADAS --

/* 1. Listar todas las citas de un paciente en particular, en un Rango de Fechas,
Mostrando código y nombre del paciente, el código y fecha de la cita.*/

SELECT Pac.[Cedula_Paciente] AS CÉDULA_PACIENTE,[Nombre_Paciente] AS NOMBRE_PACIENTE,[Codigo_Citas] AS CÓDIGO_CITA,[Fecha] AS FECHA_CITA, [Asistencia] AS ASISTENCIA
FROM [dbo].[Paciente] Pac FULL JOIN [dbo].[Citas] Cit
ON   Pac.Cedula_Paciente = Cit.Cedula_Paciente
WHERE [Nombre_Paciente]= 'Pedro' AND [Fecha] >= '10/03/2021' AND [Fecha] <= '10/03/2024' 
ORDER BY [Fecha] 
GO

/* 2. Listar todas las especialidades de un doctor en Mostrando código
y nombre del odontólogo, el código y descripción de la especialidad.*/

SELECT Odo.[Cedula_Odontologo] AS CÉDULA_ODONTÓLOGO,[Nombre_Odontologo] AS NOMBRE_ODONTÓLOGO,
Esp.[Codigo_Especialidad] AS CÓDIGO_ESPECIALIDAD,[Nombre_Especialidad] AS NOMBRE_ESPECIALIDAD
FROM [dbo].[Odontologo] Odo
FULL JOIN [dbo].[Relacion_ODONTOLOGO_ESPECIALIDAD] ROE ON Odo.Cedula_Odontologo = ROE.Cedula_Odontologo
FULL JOIN [dbo].[Especialidades] Esp ON ROE.Codigo_Especialidad = Esp.Codigo_Especialidad
WHERE [Nombre_Odontologo]= 'Andrea'
GO

/* 3. Mostrar las citas atendidas por un odontólogo en particular en un Rango de Fechas,
ordenado por fechas (Los datos a mostrar serán el id y nombre del médico, código de la cita y la fecha.*/

SELECT Odo.[Cedula_Odontologo] AS CÉDULA_ODONTÓLOGO,[Nombre_Odontologo] AS NOMBRE_ODONTÓLOGO,[Codigo_Citas] AS CÓDIGO_CITA,[Fecha] AS FECHA_CITA, [Asistencia] AS ASISTENCIA
FROM [dbo].[Odontologo] Odo FULL JOIN [dbo].[Citas]  Cit
ON Odo.Cedula_Odontologo = Cit.Cedula_Odontologo
WHERE [Nombre_Odontologo]= 'Andrés' AND [Fecha] >= '10/03/2021' AND [Fecha] <= '10/03/2024'
ORDER BY [Fecha] 
GO

/* 4. Mostrar la cantidad total de citas atendidas en un Rango de Fechas.*/

SELECT [Fecha] AS FECHA_CITA, COUNT (*) AS CANTIDAD_CITAS
FROM [dbo].[Citas]
WHERE [Fecha] >= '10/03/2021' AND [Fecha] <= '10/03/2024' 
GROUP BY [Fecha]
GO

/* 5. Lista de los servicios aplicados por un paciente en particular, 
la consulta debe mostrar el código y nombre del paciente, así como la fecha, el código y el nombre del tratamiento.*/

SELECT Pac.[Cedula_Paciente] AS CÉDULA_PACIENTE,[Nombre_Paciente] AS NOMBRE_PACIENTE,[Fecha] AS FECHA_CITA,
Ser.[Codigo_Servicios] AS CÓDIGO_SERVICIO,[Nombre_Servicios] AS NOMBRE_SERVICIO
FROM [dbo].[Paciente] Pac
FULL JOIN [dbo].[Citas] Cit ON Pac.Cedula_Paciente = Cit.Cedula_Paciente
FULL JOIN [dbo].[Servicios] Ser ON Cit.Codigo_Servicios = Ser.Codigo_Servicios
WHERE [Nombre_Paciente] = 'Pedro'
GO