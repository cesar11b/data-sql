


Select * from 
Mantenimiento

Select * from Vehiculo
-- Dimensión del Vehículo
Create view DimVehículo
as
Select 
v.IdVehiculo,
c.PrimerNombre +' '+ c.PrimerApellido as [Nombre Cliente],
v.Año as [Año del Vehículo],
v.Modelo,
v.Marca
from Cliente c
inner join Vehiculo v
on v.IdCliente = c.IdCliente
-----------------------------------------------------------

-- Dimensión Mecánico

Create View DimMecanico
as
Select * from Mecanico

-- Dimensión Servicios
Create view DimServicios 
as
Select * from Servicio

Create view DimFecha
as
Select Distinct m.FechaIngreso,
               year(m.FechaIngreso) as Año,
			   month(m.FechaIngreso) as NoMes,
			   day(m.FechaIngreso) as NoDia,
			   datepart(qq, m.FechaIngreso) as Trimestre

from Mantenimiento m

-- Conformación de tabla de hechos
Create view HechosMantenimiento
as
Select 
-- Llaves Foraneas de Tablas Dimensionales 

m.IdVehiculo,
m.FechaIngreso as IdFecha,
dm.IdMecanico,
dm.IdServicio,
----------- Atributos de Medida
count(*) as [Cantidad Servicios], 
sum(dm.Precio) as [Valor del Servicio],
sum(dm.precio * 0.30) as [Comisión Mecánico],
(Select sum(dr.Precio * dr.Cantidad) from Detalle_Repuesto dr
where dr.IdDetalleMantenimiento = dm.IdDetalleMantenimiento) as [Valor en Repuestos],
(Select count(dr.IdDetalleMantenimiento) from Detalle_Repuesto dr
where dr.IdDetalleMantenimiento = dm.IdDetalleMantenimiento) as [Cantidad de Repuestos]
from Detalle_Mantenimiento dm
inner join Mantenimiento m
on m.IdMantenimiento = dm.IdMantenimiento
Group by 
m.IdVehiculo,
m.FechaIngreso,
dm.IdMecanico,
dm.IdServicio,
dm.IdDetalleMantenimiento,
dm.IdMantenimiento



Select * from Detalle_Mantenimiento

Select * from Servicio