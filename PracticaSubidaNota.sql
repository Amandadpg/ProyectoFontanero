drop database if exists fontanero;
create database fontanero;
use fontanero;

create table Pais ( 
	id int auto_increment primary key,
    nombre varchar(75)
);

create table Provincia (
	id int auto_increment primary key,
    nombre varchar(75),
    id_pais int,
    constraint fk_provincia_pais foreign key (id_pais) references pais(id)
);

create table Localidad (
	id int auto_increment primary key,
    nombre varchar(75),
    id_provincia int,
    constraint fk_localidad_provincia foreign key (id_provincia) references provincia(id)
);

create table Direccion (
	id_direccion int auto_increment primary key,
    tipo_via varchar(75),
    nombre varchar(75),
    numero int,
    id_localidad int,
    constraint fk_direccion_localidad foreign key (id_localidad) references localidad(id)
);

create table Persona ( 
	dni char(9) primary key,
    nombre varchar(75),
    apellidos varchar(120),
    id_direccion int,
    telefono int, 
    fecha_nac date,
    constraint fk_persona_direccion foreign key (id_direccion) references direccion(id_direccion)
);

create table fontanero (
    dni_persona char(9) primary key,
    especialidad varchar(80),
    coordina char(9),
    constraint fk_coordina_fontanero foreign key (coordina) references fontanero(dni_persona),
    constraint fk_fontanero_persona foreign key (dni_persona) references persona(dni)
);

create table Servicio_instalacion (
	id int auto_increment primary key,
    fecha date,
    descripcion varchar(150),
    fontanero char(9) not null,
    constraint fk_servicio_fontanero foreign key (fontanero) references fontanero(dni_persona)
);


create table Cliente (
	dni_persona char(9) primary key,
    email varchar(100),
    constraint fk_cliente_persona foreign key (dni_persona) references Persona(dni)
);

create table Valoracion (
	codigo char(6) primary key,
    descripcion varchar(120),
    puntuacion int,
    cliente char(9),
    constraint fk_valoracion_cliente foreign key (cliente) references cliente(dni_persona),
	constraint chk_puntuacion check (puntuacion between 1 and 10)
);

create table Pedido (
	codigo char(6) primary key,
    id_direccion int,
    observaciones varchar(150),
    cliente char(9),
    servicio_instalacion int,
    constraint fk_pedido_direccion foreign key (id_direccion) references direccion(id_direccion),
	constraint fk_pedido_cliente foreign key (cliente) references cliente(dni_persona),
    constraint fk_pedido_servicio foreign key (servicio_instalacion) references servicio_instalacion(id)
); 

create table Pago (
	codigo char(6) primary key,
    fecha date,
    cantidad int,
    constraint chk_pago check (cantidad > 0)
);

create table Efectivo (
	cod_pago char(6) primary key,
    cambio int,
    constraint fk_efectivo_pago foreign key (cod_pago) references pago(codigo)
);

create table Tarjeta (
	cod_pago char(6) primary key,
    nombre_titular varchar(75),
    num_tarjeta BIGINT,
    fecha_vencimiento date,
    tipo_tarjeta varchar(80),
	constraint fk_tarjeta_pago foreign key (cod_pago) references pago(codigo)
);

create table Factura (
	codigo char(6) primary key,
    fecha date,
    precio decimal(6,2),
    pedido char(6) not null unique,
    pago char(6) not null unique,
    constraint fk_factura_pedido foreign key (pedido) references pedido(codigo),
    constraint fk_factura_pago foreign key (pago) references pago(codigo),
    constraint chk_factura check (precio >= 0)
);

create table Proveedor (
	CIF char(9) primary key,
    nombre varchar(120),
    correo_electronico varchar(150),
    telefono char(9)
);

create table Producto (
	codigo char(6) primary key,
    nombre varchar(120),
    precio double(6,2),
    categoria varchar(100),
    stock int,
    marca varchar(100),
    proveedor char(9) not null,
    constraint fk_producto_proveedor foreign key (proveedor) references proveedor(CIF)
);

create table Detalles_producto (
	codigo char(6) primary key,
    descripcion varchar(150),
    producto char(6) not null unique,
    constraint fk_detalle_producto foreign key (producto) references producto(codigo)
);

create table contiene (
	codigo_factura char(6),
    codigo_detalles char(6),
    constraint pk_contiene primary key(codigo_factura, codigo_detalles),
    constraint fk_contiene_factura foreign key (codigo_factura) references factura(codigo),
    constraint fk_contiene_detalles foreign key (codigo_detalles) references detalles_producto(codigo)
);



