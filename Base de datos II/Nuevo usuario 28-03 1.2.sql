use Northwind
go

select
round (sum ((od.Quantity * od.UnitPrice) * (1 - od.Discount )), 2)
as RecaudacionTotal
from [Order Details] od


select RegionDescription, sum (Recaudacion) as Recaudacion from (
select distinct et.EmployeeID, 
e.FirstName,
r.RegionDescription

 from EmployeeTerritories et
inner join Employees e on e.EmployeeID = et.EmployeeID
inner join Territories t on t.TerritoryID = et.TerritoryID
inner join Region r on r.RegionID = t.RegionID) A
inner join 


--Recaudaciones por empleado

(select
o.EmployeeID,
round (sum ((od.Quantity * od.UnitPrice) * (1 - od.Discount )), 2)
as Recaudacion
from [Order Details] od
inner join Orders o on o.OrderID = o.OrderID

group by
o.EmployeeID) B
on B.EmployeeID = A.EmployeeID
group by RegionDescription

select * from Recaudación

sP_addmessage 50002,1, 'El registro  con ID:%d, ha sido eliminado por el usuario: %s',
'us_english', 'true'

--Creacion de procedimientos almacenados Insertar  / Delete

Create procedure Insertar_Regiones
@RegionID int,
@NombreRegion varchar (60)
as

insert into Region values (@RegionID, @NombreRegion)

--------------------------------------------------
alter procedure Eliminar_Regiones
@RegionID int
as 
declare @Usuario varchar (50)
set @Usuario = SUSER_NAME ()
delete from Region where RegionID = @RegionID

-----Ejecutamos el mensaje despues de ejecutar el registro
Raiserror (50002, 1,1, @RegionID, @Usuario)

execute Insertar_Regiones 5 , 'Centro América'

execute  Eliminar_Regiones 5


create login SistemaNorthwind
with password = 'sistemas2023'
go

sp_adduser SistemaNorthwind, SistemaNorthwind

grant execute on Insertar_Regiones to SistemaNorthwind
grant execute on Eliminar_Regiones to SistemaNorthwind


exec Insertar_Regiones 7, 'America del sur'
exec Eliminar_Regiones 7