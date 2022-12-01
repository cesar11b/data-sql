create database CINEMARK

USE CINEMARK

create table Tickets(
Id_Ticket int primary key identity(1,1) not null,
Salas int not null,
Peliculas int not null,
Precio int not null

Constraint PK_Tickets_Salas
foreign key (Salas) references Salas(Id_Sala),
       
constraint PK_Tickets_Peliculas
foreign key (Peliculas) references Peliculas(Id_Pelicula)
      


)

Create table VentasT(
Id_Venta int identity (1,1) primary key not null,
Fecha_Venta datetime default getdate() not null,
TotalV float not null
)

create table TotalV(
Vendidos int

)










create table Salas(
Id_Sala int primary key identity(1,1) not null,
Capacidad_Sala int not null,
Peliculas int,
constraint PK_Salas_Peliculas
foreign key (Peliculas) references Peliculas(Id_Pelicula)
       on update cascade
	   on delete cascade,





)


create table Peliculas(
Id_Pelicula int primary key identity(1,1) not null,
Nombre_Pelicula nvarchar(75) not null,
Genero_Pelicula char(15) not null,
	

)

create table Menu_Ind(
Id_Producto int identity (1,1) primary key not null,
Nombre_Prod char(30),
Descripcion varchar(100),
Precio_Prod int,
Id_Tienda int,

constraint PK_Menu_Ind_Tiendas
foreign key (Id_Tienda) references Tiendas(Id_Tienda)
       on update cascade
	   on delete cascade,
Tipo int default 0
)


create table Tiendas(
Id_Tienda int identity (1,1) primary key not null,


)

create table Menu_Combo(
Id_Producto int identity (1,1) primary key not null,
Nombre_Prod char(30),
Descripcion varchar(100),
Precio_Prod int,
Id_Tienda int,

constraint PK_Menu_Combo_Tiendas
foreign key (Id_Tienda) references Tiendas(Id_Tienda)
       on update cascade
	   on delete cascade,
tipo int default 1
)



Create table Ventas(
Id_Venta int identity (1,1) primary key not null,
Fecha_Venta datetime default getdate() not null,
Id_Tienda int foreign key references Tiendas(Id_Tienda) not null,
Tipo bit,
TotalV float not null
)

CREATE PROCEDURE NVenta
@IDTI INT,
@T bit,
@C float
as

if(@T<2)
begin
   
   INSERT INTO Ventas Values(getdate(),@T,@C)

end
else
begin
     print 'se dbe especificar el tipo de producto (0=Individual, 1=Combo)'
	 END

NVenta 0,1



create procedure NVentaT
@CT int
as
declare @v as int
set @v=(Vendidos from TotalV)
if(@v<=200-@CT)
begin
 
     insert into VentasT values(getdate(),@CT)
   
end
else
begin
  print 'No hay asientos disponibles'
  end
NVentaT '3'


create trigger ActV
on VentasT
after insert
as
    DECLARE @CV int=(select TotalV from inserted)
    update TotalV set Vendidos=Vendidos+@CV
  

