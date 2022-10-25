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
