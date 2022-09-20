use PS2
--1. Calculo de Predicado
-- Calculo de predicado de Dominios
--Informacion de los vendededores exceptuando Buenos Aires
--{Vendedores donde Oficina != Buenos Aires}

select * from Vendedor where Oficina != 'Buenos Aires'

Create view VenExcOfiBA
as select * from Vendedor where Oficina != 'Buenos Aires'


--2. Calculo de Predicado
-- Calculo de Predicado de Tuplas
--Informacion de los vendededores con comision menor a 11%
--{Vendedores donde Comision < 11}

select Id_Vendedor, Nomb_Vendedor, Oficina, Comision from 
Vendedor where Comision < 11

Create view VendComiMenor11 as
select Id_Vendedor, Nomb_Vendedor, Oficina, Comision from 
Vendedor where Comision < 11

--3. Calculo de Predicado
-- Calculo de Predicado de Dominios
--Informacion de los vendededores de la oficina Tokyo con comision mayor a 11%
--{Vendedores de Oficina='Tokyo' && Comision > 11}

select Id_Vendedor, Nomb_Vendedor, Oficina, Comision from 
Vendedor where Oficina='Tokyo' and Comision > 11

create view VendTokyoComiMay11 as
select Id_Vendedor, Nomb_Vendedor, Oficina, Comision from 
Vendedor where Oficina='Tokyo' and Comision > 11

--4. Calculo de Predicado
-- Calculo de Predicado de Dominios
--Informacion de los vendededores cuyo jefe tiene id 27 o  con comision mayor a 10%
--{Vendedores con ID_Jefe=27 o Comision > 10}

select * from 
Vendedor where Id_Jefe='27' or Comision > 10

create view VendJefe27ComiMay10 as 
select * from 
Vendedor where Id_Jefe='27' or Comision > 10

--5. Algebra relacional
-- Union
--Se adjunta informacion sobre vendedores y ventas
--A:Ventas B:Vendedores
--A U B

select FechaVenta, Venta.Id_Vendedor, Nomb_Vendedor, Oficina, 
Id_Producto, Id_Cliente,Cantidad from Venta full join Vendedor 
on Venta.Id_Vendedor=Vendedor.Id_Vendedor

Create view VentasXVendedor as
select FechaVenta, Venta.Id_Vendedor, Nomb_Vendedor, Oficina, 
Id_Producto, Id_Cliente,Cantidad from Venta full join Vendedor 
on Venta.Id_Vendedor=Vendedor.Id_Vendedor