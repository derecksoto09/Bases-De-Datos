USE [master]
GO
/****** Object:  Database [AdventureDW_2do2024]    Script Date: 14/8/2024 10:20:06 ******/
CREATE DATABASE [AdventureDW_2do2024]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureDW_2do2024', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureDW_2do2024.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdventureDW_2do2024_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AdventureDW_2do2024_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdventureDW_2do2024] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdventureDW_2do2024].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdventureDW_2do2024] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdventureDW_2do2024] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdventureDW_2do2024] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdventureDW_2do2024] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdventureDW_2do2024] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdventureDW_2do2024] SET  MULTI_USER 
GO
ALTER DATABASE [AdventureDW_2do2024] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdventureDW_2do2024] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdventureDW_2do2024] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdventureDW_2do2024] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdventureDW_2do2024] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdventureDW_2do2024] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdventureDW_2do2024', N'ON'
GO
ALTER DATABASE [AdventureDW_2do2024] SET QUERY_STORE = OFF
GO
USE [AdventureDW_2do2024]
GO
/****** Object:  Table [dbo].[empleadosDepto]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleadosDepto](
	[Departamento] [varchar](100) NULL,
	[Genero] [varchar](100) NULL,
	[cantGenero] [numeric](18, 2) NULL,
	[Vacaciones] [numeric](18, 2) NULL,
	[Incapacidades] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenesEmpleados]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenesEmpleados](
	[id] [int] NULL,
	[nombre] [nchar](50) NULL,
	[apellido] [nchar](50) NULL,
	[status] [nchar](10) NULL,
	[periodo] [int] NULL,
	[cant] [int] NULL,
	[total] [numeric](18, 3) NULL,
	[minimo] [numeric](18, 3) NULL,
	[maximo] [numeric](18, 3) NULL,
	[promedio] [numeric](18, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoInventario]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoInventario](
	[codCategoria] [int] NULL,
	[nomCategoria] [varchar](50) NULL,
	[codLocalizacion] [int] NULL,
	[nomLocalizacion] [varchar](50) NULL,
	[Cantidad] [numeric](18, 2) NULL,
	[Promedio] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productoOrdenes]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productoOrdenes](
	[codProducto] [int] NULL,
	[nomProducto] [varchar](50) NULL,
	[cantOrdenes] [numeric](18, 2) NULL,
	[promOrdenes] [numeric](18, 2) NULL,
	[CostOrdenes] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[territorioVentas]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[territorioVentas](
	[codTerritorio] [int] NULL,
	[nomTerritorio] [varchar](50) NULL,
	[VentasReales] [numeric](18, 2) NULL,
	[VentasPlan] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ventasRegion]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ventasRegion](
	[id] [int] NULL,
	[nombre] [nchar](100) NULL,
	[Region] [nchar](50) NULL,
	[Ventas] [numeric](18, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_act_ordenes]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_act_ordenes] 
	AS
BEGIN
	delete from ordenesEmpleados
	insert into ordenesEmpleados
	select SalesPersonID,p.FirstName nombre, p.LastName apellido,
		CASE
					WHEN status=1 THEN 'Abierta'
					WHEN status=2 THEN 'Despachada'
					WHEN status=3 THEN 'Transito'
					WHEN status=4 THEN 'Confirmado'
					ELSE 'Entregada'
				END as  Status,
		YEAR(OrderDate) as periodo, 
		count(SalesPersonID) cant,sum(TotalDue) total,min(TotalDue) minimo,
		max(TotalDue) maximo,avg(TotalDue) promedio
	from AdventureWorks2014.sales.SalesOrderHeader   v inner join
	AdventureWorks2014.Person.Person p
		on v.SalesPersonID = p.BusinessEntityID
	where SalesPersonID is not null
	group by SalesPersonID,p.FirstName,p.LastName,
		Status,YEAR(OrderDate)
	order by SalesPersonID,YEAR(OrderDate),Status;
	 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consolida]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_consolida]
as
begin
 exec [dbo].[sp_act_ordenes];
 exec [dbo].[sp_ventas_territorio];
 exec [dbo].[spProductoordenes];
 exec [dbo].[spProductoInventario];
 exec [dbo].[spTerritorioVentas];
 exec [dbo].[spEmpleados];
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_ventas_territorio]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[sp_ventas_territorio]
as
begin
delete from [dbo].[ventasRegion]
insert into [dbo].[ventasRegion]
SELECT ventas.SalesPersonID id,
	vendedor.FirstName +' '+ vendedor.LastName nombre,
	territorio.Name region,
	sum(ventas.TotalDue) ventas 
FROM [AdventureWorks2014].Sales.SalesOrderHeader ventas
	inner join [AdventureWorks2014].Person.Person vendedor
	on ventas.SalesPersonID = vendedor.BusinessEntityID
	inner join [AdventureWorks2014].Sales.SalesTerritory territorio
	on ventas.TerritoryID = territorio.TerritoryID
group by ventas.SalesPersonID ,
	vendedor.FirstName, vendedor.LastName,
	territorio.Name
order by vendedor.FirstName, vendedor.LastName
end
GO
/****** Object:  StoredProcedure [dbo].[spEmpleados]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEmpleados] 
	AS
BEGIN
	delete from [dbo].[empleadosDepto]
	insert into [dbo].[empleadosDepto]
	select 
		d.Name as NombreDepartamento,
		case 
			when e.Gender = 'F' then 'Mujeres'
			when e.Gender = 'M' then 'Hombres'
		end as NombreGenero,
		COUNT(e.BusinessEntityID) as NumeroEmpleados,
		SUM(e.VacationHours) / 8 as DiasVacaciones,
		SUM(e.SickLeaveHours) / 8 as DiasIncapacidades
	from AdventureWorks2014.HumanResources.Department d
	inner join AdventureWorks2014.HumanResources.EmployeeDepartmentHistory edh on d.DepartmentID = edh.DepartmentID
	inner join AdventureWorks2014.HumanResources.Employee e on edh.BusinessEntityID = e.BusinessEntityID
	where
		edh.EndDate is null
	group by
		d.Name, e.Gender
	order by
		d.Name, e.Gender;
END

GO
/****** Object:  StoredProcedure [dbo].[spProductoInventario]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spProductoInventario]
	AS
BEGIN
	delete from [dbo].[productoInventario]
	insert into [dbo].[productoInventario]
	select 
		c.ProductCategoryID as Código,
		c.Name as Nombre,
		l.LocationID as CodigoLocalizacion,
		l.Name as NombreLocalizacion,
		SUM(i.Quantity) as InventarioTotal,
		SUM(i.Quantity * p.ListPrice) as CostoInventario
	from 
	AdventureWorks2014.Production.Product p 
	inner join AdventureWorks2014.Production.ProductSubcategory s on p.ProductSubcategoryID = s.ProductSubcategoryID 
	inner join AdventureWorks2014.Production.ProductCategory c on s.ProductCategoryID = c.ProductCategoryID 
	inner join AdventureWorks2014.Production.ProductInventory i on p.ProductID = i.ProductID 
	inner join AdventureWorks2014.Production.Location l on i.LocationID = l.LocationID 
	group by c.ProductCategoryID, c.Name, l.LocationID, l.Name
	order by c.ProductCategoryID, c.Name, l.LocationID, l.Name;
END
GO
/****** Object:  StoredProcedure [dbo].[spProductoordenes]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spProductoordenes]
	AS
BEGIN
	delete from [dbo].[productoOrdenes]
	insert into [dbo].[productoOrdenes]
	select 
		p.ProductID as Código,
		p.Name as Nombre,
		SUM(w.WorkOrderID) as TotalOrdenes,
		AVG(w.OrderQty) as PromedioOrdenes,
		SUM(r.ActualCost) as CostoTotalOrdenes
	from AdventureWorks2014.Production.Product p 
	inner join AdventureWorks2014.Production.WorkOrder w on p.ProductID = w.ProductID
	inner join AdventureWorks2014.Production.WorkOrderRouting r on w.WorkOrderID = r.WorkOrderID
	where p.ProductSubcategoryID in (1, 2)
	group by p.ProductID, p.name 
	having SUM(w.WorkOrderID) > 2000
	order by p.ProductID, p.name;
END
GO
/****** Object:  StoredProcedure [dbo].[spTerritorioVentas]    Script Date: 14/8/2024 10:20:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTerritorioVentas]
	AS
BEGIN
	delete from [dbo].[territorioVentas]
	insert into [dbo].[territorioVentas]
	select 
		t.TerritoryID as CodigoTerritorio,
		t.CountryRegionCode as NombreTerritorio,
		SUM(o.TotalDue) as VentasReales,
		t.SalesYTD as VentasPlaneadas
	from AdventureWorks2014.Sales.SalesTerritory t 
		inner join AdventureWorks2014.sales.SalesOrderHeader o on t.TerritoryID = o.TerritoryID
	group by t.TerritoryID, t.CountryRegionCode, t.SalesYTD;
END


GO
USE [master]
GO
ALTER DATABASE [AdventureDW_2do2024] SET  READ_WRITE 
GO
