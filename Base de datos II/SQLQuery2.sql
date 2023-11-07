use master

use CentroEducativo



Create table Empleado (Codigo int, nombre varchar)

Insert into Empleado values (1, 'Oscar')

Backup database CentroEducativo
to disk = 'D:\Respaldos BD\CentroEducativo.bak'
with 
name = 'Backup Full',
Description= 'Backup Full CentroEducativo 20/02/2023'


Restore headeronly from disk = 'D:\Respaldos BD\CentroEducativo.bak'

Insert into Empleado values (2, 'Pedro')

Backup database CentroEducativo
to disk = 'D:\Respaldos BD\CentroEducativo.bak'
with 
name = 'Backup Diferencial I',
Description= 'Backup Diferencial CentroEducativo 20/02/2023',
Differential

Insert into Empleado values (3, 'Maria')

Backup log CentroEducativo
to disk = 'D:\Respaldos BD\CentroEducativo.bak'
with 
name = 'Backup Log 1',
Description= 'Primer Backup log de CentroEducativo 20/02/2023'

Insert into Empleado values (4, 'Julieta')

Backup database CentroEducativo
to disk = 'D:\Respaldos BD\CentroEducativo.bak'
with 
name = 'Backup Full',
Description= 'Backup Full CentroEducativo 20/02/2023'

use master
Drop database CentroEducativo

Restore database CentroEducativo
from disk ='D:\Respaldos BD\CentroEducativo.bak'
with file = 3,  --2,3,4,5
norecovery -- utilizar "recovery" para terminar la recuperación de la BD

use CentroEducativo
go

Select * from Respaldo
