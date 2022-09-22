
--insertar clinete de tabla consumidor

alter table Consumidor add EstadoCons bit default 1
update Consumidor set EstadoCons=1
select *from Consumidor

create procedure NCons
@IDC int,@PNC nvarchar(15),@SNC nvarchar(15),@PAC nvarchar(15),
@SAC nvarchar(15),@Dir nvarchar(70),@Pais nvarchar(20),@SaldoInic float,
@SaldoActual float
as
declare @idco as int
set @idco=(select Id_Cliente from Consumidor
where Id_Cliente=@idco)
if(@PNC='' or @SNC='' or @PAC='' or @SAC='' or @Dir='' or @Pais=''or @SaldoInic='' or @SaldoActual='')
begin
print 'el valor de entrada no puede estar vacio'
end
else
begin
if(@IDC=@idco)
begin
print 'El cliente esta duplicado'
end
else
begin
insert into Consumidor values(@PNC,@SNC,@PAC,@SAC,@Dir,@Pais,@SaldoInic,@SaldoActual,1,@IDC)
end
end

select * from Consumidor

NCons 1,'evelyn','estefania','guzman','aguirre','del ivan montenegro 6 cuadras al este','Nicaragua',200,1200




--Dar baja

create procedure BCons

@ID int
as 
declare @idcons as int
set @idcons=(Select Id_Cliente from Consumidor where Id_Cliente=@ID)
if(@idcons=@ID)
begin
 update Consumidor set EstadoCons=0 where Id_Cliente=@ID
end
else
begin
 print 'El cliente pedido no se ha encontrado o no existe'
end


Bcons 5


select * from Consumidor






--Buscar Consumidor

create procedure BuscarC
@ID int
as
declare @idd as int
set @idd =(select Id_Cliente from Consumidor where Id_Cliente =@ID)
if(@ID=@idd)
begin 
 select * from Consumidor where Id_Cliente=@ID
end 
else
begin
 print 'El cliente pedido no ha sido encontrado'
end 

BuscarC 2






 --Listar Clientes
 
create procedure ListarC
as
select * from Consumidor

ListarC





--Modificacin o Actualizacion

create procedure MCons
@Id int,
@PNC nvarchar(15),
@SNC nvarchar(15),
@PAC nvarchar(15),
@SAC nvarchar(15),
@Dir nvarchar(70),
@Pais nvarchar(20),
@SalInic float,
@SalAct float,
@EstadoCons bit
as
declare @idd as int
set @idd =(select Id_Cliente from Consumidor where Id_Cliente =@Id)
if(@Id=@idd)
begin 
  if(@PNC='')
  begin 
   print'No puede ser nulo'
  end
  else
  begin
   
   update Consumidor set PNC=@PNC, SNC=@SNC, PAC=@PAC, SAC=@SAC, Direccion=@Dir,Pais=@Pais,SaldoInic=@SalInic,SaldoAct=@SalAct where Id_Cliente=@Id and @EstadoCons=1
  end 
end
else
begin
 print 'cliente no encontrado'
end 


