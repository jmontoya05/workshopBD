drop database if exists dbJardineria;
create database dbJardineria;
use dbJardineria;

create table ubicaciones (
	codigoUbicacion int unsigned primary key auto_increment,
	ciudad varchar(30) not null,
    region varchar(30) not null,
    pais varchar(30) not null,
    codigoPostal varchar(10) not null
);

create table jefes (
	codigoJefe int unsigned primary key auto_increment,
    nombreJefe varchar(30) not null,
    apellidoJefe varchar(30) not null
);

create table oficinas (
	codigoOficina int unsigned primary key auto_increment,
    telefono varchar(20) not null,
    direccion varchar(50) not null,
    codigoUbicacion int unsigned not null,
    foreign key (codigoUbicacion) references ubicaciones(codigoUbicacion)
);

create table empleados (
	codigoEmpleado int unsigned primary key auto_increment,
    nombreEmpleado varchar(30) not null,
    apellido1Empleado varchar(30) not null,
    apellido2Empleado varchar(30),
    extension int not null,
    email varchar(30) not null,
    codigoOficina int unsigned not null,
    codigoJefe int unsigned not null,
    puesto varchar(30) not null,
    foreign key (codigoOficina) references oficinas(codigoOficina),
    foreign key (codigoJefe) references jefes(codigoJefe)
);

create table clientes (
	codigoCliente int unsigned primary key auto_increment,
    nombreCliente varchar(50) not null,
    nombreContacto varchar(30),
    apellidoContacto varchar(30),
    telefono varchar(20) not null,
    fax varchar(15),
    direccion1 varchar(50) not null,
    direccion2 varchar(50),
    codigoUbicacion int unsigned not null,
    codigoEmpleado int unsigned not null,
    limiteCredito float,
    foreign key (codigoUbicacion) references ubicaciones(codigoUbicacion),
    foreign key (codigoEmpleado) references empleados(codigoEmpleado)
);

create table pagos (
	idTransaccion int unsigned primary key auto_increment,
    codigoCliente int unsigned not null,
    formaPago varchar(30) not null,
    fechaPago date not null,
    totalPago float not null,
    foreign key (codigoCliente) references clientes(codigoCliente)
);

create table gamas (
	codigoGama int unsigned primary key auto_increment,
    gama varchar(30) not null,
    descripcion varchar(250) not null,
    urlImagen varchar(250) 
);

create table productos (
	codigoProducto int unsigned primary key auto_increment,
    nombreProducto varchar(50) not null,
    codigoGama int unsigned not null,
    dimensiones varchar(50),
    proveedor varchar(30) not null,
    descripcion varchar(250),
	cantidadStock int not null,
    precioVenta float not null,
    precioProveedor float not null,
	foreign key (codigoGama) references gamas(codigoGama)
);

create table pedidos (
	codigoPedido int unsigned primary key auto_increment,
    fechaPedido date not null,
    fechaEsperada date not null,
    fechaEntrega date not null,
    estado varchar(20) not null,
    comentarios varchar(250),
    codigoCliente int unsigned not null,
    foreign key (codigoCliente) references clientes(codigoCliente)
);

create table detallesPedido (
	codigoDetalle int unsigned primary key auto_increment,
    codigoPedido int unsigned not null,
    codigoProducto int unsigned not null,
    cantidad int unsigned not null,
    precioUnidad float not null,
    foreign key (codigoPedido) references pedidos(codigoPedido),
    foreign key (codigoProducto) references productos(codigoProducto)
);


    