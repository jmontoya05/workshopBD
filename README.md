# Workshop Bases de Datos
Repositorio donde se almacena y gestiona la solución del workshop de bases de datos, incluyendo el diagrama entidad relacion y los scripts para la creación de la BD, la inserción de datos y las consultas propuestas

## Enunciado

En MAKAIA Jardinería se solicita desarrollar un modelo de datos donde para cada uno de sus clientes se deben almacenar datos como código cliente, nombre cliente, nombre contacto, apellido 
contacto, teléfono, fax, direccion1, direccion2, ciudad, región, país, código postal, código empleado, limite crédito. 

Cada uno de los clientes podrá realizar muchos pedidos conformados por código pedido, fecha de pedido, fecha esperada, fecha entrega, estado, comentarios, código cliente. A su vez el cliente podrá 
realizar muchos pagos donde se guardará código cliente, forma pago, id transacción, fecha pago, total por cada pago.

Todos los clientes siempre estarán asociados a un único empleado, pero cada uno de los empleados puede estar asociado a uno o mas clientes; Es relevante que de cada uno de los empleados se 
almacene código empleado, nombre, apellido1, apellido2, extensión, email, código oficina, código jefe, puesto. Cada empleado tendrá un único jefe y está relación se identificará mediante el código 
del jefe. A su vez cada empleado deberá estar asociado a una oficina existente de la cual se tiene la siguiente información: código oficina, ciudad, país, región, código postal, teléfono, direccion.
Para MAKAIA es importante llevar un preciso inventario de todos los productos que hay disponibles y para este control es necesario que se tenga: código producto, nombre, gama, dimensiones, 
proveedor, descripción, cantidad en stock, precio venta, precio proveedor.

Todos los productos pertenecerán a una gama de productos donde se indicará la gama a la que pertenecen, una descripción y una imagen asociada. Es importante tener en cuenta que cada gama de productos 
puede contener varios productos.

Por último hay que detallar cada uno de los pedidos realizados por los clientes donde se contendrán los productos comprados y allí se deberá guardar el código del pedido, el código del producto, la 
cantidad y el precio por unidad



![Descripción de la imagen](https://i.ibb.co/T0Gsh91/db-Jardineria.png)



## Consultas

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo
jefe tiene un código de jefe igual a 7.
4. Devuelve un listado con el código de cliente de aquellos clientes que
realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
• Utilizando la función YEAR de MySQL.
• Utilizando la función DATE_FORMAT de MySQL.
5. ¿Cuántos empleados hay en la compañía?
6. ¿Cuántos clientes tiene cada país?
7. ¿Cuál fue el pago medio en 2009?
8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
descendente por el número de pedidos.
9. Calcula el precio de venta del producto más caro y barato en una misma
consulta.
10. Devuelve el nombre del cliente con mayor límite de crédito.
11. Devuelve el nombre del producto que tenga el precio de venta más caro.
12. Devuelve el nombre del producto del que se han vendido más unidades.
(Tenga en cuenta que tendrá que calcular cuál es el número total de
unidades que se han vendido de cada producto a partir de los datos de la
tabla detalle_pedido)
13. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
realizado. (Sin utilizar INNER JOIN).
14. Devuelve el listado de clientes indicando el nombre del cliente y cuantos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.
15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
empleados que no sean representante de ventas de ningún cliente.
16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
hayan sido los representantes de ventas de algún cliente que haya realizado
la compra de algún producto de la gama Frutales.
17. Devuelve el listado de clientes indicando el nombre del cliente y cuantos
pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
han realizado ningún pedido.
18. Devuelve un listado con los nombres de los clientes y el total pagado por
cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
realizado ningún pago.
