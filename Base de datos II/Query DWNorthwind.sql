
-- Creación del Data Warehouse de la BD Northwind
Create database DWNorthwind
--
use DWNorthwind
-- Conformación de Dimensiones 
Create view DimEmpresa
as
Select s.ShipperID,
       s.CompanyName as [Nombre de Empresa Envío]
from Northwind.dbo.Shippers s
go
Create view DimCliente
as
Select c.CustomerID,
       c.CompanyName as [Nombre de Empresa],
	   c.ContactName as [Nombre del Contacto],
	   c.city as Ciudad,
	   c.Country as País
from Northwind.dbo.Customers c
go
Create view DimEmpleado
as
Select e.EmployeeID,
       e.FirstName as Nombre,
	   e.LastName as Apellido,
	   e.BirthDate as [Fecha de Nacimiento],
	   e.City as Ciudad,
	   e.country as País,
	   R.RegionDescription as Region
from Northwind.dbo.Employees e
inner join 
-- Se agregó la región a la consulta de la dimensión del Empleado
(Select distinct et.EmployeeID, r.RegionDescription from Northwind.dbo.EmployeeTerritories et
inner join Northwind.dbo.Territories t
on t.TerritoryID = et.TerritoryID
inner join Northwind.dbo.Region r
on r.RegionID = t.RegionID)R
on R.EmployeeID = e.EmployeeID

-- Creación de la dimensión del tiempo. 
Create view DimFecha
as
Select distinct o.orderdate as DateID,
                year(o.orderdate) as  Año,
				month(o.orderdate) as Mes, 
				datepart(qq, o.orderdate) as Trimestre,
				datename(month, o.orderdate) as NombreMes,
				datename(WEEKDAY, o.orderdate) as Nombredía

from Northwind.dbo.Orders o
go

----------------------------------------
-- Creación de la tabla de hechos utilizando la tabla orders
Create view HechosÓrdenes
as
Select 
-- Llaves Foraneas de las tablas dimensionales
o.CustomerID,
o.EmployeeID,
o.ShipVia,
o.Orderdate as FechaID,
-- Valores de Medida de la tabla de Hechos
count(distinct o.orderID) as [Cantidad Órdenes],
count(o.orderID) as [Cantidad de Producto],
round (sum(od.UnitPrice * od.Quantity),2) as Monto,
round (sum(od.UnitPrice * od.Quantity * od.Discount),2) as Descuento,
round (sum((od.UnitPrice * od.Quantity)* (1 - od.Discount)),2) as SubTotal,
o.Freight as [Cargo por Envío],
round (sum((od.UnitPrice * od.Quantity)* (1 - od.Discount)),2) + o.Freight as [Total (SubTotal + Envío)]
from Northwind.dbo.Orders o 
inner join Northwind.dbo.[Order Details] od
on od.OrderID = o.OrderID
Group by 
o.Freight,
o.CustomerID,
o.EmployeeID,
o.ShipVia,
o.Orderdate 

