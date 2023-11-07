create database Repositorios

create table Recaudacion
(
IDRecaudacion int primary key,
Fecha Datetime,
Years datetime,
Mes datetime,
Descuento money,
Monto money,
CantidadOrdenes int
)

Select * from Orders
where
year (OrderDate) = 1998
and
month(OrderDate) = 3
update Orders set OrderDate = getdate()
where
year(OrderDate) = 2018
and
month(OrderDate) = 5

-------------------------------------------
Select 
cast(GETDATE() as date)