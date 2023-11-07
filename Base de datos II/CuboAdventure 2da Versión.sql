use Adventure
go
select * from Sales.Customer

select * from Sales.Customer
where PersonID is not null

select * from Person.Person
select * from Sales.Store

Create view DimCliente
as
select
  c.CustomerID,
  case
    when c.PersonID is not null and c.StoreID is null then p.FirstName+' '+p.LastName
	when c.PersonID is null and c.StoreID is not null then s.Name
	else s.Name
  end Cliente,
  case
    when c.PersonID is not null and c.StoreID is null then 'Persona'
	when c.PersonID is null and c.StoreID is not null then 'Empresa'
	else 'Mixto'
  end TipoCliente,
  st.Name as Territorio
from Sales.Customer as c
left join Person.Person p on p.BusinessEntityID = c.PersonID
left join Sales.Store s on s.BusinessEntityID = c.StoreID
inner join Sales.SalesTerritory st on st.TerritoryID = c.TerritoryID

-- Dimensión Territorio
Create view DimTerritorio
as
Select 
sst.TerritoryID,
sst.Name as [Nombre del Territorio],
pcr.Name as [Nombre del País],
sst.[Group] as Region
from sales.SalesTerritory sst 
inner join person.CountryRegion pcr on pcr.CountryRegionCode = sst.CountryRegionCode

-- Dimensión Fecha
Create view DimFecha
as
select distinct orderdate as FechaID,
                year(orderdate) as Año,
				month(orderdate) as NoMes,
				day(orderdate) as NoDía,
				datepart(qq, orderdate) as Trimestre,
				datename(month, orderdate) as [Nombre del Mes],
				datename(WEEKDAY, orderdate) as [Nombre del Día]
from sales.SalesOrderHeader

-- Dimensión Tarjeta de Crédito
Create view DimTarjetaCredito
as
Select 
scc.CreditCardID,
scc.CardType
from sales.CreditCard scc

-- Dimensión Empresa de Envío
Create view DimEmpresaEnvío
as
Select 
ps.ShipMethodID,
ps.Name as [Nombre de Empresa]
from Purchasing.ShipMethod ps

-----------------------------------------------------------
-- Conformación de la tabla de Hechos
Create view HechosVentas
as
Select
-- Llaves Foraneas de la Tabla de Hechos
soh.CustomerID,
soh.ShipMethodID,
soh.CreditCardID,
soh.orderdate as FechaID,
soh.TerritoryID,
-- Valores de Medida
count(soh.SalesOrderID) as Cantidad,
sum(soh.SubTotal) as Venta,
sum(soh.TaxAmt) as Impuestos,
sum(soh.Freight) as [Costo X Envío],
sum(soh.TotalDue) as Total
from sales.SalesOrderHeader soh
Group by 
soh.CustomerID,
soh.ShipMethodID,
soh.CreditCardID,
soh.orderdate,
soh.TerritoryID