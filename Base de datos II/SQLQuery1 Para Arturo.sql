--tabla recaudacion
use Northwind
insert into BDRepositorio.dbo.Recaudacion

Select 
      cast(Getdate() as Date) as Fecha,
	  'Northwind' as BD,
	  (Select distinct year(Orderdate) from orders where year(Orderdate) = year(getdate()) and month(Orderdate) = month(getdate())) as Año,
	  (Select distinct month(Orderdate) from orders where year(Orderdate) = year(getdate()) and month(Orderdate) = month(getdate())) as Mes,

	  round(sum(od.UnitPrice * od.Quantity ),2) as Monto,
	  round(sum(od.UnitPrice * od.Quantity * od.Discount ),2) as Descuento,
	  round(sum((od.UnitPrice * od.Quantity) * (1 - od.Discount )),2) as MontoTotal,
	  count(distinct o.orderID) as CantidadOrdenes
	  from [Order Details] od

--into BDRepositorio.dbo.Recaudacion
inner join Orders o on od.OrderID = o.OrderID
where 
year(Orderdate) = year(getdate())
and
month(Orderdate) = month(getdate())
go

select * from BDRepositorio.dbo.Recaudacion
delete from BDRepositorio.dbo.Recaudacion

select * from Orders

	




-----------------------------------------------------------------------
create database BDRepositorio
go 
use BDRepositorio
go 

create table Recaudacion
(IdRecaudacion int primary key identity (1,1),
Fecha date,
BaseDeDatos varchar (50),
Año int,
Mes int,
Monto float,
Descuento float,
MontoFinal float,
CantidadOrdenes int)
go

create table Detalle_Recaudacion
(IdDetalleRecaudacion int primary key identity (1,1),
IdRecaudacion int,
IdEmpleado int,
Monto int,
Descuento float,
MontoFinal float,
CantidadOrdenes int)
go

alter table Detalle_Recaudacion
add foreign key (IdRecaudacion) references Recaudacion (IdRecaudacion)


