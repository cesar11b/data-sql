create database SVenta



restore database SVenta from disk='C:\Users\CCBB\Downloads\SVenta.bak'
with replace



create table HistorialDev(

Id_producto int not null,
Desc_Producto nvarchar(20) not null,
Id_Fabricante char(5) not null,
Precio int not null,
cantidadDev int not null,




)
use SVenta



--actualizar inventario
create trigger ActInv
on Det_Ventas after insert
as 
update Articulos set cantidadex=cantidadex-(select cantidadv from inserted) from Articulos p, Det_Ventas v
where p.Id_Producto=v.Id_Producto


--nueva venta


create procedure NDV
@IDV int,
@IP char(5),
@cv int
as
declare @idventa int
set @idventa=(select Id_Venta from Ventas where Id_Venta=@IDV)
declare @codp as char(5)
set @codp=(select Id_Producto from Articulos where Id_Producto=@IP)
declare @exp as int
set @exp=(select cantidadex from Articulos where Id_Producto=@IP)
if(@idventa=@IDV)
begin
  if(@IP='')
  begin
    print 'No puede ser nulo'
  end
  else
  begin
    if(@IP=@codp)
	begin
	  if(@cv<=@exp)
	  begin
	    insert into Det_Ventas values(@IDV,@IP,@cv,dbo.CSTP(@IP,@cv))
	  end
	  else
	  begin
	    print 'Inventario insuficiente'
	  end
	end
	else
	begin
	  print 'Producto no registrado'
	end
  end
end
else
begin
  print 'Venta no registrada'
end






--devoluciones

create procedure Devoluciones
