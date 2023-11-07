


/*Realizar un esquema en estrella en la BD
adventure que permita analizar informaci�n de ventas
sobre: Territorios, tarjetas, pa�s, Fechas*/

-- Dimensi�n Territory

Select * from sales.SalesTerritory
Select * from person.CountryRegion


Create view DimTerritorio
as
select 
sst.TerritoryID,
sst.Name as [Nombre Territorio],
sst.[Group] as Region,
pcr.Name as Pa�s

from sales.SalesTerritory sst
inner join person.CountryRegion pcr
on pcr.CountryRegionCode = sst.CountryRegionCode

-- Dimensi�n Tarjeta de Cr�dito
Create view DimTarjetaCredito
as
Select scc.CreditCardID,
       scc.CardType
from sales.CreditCard scc


--Select c.CustomerID, 
--       p.FirstName + ' '+ p.LastName as [Nombre Persona],
--	   s.Name as [Nombre de Empresa],
--	   TerritoryID
--from sales.Customer c
--left join Person.Person p on p.BusinessEntityID = c.CustomerID 
--left join sales.Store s on s.BusinessEntityID = c.StoreID
--Select * from Person.person
--select * from sales.Store
-- Dimensi�n Cliente
Alter view DimCliente
as

select
c.CustomerID,
case
	when c.PersonID is not null then (select (p.FirstName+' '+p.LastName) from Person.Person p where p.BusinessEntityID = c.PersonID)
	else null
end as NombrePersona,
case
	when c.StoreID is not null then (select [Name] from Sales.Store s where s.BusinessEntityID = c.StoreID)
   else null
end as NombreTienda,
sst.[Name]
from sales.Customer c
inner join sales.SalesTerritory sst
on sst.TerritoryID = c.TerritoryID

Create view DimFecha
as
Select  Distinct sso.OrderDate as FechaID,
                 year(sso.orderdate) as A�o,
				 month(sso.orderdate) as noMes,
				 day(sso.orderdate) as noD�a,
				 datename(month, sso.orderdate) as [Nombre Mes],
				 datename(WEEKDAY, sso.orderdate) as [Nombre D�a],
				 datepart(qq, sso.orderdate) as Trimestre
from Sales.SalesOrderHeader sso

-- Dimensi�n de Empresa de Env�o
Create view DimEmpresaEnv�o
as
Select s.ShipMethodID, 
s.Name  as [Nombre de Empresa]
from Purchasing.ShipMethod s

------------------------------------------
-- Tabla de Hechos
Create view HechosVentas
as
Select 
-- Llaves foraneas de las tablas dimensionales
soh.OrderDate as FechaID,
soh.TerritoryID, 
soh.CreditCardID,
soh.CustomerID,
soh.ShipMethodID,

--- Valores de Medida
count(soh.SalesOrderID) as Cantidad,
sum(soh.SubTotal) as Venta,
sum(soh.TaxAmt) as Impuesto,
sum(soh.Freight) as [Costo X Env�o],
sum(soh.TotalDue) as TotalVenta


from sales.SalesOrderHeader soh
group by
soh.OrderDate,
soh.TerritoryID, 
soh.CreditCardID,
soh.CustomerID,
soh.ShipMethodID


Select * from sales.SalesOrderHeader soh

Create login _3M1_Sistemas
with password = 'uni2023'

sp_adduser _3M1_Sistemas, _3M1_Sistemas

Grant select on 
dbo.DimTerritorio to _3M1_Sistemas

Grant select on 
dbo.DimTarjetaCredito to _3M1_Sistemas