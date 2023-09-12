# workshopBD
Repositorio donde se almacena y gestiona la solución del workshop de bases de datos, incluyendo el diagrama entidad relacion y los scripts para la creación de la BD, la inserción de datos y las consultas propuestas

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
