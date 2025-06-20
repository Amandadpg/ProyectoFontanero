insert into Pais (nombre) values 
	('Italia'), 
    ('España'),
    ('Francia'),
    ('Australia'),
    ('Alemania');

insert into Provincia (nombre, id_pais) values 
	('Madrid', 2), 
    ('Sevilla', 2),
    ('Sicilia', 1),
    ('Cerdeña', 1),
    ('Paris ', 3),
    ('Gironde ', 3);

insert into Localidad (nombre, id_provincia) values 
	('Fuenlabrada', 1), 
    ('Alcalá de Henares', 1), 
    ('Alcalá de Guadaíra', 2), 
    ('Mairena del Alcor', 2), 
    ('Siracusa', 3), 
    ('Ragusa', 3), 
    ('Oristano', 4), 
    ('Carbonia', 4), 
    ('Lormont', 6);

insert into Direccion (tipo_via, nombre, numero, id_localidad) values
	('Calle', 'Leganés', 12, 1),
	('Avenida', 'Complutense', 22, 2),
	('Calle', 'Oromana', 8, 3),
	('Plaza', 'Antonio Mairena', 5, 4),
	('Via', 'Elorina', 34, 5),
	('Corso', 'Italia', 17, 6),
	('Via', 'Cagliari', 10, 7),
	('Viale', 'Gramsci', 25, 8),
	('Rue', 'des Arts', 19, 9);

insert into Persona (dni, nombre, apellidos, id_direccion, telefono, fecha_nac) values
	('12345678A', 'Laura', 'Martínez Ruiz', 1, '612345678', '1990-05-14'),
	('23456789B', 'Carlos', 'Sánchez López', 2, '678901234', '1985-11-23'),
	('34567890C', 'Lucía', 'Gómez Pérez', 2, '690112233', '1992-03-05'),
	('45678901D', 'Antonio', 'Morales García', 4, '600334455', '1980-07-19'),
	('56789012E', 'Giulia', 'Conti', 3, '331112233', '1995-08-08'),
	('67890123F', 'Marco', 'Ferraro', 6, '331234567', '1988-12-30'),
	('78901234G', 'Elena', 'Piras', 7, '340556677', '1991-02-17'),
	('89012345H', 'Davide', 'Carboni', 8, '340998877', '1983-09-09'),
	('90123456I', 'Claire', 'Dubois', 6, '0612345678', '1996-06-01'),
	('11234567J', 'Sofía', 'Jiménez Torres', 5, '620111222', '2000-01-15'),
	('22345678K', 'Javier', 'López Serrano', 1, '679998877', '1994-10-21');


insert into fontanero (dni_persona, especialidad, coordina) values
	('12345678A', 'Mantenimiento de calefacción', null),
	('23456789B', 'Reparación de bombas', '12345678A'),
	('34567890C', 'Instalación de aire acondicionado', '12345678A'),
	('56789012E', 'Mantenimiento de calderas', '12345678A'),
	('67890123F', 'Reparación de bombas', '23456789B');

insert into Cliente (dni_persona, email) values
	('78901234G', 'ana.gomez@icloud.com'),
	('89012345H', 'davide.carmoni@gmail.com'),
	('90123456I', 'claire.dubois@gmail.com'),
	('11234567J', 'sofia.jimenez@icloud.com'),
	('22345678K', 'javier.lopez@gmail.com');


insert into Servicio_instalacion (fecha, descripcion, fontanero) values
	('2025-07-10', 'Reparación de bomba de agua', '12345678A'),
	('2025-08-05', 'Instalación de calefacción', '23456789B'),
	('2025-09-15', 'Mantenimiento de tuberías', '34567890C'),
	('2025-10-01', 'Revisión de calentador', '56789012E'),
	('2025-11-10', 'Cambio de válvula', '67890123F');

insert into Valoracion (codigo, descripcion, puntuacion, cliente) values
	('VAL002', 'Servicio rápido y eficiente', 8, '78901234G'),
	('VAL003', 'Muy profesional', 9, '89012345H'),
	('VAL004', 'Llegaron a tiempo y resolvieron el problema', 7, '90123456I'),
	('VAL005', 'Excelente atención al cliente', 10, '11234567J'),
	('VAL006', 'Recomendable 100%', 9, '22345678K');

insert into Pedido (codigo, id_direccion, observaciones, cliente, servicio_instalacion) values
	('PED002', 4, 'Urgente', '78901234G', 2),
	('PED003', 5, 'Instalación programada', '89012345H', NULL),
	('PED004', 3, 'Requiere atención especial', '90123456I', 1),
	('PED005', 6, 'Entrega en horario de tarde', '11234567J', 3),
	('PED006', 2, 'Cliente solicita llamada previa', '22345678K', NULL);

insert into Pago (codigo, fecha, cantidad) values
	('PAG002', '2025-07-11', 200),
	('PAG003', '2025-08-06', 500),
	('PAG004', '2025-08-20', 350),
	('PAG005', '2025-09-01', 150),
	('PAG006', '2025-09-10', 400);

INSERT INTO Efectivo (cod_pago, cambio) VALUES
	('PAG002', 50),
	('PAG003', 20);


insert into Tarjeta (cod_pago, nombre_titular, num_tarjeta, fecha_vencimiento, tipo_tarjeta) values
	('PAG004', 'Ana Gomez', 1234567890123456, '2027-06-30', 'Visa'),
	('PAG005', 'Max Mustermann', 9876543210987654, '2028-12-31', 'Mastercard'),
	('PAG006', 'Carlos Perez', 4567123498761234, '2026-11-15', 'Visa');

insert into Factura (codigo, fecha, precio, pedido, pago) values
	('FAC002', '2025-07-11', 200.00, 'PED002', 'PAG002'),
	('FAC003', '2025-08-06', 500.00, 'PED003', 'PAG003'),
	('FAC004', '2025-08-20', 350.00, 'PED004', 'PAG004'),
	('FAC005', '2025-09-01', 150.00, 'PED005', 'PAG005'),
	('FAC006', '2025-09-10', 400.00, 'PED006', 'PAG006');

insert into Proveedor (CIF, nombre, correo_electronico, telefono) values
	('B98765432', 'Fontanería Soluciones', 'contacto@solucionesfont.com', '601234567'),
	('C13579246', 'Materiales Hidráulicos', 'ventas@materialeshidraulicos.com', '602345678'),
	('D24681357', 'Equipos Clima S.L.', 'info@equiposclima.com', '603456789'),
	('E35792468', 'Suministros Agua Pura', 'pedidos@aguapura.com', '604567890'),
	('F46813579', 'Techos y Tubos S.A.', 'contacto@techostubos.com', '605678901');

insert into Producto (codigo, nombre, precio, categoria, stock, marca, proveedor) values
	('PRO002', 'Bomba de agua', 120.00, 'Equipamiento', 25, 'MarcaY', 'B98765432'),
	('PRO003', 'Caldera', 850.00, 'Equipamiento', 10, 'MarcaZ', 'C13579246'),
	('PRO004', 'Válvula de seguridad', 35.50, 'Repuestos', 50, 'MarcaX', 'B98765432'),
	('PRO005', 'Termostato digital', 45.00, 'Accesorios', 40, 'MarcaA', 'D24681357'),
	('PRO006', 'Tubería PVC 1/2"', 15.75, 'Materiales', 100, 'MarcaB', 'E35792468'),
	('PRO007', 'Llave inglesa', 20.00, 'Herramientas', 30, 'MarcaC', 'F46813579');

insert into Detalles_producto (codigo, descripcion, producto) values
	('DET002', 'Bomba de agua para sistemas de presión', 'PRO002'),
	('DET003', 'Caldera de alta eficiencia', 'PRO003'),
	('DET004', 'Válvula de seguridad para prevención de sobrepresión', 'PRO004'),
	('DET005', 'Termostato digital programable con pantalla LCD', 'PRO005'),
	('DET006', 'Tubería PVC resistente a altas temperaturas', 'PRO006'),
	('DET007', 'Llave inglesa ajustable de acero inoxidable', 'PRO007');

insert into contiene (codigo_factura, codigo_detalles) values
	('FAC002', 'DET002'),
	('FAC003', 'DET003'),
	('FAC002', 'DET004'),
	('FAC003', 'DET005');
