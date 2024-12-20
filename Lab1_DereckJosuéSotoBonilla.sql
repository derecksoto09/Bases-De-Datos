--Laboratorio 1 de Dereck Josué Soto Bonilla

-- 1. Cree la base de datos con el nombre VentasL1
CREATE DATABASE VentasL1;
GO
USE VentasL1;
GO

-- 2. Cree las tablas adjuntas, recuerde utilizar correctamente el tipo de dato según corresponda
-- 3. Cree las relaciones de PK y FK

CREATE TABLE Sucursal (
    Codigo INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Sucursal VARCHAR(100),
    Provincia VARCHAR(100),
    Canton VARCHAR(100),
    Distrito VARCHAR(100),
    Meta_mensual DECIMAL(10, 2),
    Gerente VARCHAR(100)
);

CREATE TABLE Vendedor (
    ID_Vendedor INT PRIMARY KEY IDENTITY(1,1),
    Cedula_Vendedor VARCHAR(50),
    Nombre_Vendedor VARCHAR(100),
    Apellido1_Vendedor VARCHAR(100),
    Apellido2_Vendedor VARCHAR(100),
    Edad_Vendedor INT,
    Cargo_Vendedor VARCHAR(100),
    Correo_Vendedor VARCHAR(100),
    Fecha_ingreso_Vendedor DATE,
    Sucursal INT,
    FOREIGN KEY (Sucursal) REFERENCES Sucursal(Codigo)
);

CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY IDENTITY(1,1),
    Marca VARCHAR(100),
    Modelo VARCHAR(100),
    Descripcion VARCHAR(255),
    Precio DECIMAL(10, 2),
    Stock INT,
    Imagen VARCHAR(255)
);

CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Cedula_Cliente VARCHAR(50),
    Nombre_Cliente VARCHAR(100),
    Apellido1_Cliente VARCHAR(100),
    Apellido2_Cliente VARCHAR(100),
    Correo_Cliente VARCHAR(100),
    Celular_Cliente VARCHAR(20)
);

CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY IDENTITY(1,1),
    ID_Factura INT UNIQUE,                   
    Fecha DATE,
    Total DECIMAL(10, 2),
    Cliente INT,
    Vendedor INT,
    FOREIGN KEY (Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (Vendedor) REFERENCES Vendedor(ID_Vendedor)
);

CREATE TABLE Detalle_factura (
    ID_Factura INT,
    Producto INT,
    Cantidad INT,
    Total DECIMAL(10, 2),
	PRIMARY KEY (ID_Factura, Producto),
    FOREIGN KEY (ID_Factura) REFERENCES Venta(ID_Factura),
    FOREIGN KEY (Producto) REFERENCES Producto(ID_Producto)
);

-- 4. Inserte al menos 4 registros a cada tabla

INSERT INTO Sucursal (Nombre_Sucursal, Provincia, Canton, Distrito, Meta_mensual, Gerente)
VALUES 
('Sucursal Central', 'San José', 'San José', 'Catedral', 15000.00, 'Juan Pérez'),
('Sucursal Este', 'Cartago', 'Cartago', 'Oriental', 10000.00, 'María Rodríguez'),
('Sucursal Oeste', 'Alajuela', 'Alajuela', 'San José', 12000.00, 'Carlos González'),
('Sucursal Norte', 'Heredia', 'Heredia', 'San Francisco', 13000.00, 'Ana Castillo');

INSERT INTO Vendedor (Cedula_Vendedor, Nombre_Vendedor, Apellido1_Vendedor, Apellido2_Vendedor, Edad_Vendedor, Cargo_Vendedor, Correo_Vendedor, Fecha_ingreso_Vendedor, Sucursal)
VALUES 
('12345678', 'Luis', 'Ramírez', 'Solano', 28, 'Ejecutivo de Ventas', 'luis.ramirez@ventas.com', '2022-01-15', 1),
('87654321', 'Pedro', 'Rojas', 'Vega', 35, 'Gerente de Ventas', 'pedro.rojas@ventas.com', '2021-11-01', 2),
('56781234', 'Sofía', 'García', 'Fernández', 30, 'Asistente de Ventas', 'sofia.garcia@ventas.com', '2023-03-20', 3),
('43218765', 'Ana', 'Jiménez', 'Martínez', 26, 'Vendedora', 'ana.jimenez@ventas.com', '2020-06-10', 4);

INSERT INTO Producto (Marca, Modelo, Descripcion, Precio, Stock, Imagen)
VALUES 
('Apple', 'iPhone 14', 'Teléfono inteligente de última generación', 1200.00, 50, 'imagen1.jpg'),
('Samsung', 'Galaxy S21', 'Smartphone con cámara avanzada', 950.00, 30, 'imagen2.jpg'),
('HP', 'Spectre x360', 'Laptop convertible de alta gama', 1500.00, 20, 'imagen3.jpg'),
('Sony', 'PlayStation 5', 'Consola de videojuegos de nueva generación', 500.00, 15, 'imagen4.jpg');

INSERT INTO Cliente (Cedula_Cliente, Nombre_Cliente, Apellido1_Cliente, Apellido2_Cliente, Correo_Cliente, Celular_Cliente)
VALUES 
('11223344', 'Carlos', 'Soto', 'Morales', 'carlos.soto@correo.com', '88885555'),
('22334455', 'María', 'Alvarado', 'Campos', 'maria.alvarado@correo.com', '87776666'),
('33445566', 'Pedro', 'Ramírez', 'Arias', 'pedro.ramirez@correo.com', '86667777'),
('44556677', 'Ana', 'López', 'Fernández', 'ana.lopez@correo.com', '85558888');

INSERT INTO Venta (ID_Factura, Fecha, Total, Cliente, Vendedor)
VALUES 
(1001, '2024-09-10', 2200.00, 1, 1),
(1002, '2024-09-11', 1500.00, 2, 2),
(1003, '2024-09-12', 2000.00, 3, 3),
(1004, '2024-09-13', 500.00, 4, 4);

INSERT INTO Detalle_factura (ID_Factura, Producto, Cantidad, Total)
VALUES 
(1001, 1, 1, 1200.00),
(1001, 2, 1, 1000.00),
(1002, 3, 1, 1500.00),
(1003, 4, 2, 1000.00),
(1004, 4, 1, 500.00);

-- 5. Haga un select de las tablas con sus registros, adjunte captura

SELECT * FROM Sucursal;

SELECT * FROM Vendedor;

SELECT * FROM Producto;

SELECT * FROM Cliente;

SELECT * FROM Venta;

SELECT * FROM Detalle_factura;

-- 6. Haga un select de dos tablas haciendo uso de join
SELECT 
    Venta.ID_Venta,
    Venta.ID_Factura,
    Venta.Fecha,
    Venta.Total,
    Cliente.Nombre_Cliente,
    Cliente.Apellido1_Cliente,
    Cliente.Apellido2_Cliente
FROM Venta
INNER JOIN Cliente ON Venta.Cliente = Cliente.ID_Cliente;