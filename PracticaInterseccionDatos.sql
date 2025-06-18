-- Más países
insert into Pais (nombre) values ('Italia'), ('Alemania');

-- Más provincias
insert into Provincia (nombre, id_pais) values ('Roma', 1), ('Berlín', 2);

-- Más localidades
insert into Localidad (nombre, id_provincia) values ('Trastevere', 3), ('Mitte', 4);

-- Más direcciones
insert into Direccion (tipo_via, nombre, numero, id_localidad) values
('Vía', 'Appia', 50, 5),
('Straße', 'Unter den Linden', 15, 6);

-- Más personas
insert into Persona (dni, nombre, apellidos, id_direccion, telefono, fecha_nac) values
('33445566D', 'Carla', 'Rossi', 3, '612345679', '1985-02-20'),
('55667788E', 'Hans', 'Schmidt', 4, '698765433', '1978-09-10');
select * from Persona;
-- Más fontaneros
insert into fontanero (dni_persona, especialidad, coordina) values
('33445566D', 'Mantenimiento de calefacción', null),
('55667788E', 'Reparación de bombas', '55667788E');

-- Más clientes
insert into Cliente (dni_persona, email) values
('33445566D', 'ana.gomez@example.com');


-- Insertar más servicios de instalación
insert into Servicio_instalacion (fecha, descripcion, fontanero) values
('2025-07-10', 'Reparación de bomba de agua', '55667788E'),
('2025-08-05', 'Instalación de calefacción', '33445566D');

-- Más valoraciones
insert into Valoracion (codigo, descripcion, puntuacion, cliente) values
('VAL002', 'Servicio rápido y eficiente', 8, '99887766F'),
('VAL003', 'Muy profesional', 10, '66778899G');

-- Más pedidos
insert into Pedido (codigo, id_direccion, observaciones, cliente, servicio_instalacion) values
('PED002', 4, 'Urgente', '99887766F', 2),
('PED003', 5, 'Instalación programada', '66778899G', null);

-- Más pagos
insert into Pago (codigo, fecha, cantidad) values
('PAG002', '2025-07-11', 200),
('PAG003', '2025-08-06', 500);

-- Más pagos con tarjeta
insert into Tarjeta (cod_pago, nombre_titular, num_tarjeta, fecha_vencimiento, tipo_tarjeta) values
('PAG002', 'Ana Gomez', 1234567890123456, '2027-06-30', 'Visa'),
('PAG003', 'Max Mustermann', 9876543210987654, '2028-12-31', 'Mastercard');

-- Más facturas
insert into Factura (codigo, fecha, precio, pedido, pago) values
('FAC002', '2025-07-11', 200.00, 'PED002', 'PAG002'),
('FAC003', '2025-08-06', 500.00, 'PED003', 'PAG003');

-- Más proveedores
insert into Proveedor (CIF, nombre, correo_electronico, telefono) values
('B98765432', 'Proveedor B', 'contacto@proveedorb.com', '601234567'),
('C13579246', 'Proveedor C', 'contacto@proveedorc.com', '602345678');

-- Más productos
insert into Producto (codigo, nombre, precio, categoria, stock, marca, proveedor) values
('PRO002', 'Bomba de agua', 120.00, 'Equipamiento', 25, 'MarcaY', 'B98765432'),
('PRO003', 'Caldera', 850.00, 'Equipamiento', 10, 'MarcaZ', 'C13579246');

-- Más detalles de producto
insert into Detalles_producto (codigo, descripcion, producto) values
('DET002', 'Bomba de agua para sistemas de presión', 'PRO002'),
('DET003', 'Caldera de alta eficiencia', 'PRO003');

-- Más relaciones contiene
insert into contiene (codigo_factura, codigo_detalles) values
('FAC002', 'DET002'),
('FAC003', 'DET003');
