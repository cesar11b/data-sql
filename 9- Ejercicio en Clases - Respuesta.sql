
-- Ejercicio de asignación de permisos


/* Realizar un inicio de sesión con usuario dentro de la bd northwind
   con los siguientes permisos:

   */
  
   create login sesion5 with password = '123456'
   exec sp_adduser sesion5,Usuario5

   
   /*
   - Asignar el rol ddladmin
   
   */
    exec sp_addrolemember [db_ddladmin],usuario5
   
   /* Negar los permisos de creación de vistas y procedimientos
     almacenados */
	Deny create procedure to Usuario5
	Deny create view to Usuario5
   /*Crear un rol de base de datos llamado: Auditoria*/
   create role Auditoria
   /* Asignar al rol lospermisos de: 
	    - Selección en todas las tablas
		- Escritura en las tablas de employees, customers y categories
		- Permisos de actualizado en los campos country y city en la tabla
		  de empleados */
		  Grant select on Schema:: dbo to Auditoria
		  Grant insert on dbo.Employees to Auditoria
		  Grant insert on dbo.Customers to Auditoria
		  Grant insert on dbo.Categories to Auditoria
		  Grant update on dbo.Employees(Country,City) to Auditoria

		 /*
  - Asignar el rol de auditoria al usuario
  */

  exec sp_addrolemember Auditoria, Usuario5
  --Negarle el permiso de selección en la tabla orders y order details

  deny select on dbo.Orders to Usuario5
  deny select on [dbo].[Order details] to Usuario5


  






  