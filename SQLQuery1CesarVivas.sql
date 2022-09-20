create database CLINICA
--Sistematico 2m2 is 
use CLINICA

CREATE TABLE Medicos(
CodMedico int primary key not null,
DireccionM nvarchar(50) not null,
PAMedico nvarchar(40) not null,
SaMedico int not null,
SNMedico nvarchar(50) not null,
PNMedico nvarchar(50) not null,

Especialidades nvarchar(30) FOREIGN KEY REFERENCES Especialidades(NombreEsp),
Provincia nvarchar(30) foreign key references Provincia(NombreProv)




)
create table Especialidades(
NombreEsp nvarchar(30) primary key not null,
DescEsp nvarchar(50) not null
	)

create table Provincia(
NombreProv nvarchar(30) primary key not null,
CantidadPoblad int not null,

Poblacion int foreign key references Poblacion(NombrePobl)





)
create table Poblacion(
NombrePobl nvarchar(30) primary key not null,
CantPobl int not null




)
create table Pacientes(
CodPac int primary key not null,
CodPostPac int not null,
DirPac nvarchar(50) not null,
SAPac nvarchar(30) not null,
FNacPac datetime not null,
SNPac nvarchar(30) not null,
PaPac nvarchar(30) not null,
PNPac nvarchar(30) not null,

Provincia Nvarchar(30) foreign key references Provincia(NombreProv)

PacIngres int foreign key references PacIngres(InfoPac)


)
create table Ingresos(

CodIng int primary key not null,
FechaIng datetime not null,
Motivo nvarchar (30) not null,
NHab int not null,
NCama int not null,


Area nvarchar(30) foreign key references AreasClinica(NombreA)

)

create table PacIngres(
InfoPac nvarchar(50) primary key not null,
InfoMedico nvarchar(50) not null,
InfoArea nvarchar(50) not null



)
create table Egresos(


MedicoTratante int foreign key references Medicos(CodMedico),
FechaEg datetime not null,
AreaSal int foreign key references AreasClinica(NombreA)
)

create table AreasClinica(
NombreA nvarchar(30) primary key not null,
DescArea nvarchar(50) not null

Habitaciones int foreign key references Habitaciones(NHab)


)
create table Habitaciones(
Nhab int primary key not null,
TipoHab nvarchar(30) not null,

Cama int foreign key references Camas(NCama)




)
create table Camas(
NCama int primary key not null,
DescCama nvarchar(30) not null

)



