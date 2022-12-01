Create table #Movimiento(
IdC int primary key identity(1,1) not null,
Tipo varchar(20) not null,
Monto int not null,
Fecha datetime not null,

)



create table CuentaBanco(
IdTransac int primary key not null,
Monto int not null,
Fecha datetime not null

)

Create table CuentaL(
IdCuenta int primary key not null,
PNC nvarchar(20) not null,
SNC nvarchar(20) not null,
PAC nvarchar(20) not null,
SAC nvarchar(20) not null,
Monto int not null


)







create database PracticaExamen

use PracticaExamen

create table Libros(
Id_Libro int primary key identity(1,1) not null,
Nombre_Libro varchar(70) not null,
Cant_Paginas int not null,
Autor varchar(25) not null,
Editorial varchar(25) null

)

create table Miembros(
Id_Miembros int primary key identity(1,1) not null,
PN varchar(25) not null,
SN varchar(25),
PA varchar(25) not null,
SA varchar(25),
Estado_M bit default 1


)

Create table Prestamos(
Id_Prestamo int primary key identity(1,1) not null,
Id_Miembros int not null,
Id_Libro int not null,


constraint PK_Prestamos_Miembros
foreign key (Id_Miembros) references Miembros(Id_Miembros)
     ON UPDATE CASCADE
	 ON DELETE CASCADE,
constraint PK_Prestamos_Libros
foreign key (Id_Libro) references Libros
     ON UPDATE CASCADE
	 ON DELETE CASCADE,



)
