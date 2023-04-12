--1.
Create login Sistema with password = 'sistemas123'

use Northwind
go
Create User Digitador from Login Sistema

Grant select, insert, update on Database:: Northwind to Digitador--2.
Revoke select, insert, update on Database:: Northwind to Digitador

Grant select on Customers to Digitador
Grant select on Orders to Digitador

Grant select on Object::Customers to Digitador
Grant select on Object:: Orders to Digitador

use Northwind

sp_helprotect null, Digitador--3.
Grant update on Employees to Digitador

use Northwind
go
update Employees set Country = 'Nicaragua' where EmployeeID = 2
Grant select on Employees to Digitador

use Northwind
go
update Employees set Country = 'Nicaragua' where EmployeeID = 2--4.Grant execute on [dbo].[CustOrderHist] to Digitador

Grant select on [dbo].[Category Sales for 1997] to Digitador
Grant select on [dbo].[Order Details Extended] to Digitador--5.Create login Administrador with password = 'maestria2018'

use Northwind
go
Execute sp_changedbowner 'Administrador'

sp_helpdb Northwind--6.use Northwind
go
Execute sp_changedbowner [SERVIDOR\UNI]

use Northwind
go
Create user Principal from login Administrador

Grant select on Customers to Principal with grant option
Grant select on Employees to Principal with grant optionsp_helprotect null, Digitadoruse Northwind
go
Grant select on Customers to Digitador
Grant select on Employees to Digitador--7.Create login Creador with password = 'maestria2018'
go
use Northwind
go
Exec sp_adduser Creador, creador 
go
Grant create table to creador
Grant create view to creador
Grant create procedure to creadoruse Northwind
go
Create table creador.Persona(id int)
go
Create view creador.vistaClientes
as
Select * from Customers
go
Create procedure creador.Noclientes
as
Select count(*) from customers as Cantidad--8.use Northwind
go
Create schema Reporte

USE [Northwind]
GO
ALTER AUTHORIZATION ON SCHEMA::[Reporte] TO [creador]3
GO

Create view Reporte.ordenesxcliente
as
Select CustomerID,
count(*) as Cantidad
from orders
Group by
CustomerID--9.use Northwind
go
sp_helprotect null, creadoruse Northwind
sp_addrolemember db_ddladmin, creadoruse northwind
go
Create table dbo.Prueba(id int)Select * from PruebaDeny create view to CreadorCreate view creador.datosCliente
as
Select * from CustomersRevoke create view to CreadorCreate view creador.datosCliente
as
Select * from Customers--10.use Northwind
go
sp_droprolemember db_ddladmin, creador
go
sp_addrolemember db_datareader, creadorDeny Select on Employees to Creador
Deny select on Region to Creadorsp_helprotect null, creador
sp_helplogins creador--11Create Role Consulta

Grant select on database:: Northwind to consulta
Grant Execute on database:: Northwind to consulta

Execute sp_addrolemember Consulta, Creador

sp_helplogins creador

Use Northwind
go
Execute sp_droprolemember Consulta, Creador--12.Create application role Actualiza_Detalle_Orden
with password = 'maestria2018'

Grant select on [dbo].[Order Details] to Actualiza_Detalle_Orden
Grant update on [dbo].[Order Details] to Actualiza_Detalle_Orden
Grant insert on [dbo].[Order Details] to Actualiza_Detalle_Orden

Execute sp_setapprole
Actualiza_Detalle_orden, 'maestria2018'

Grant select on [dbo].[Orders] to Actualiza_Detalle_Orden

sp_unsetapprole--13.use AdventureWorks2012
go
sp_adduser Creador, visitanteGrant select on Schema :: Production to VisitanteGrant execute on Schema :: dbo to VisitanteDeny select on production.Product to VisitanteRevoke select on Schema :: Production to Visitante
Revoke execute on Schema :: dbo to Visitante
Revoke select on production.Product to Visitante--Los usuarios que han recibido permisos para crear tablas, pueden crear tablas en los
--esquemas de su propiedad.--2.Create login usuarioP with password = 'Durodematar'Create User prueba from Login usuarioPsp_helpuser