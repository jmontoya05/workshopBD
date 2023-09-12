use dbJardineria;

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
select o.codigoOficina, u.ciudad 
from oficinas o
inner join ubicaciones u on u.codigoUbicacion = o.codigoUbicacion
order by o.codigoOficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
select u.ciudad, o.telefono 
from oficinas o
inner join ubicaciones u on u.codigoUbicacion = o.codigoUbicacion
where u.pais = "España";

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo 
-- jefe tiene un código de jefe igual a 7
select e.nombreEmpleado, e.apellido1Empleado, e.apellido2Empleado, e.email, j.nombreJefe
from empleados e
inner join jefes j on j.codigoJefe = e.codigoJefe
where j.codigoJefe = 7;

-- 4. Devuelve un listado con el código de cliente de aquellos clientes que 
-- realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar 
-- aquellos códigos de cliente que aparezcan repetidos
select c.codigoCliente, count(p.idTransaccion) as cantidadDePagos
from clientes c
inner join pagos p on p.codigoCliente = c.codigoCliente
where year(p.fechaPago) = 2008
group by c.codigoCliente;

-- 5. ¿Cuántos empleados hay en la compañía?
select count(codigoEmpleado) as cantidadEmpleados
from empleados;

-- 6. ¿Cuántos clientes tiene cada país?
select u.pais, count(c.codigoCliente) as cantidadClientes
from clientes c
inner join ubicaciones u on u.codigoUbicacion = c.codigoUbicacion
group by u.pais
order by cantidadClientes desc; 

-- 7. ¿Cuál fue el pago medio en 2009?
select round(avg(totalPago),2) as pagoPromedio
from pagos
where year(fechaPago) = 2009;

-- 8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma 
-- descendente por el número de pedidos.
select u.region, count(p.codigoPedido) as cantidadPedidos
from ubicaciones u
inner join clientes c on c.codigoUbicacion = u.codigoUbicacion
inner join pedidos p on p.codigoCliente = c.codigoCliente
group by u.region
order by cantidadPedidos desc;

-- 9. Calcula el precio de venta del producto más caro y barato en una misma 
-- consulta.
select 
	(select max(precioVenta) from productos) as precioMasCaro,
	(select min(precioVenta) from productos) as precioMasBarato;
    
-- 10. Devuelve el nombre del cliente con mayor límite de crédito.
select nombreCliente, limiteCredito
from clientes 
where limiteCredito = (select max(limiteCredito) from clientes);

-- 11. Devuelve el nombre del producto que tenga el precio de venta más caro
select nombreProducto, precioVenta
from productos
where precioVenta = (select max(precioVenta) from productos);

-- 12. Devuelve el nombre del producto del que se han vendido más unidades.
select d.codigoProducto, p.nombreProducto, sum(cantidad) as cantidadVentas
from detallesPedido d
inner join productos p on p.codigoProducto = d.codigoProducto
group by codigoProducto
order by cantidadVentas desc
limit 1;

-- 13. Los clientes cuyo límite de crédito sea mayor que los pagos que haya 
-- realizado. (Sin utilizar INNER JOIN)
select c.codigoCliente, c.nombreCliente, c.limiteCredito 
from clientes c
where limiteCredito > (
		SELECT SUM(totalPago)
		FROM pagos p
		WHERE p.codigoCliente = c.codigoCliente
);

-- 14. Devuelve el listado de clientes indicando el nombre del cliente y cuantos 
-- pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no 
-- han realizado ningún pedido.
select c.nombreCliente, count(p.codigoPedido) as cantidadPedidos
from clientes c
left join pedidos p on p.codigoCliente = c.codigoCliente
group by c.nombreCliente
order by cantidadPedidos desc;

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos 
-- empleados que no sean representante de ventas de ningún cliente
select e.codigoEmpleado, e.nombreEmpleado, e.apellido1Empleado, e.apellido2Empleado, e.puesto, o.telefono
from empleados e
inner join oficinas o on o.codigoOficina = e.codigoOficina 
where (select count(c.codigoEmpleado)
		from clientes c
		where c.codigoEmpleado= e.codigoEmpleado) = 0
order by e.codigoEmpleado;

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que 
-- hayan sido los representantes de ventas de algún cliente que haya realizado 
-- la compra de algún producto de la gama Frutales
select * from oficinas o
where o.codigoOficina not in(
	select e.codigoOficina from empleados e
	inner join clientes c on c.codigoEmpleado = e.codigoEmpleado
	inner join pedidos pe on c.codigoCliente = pe.codigoCliente
	inner join detallespedido d on d.codigoPedido = pe.codigoPedido
	inner join productos pr on pr.codigoProducto = d.codigoProducto
	inner join gamas g on g.codigoGama = pr.codigoGama
	where g.gama = "Frutales");

-- 17. Devuelve el listado de clientes indicando el nombre del cliente y cuantos 
-- pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no 
-- han realizado ningún pedido
select c.nombreCliente, count(p.codigoPedido) as cantidadPedidos
from clientes c
left join pedidos p on p.codigoCliente = c.codigoCliente
group by c.nombreCliente
order by cantidadPedidos desc;

-- 18. Devuelve un listado con los nombres de los clientes y el total pagado por 
-- cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han 
-- realizado ningún pago
select c.codigoCliente, c.nombreCliente, round(sum(p.totalPago),2) as totalPagado 
from clientes c
left join pagos p on c.codigoCliente = p.codigoCliente
group by c.codigoCliente;
