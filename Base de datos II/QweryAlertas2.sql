

select  from Customers

select * from Customers c
iner join Orders o on c.CustomerID = o.CustomerID



sp_altermessage 156,'with_log','True'

sp_altermessage 102,'with_log','True'

----------------------------------------------------------------------------------


select 
round(sum((od.UnitPrice * od.Quantity) - (1-od.Discount)),2) as Subtotal
from [Order Details] od
inner join Products p on p.ProductID = od.ProductID
where od.OrderID = 10250