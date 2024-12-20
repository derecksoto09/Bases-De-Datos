--Laboratorio 12 de Dereck Josué Soto Bonilla

--Usuario2
--5. Inicie sesión en una nueva ventana
USE Costa_Rica
GO

--Usuario2
--7. Configure el nivel de aislamiento Read uncommitted
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

--8. Realice un select a la tabla cantones, adjunte captura
SELECT * FROM Canton
GO

--9. Configure el nivel de aislamiento Read committed
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--10. Realice un select a la tabla cantones, adjunte captura 
SELECT * FROM Canton
GO

--11. Adjunte el archivo sql con el nombre Lab12NOMBRE_ESTUDIANTE.sql, las capturas deberán adjuntarse en un PDF con el siguiente nombre Lab12NOMBRE_ESTUDIANTE.pdf