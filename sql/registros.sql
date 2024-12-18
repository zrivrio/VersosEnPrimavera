Use versos_en_primavera;

-- USUARIOS
INSERT INTO usuario (nombre, apellido, correo_electronico, telefono, direccion) VALUES
('Gabriel', 'Mendoza', 'gabriel.mendoza@example.com', '3123456789', '123 Main St'),
('Victoria', 'Navarro', 'victoria.navarro@example.com', '2123456789', '456 Oak St'),
('Felipe', 'Jiménez', 'felipe.jimenez@example.com', '2223456789', '789 Pine St'),
('Claudia', 'Méndez', 'claudia.mendez@example.com', '2323456789', '101 Maple St'),
('Juan', 'Castillo', 'juan.castillo@example.com', '2423456789', '202 Elm St'),
('Lorena', 'Cruz', 'lorena.cruz@example.com', '2523456789', '303 Birch St'),
('Antonio', 'Reyes', 'antonio.reyes@example.com', '2623456789', '404 Cedar St'),
('Mónica', 'Ramos', 'monica.ramos@example.com', '2723456789', '505 Walnut St'),
('Rafael', 'Aguilar', 'rafael.aguilar@example.com', '2823456789', '606 Willow St'),
('Patricia', 'Ortiz', 'patricia.ortiz@example.com', '2923456789', '707 Ash St'),
('Fernando', 'Rivas', 'fernando.rivas@example.com', '3023456789', '808 Poplar St'),
('Isabel', 'Martínez', 'isabel.martinez@example.com', '3123456789', '909 Spruce St'),
('José', 'Pérez', 'jose.perez@example.com', '3223456789', '1010 Fir St'),
('Ana', 'García', 'ana.garcia@example.com', '3323456789', '1111 Palm St'),
('Luis', 'Rodríguez', 'luis.rodriguez@example.com', '3423456789', '1212 Redwood St'),
('María', 'Hernández', 'maria.hernandez@example.com', '3523456789', '1313 Cypress St'),
('Carlos', 'Gómez', 'carlos.gomez@example.com', '3623456789', '1414 Dogwood St'),
('Laura', 'López', 'laura.lopez@example.com', '3723456789', '1515 Magnolia St'),
('David', 'Sánchez', 'david.sanchez@example.com', '3823456789', '1616 Sycamore St'),
('Lucía', 'Ramírez', 'lucia.ramirez@example.com', '3923456789', '1717 Hawthorn St');

-- AUTORES
INSERT INTO autor (nombre, apellido, fecha_nacimiento, nacionalidad, fotografia) VALUES
('Carlos', 'Pérez', '1970-01-01', 'Mexico', 'assets/autores/fotografia1.jpg'),
('Ana', 'García', '1980-02-02', 'Argentina', 'assets/autores/fotografia2.jpg'),
('Luis', 'Fernández', '1975-03-03', 'Colombia','assets/autores/fotografia3.jpg'),
('Marta', 'López', '1990-04-04', 'Chilena', 'assets/autores/fotografia4.jpg'),
('José', 'Martínez', '1985-05-05', 'Peru','assets/autores/fotografia5.jpg'),
('Laura', 'González', '1978-06-06', 'Venezuela', 'assets/autores/fotografia6.jpg'),
('David', 'Rodríguez', '1982-07-07', 'Uruguay', 'assets/autores/fotografia7.jpg'),
('Isabel', 'Hernández', '1992-08-08', 'Paraguay', 'assets/autores/fotografia8.jpg'),
('Juan', 'Ramírez', '1965-09-09', 'Bolivia', 'assets/autores/fotografia9.jpg'),
('Lorena', 'Gómez', '1973-10-10', 'Ecuador', 'assets/autores/fotografia10.jpg'),
('Antonio', 'Sánchez', '1977-11-11', 'Panama', 'assets/autores/fotografia11.jpg'),
('Mónica', 'Díaz', '1981-12-12', 'Salvador', 'assets/autores/fotografia12.jpg'),
('Rafael', 'Jiménez', '1968-01-13', 'Hondura','assets/autores/fotografia13.jpg'),
('Patricia', 'Rojas', '1971-02-14', 'Costa Rica','assets/autores/fotografia14.jpg'),
('Fernando', 'Ruiz', '1974-03-15', 'Nicaragua', 'assets/autores/fotografia15.jpg'),
('Isabel', 'Vega', '1980-04-16', 'Guatemala', 'assets/autores/fotografia16.jpg'),
('José', 'Ortega', '1987-05-17', 'Cuba', 'assets/autores/fotografia17.jpg'),
('Ana', 'Castro', '1993-06-18', 'Republica Dominicana', 'assets/autores/fotografia18.jpg'),
('Luis', 'Mendoza', '1984-07-19', 'Puerto Rico','assets/autores/fotografia19.jpg'),
('María', 'Ramírez', '1976-08-20', 'España', 'assets/autores/fotografia20.jpg'),
('Fernando', 'Gómez', '1975-07-22', 'España', 'assets/autores/fotografia21.jpg'),
('Isabel', 'Ríos', '1990-11-15', 'México', 'assets/autores/fotografia22.jpg'),
('Javier', 'López', '1982-05-30', 'Chile', 'assets/autores/fotografia23.jpg'),
('Ana', 'Sánchez', '1978-09-05', 'Colombia','assets/autores/fotografia24.jpg'),
('Lucas', 'Fernández', '1988-12-25', 'Uruguay','assets/autores/fotografia25.jpg'),
('Claudia', 'Martínez', '1985-03-10', 'Argentina','assets/autores/fotografia26.jpg');

-- EDITORIALES
INSERT INTO editorial (nombre_editorial, direccion, telefono, correo_electronico, sitio_web) VALUES
('Editorial Alfa', '123 Avenida Principal', '1234567890', 'contacto@editorialalfa.com', 'www.editorialalfa.com'),
('Editorial Beta', '456 Calle Secundaria', '0987654321', 'info@editorialbeta.com', 'www.editorialbeta.com'),
('Editorial Gamma', '789 Bulevar Tercero', '1122334455', 'soporte@editorialgamma.com', 'www.editorialgamma.com'),
('Editorial Delta', '1011 Plaza Cuarta', '2233445566', 'ventas@editorialdelta.com', 'www.editorialdelta.com'),
('Editorial Épsilon', '1213 Parque Quinto', '3344556677', 'editor@editorialepsilon.com', 'www.editorialepsilon.com'),
('Editorial Zeta', '1415 Ruta Sexta', '4455667788', 'ayuda@editorialzeta.com', 'www.editorialzeta.com'),
('Editorial Omega', '1617 Camino Séptimo', '5566778899', 'contacto@editorialomega.com', 'www.editorialomega.com'),
('Editorial Sigma', '1819 Sendero Octavo', '6677889900', 'info@editorialsigma.com', 'www.editorialsigma.com'),
('Editorial Tau', '2021 Alameda Novena', '7788990011', 'soporte@editorialtau.com', 'www.editorialtau.com'),
('Editorial Kappa', '2223 Jardín Décimo', '8899001122', 'ventas@editorialkappa.com', 'www.editorialkappa.com'),
('Editorial Lambda', '2425 Vía Once', '9900112233', 'editor@editoriallambda.com', 'www.editoriallambda.com'),
('Editorial Rho', '2627 Camino Doce', '1010101010', 'ayuda@editorialrho.com', 'www.editorialrho.com'),
('Editorial Phi', '2829 Sendero Trece', '2020202020', 'contacto@editorialphi.com', 'www.editorialphi.com'),
('Editorial Chi', '3031 Ruta Catorce', '3030303030', 'info@editorialchi.com', 'www.editorialchi.com'),
('Editorial Psi', '3233 Plaza Quince', '4040404040', 'soporte@editorialpsi.com', 'www.editorialpsi.com'),
('Editorial Upsilon', '3435 Avenida Dieciséis', '5050505050', 'ventas@editorialupsilon.com', 'www.editorialupsilon.com'),
('Editorial Theta', '3637 Bulevar Diecisiete', '6060606060', 'editor@editorialtheta.com', 'www.editorialtheta.com'),
('Editorial Iota', '3839 Calle Dieciocho', '7070707070', 'ayuda@editorialiota.com', 'www.editorialiota.com'),
('Editorial Omicron', '4041 Plaza Diecinueve', '8080808080', 'contacto@editorialomicron.com', 'www.editorialomicron.com'),
('Editorial Pi', '4243 Parque Veinte', '9090909090', 'info@editorialpi.com', 'www.editorialpi.com');


-- LIBROS
INSERT INTO libro (titulo, id_autor, fecha_publicacion, numero_paginas, idioma, genero, descripcion, portada, precio, id_editorial) VALUES
('Donde no puedas encontrarme', 1, '2024-05-8', 456, 'Español', 'Romance', 'Un romance que florece entre las grietas de un corazón roto.', 'assets/libros/portada1.jpg', 16, 1),
('Casa de tierra y sangre', 2, '2024-05-16', 816, 'Español', 'Romantasy', 'Unidos por la sangre. Tentados por el deseo.', 'assets/libros/portada2.jpg', 20, 2),
('Casa de cielo y aliento', 2, '2024-05-16', 863, 'Español', 'Romantasy', 'Unidos por la sangre. Tentados por el deseo.', 'assets/libros/portada3.jpg', 20, 2),
('Un destino de ira y fuego', 3, '2023-05-18', 640, 'Ingles', 'Fantasia', 'Este hombre me ha condenado a muerte.', 'assets/libros/portada4.jpg', 16, 3),
('Una maldicion de sangre y piedra', 3, '2023-10-26', 576, 'Ingles', 'Fantasia', 'No sé cómo amarte .', 'assets/libros/portada5.jpg', 16, 3),
('Una reina de ladrones y caos', 3, '2024-05-16', 764, 'Ingles', 'Fantasia', 'No hay ninguna reina... Ningún Destino.', 'assets/libros/portada6.jpg', 17, 3),
('Leyendas y mentiras', 4, '1963-11-30', 384, 'Frances', 'Misterio', 'El futuro de Josslyn Drake es cada vez más sombrío.', 'assets/libros/portada7.jpg', 16, 4),
('Ecos y llamas', 4, '2023-09-21', 424, 'Frances', 'Misterio', 'Josslyn Drake, hija del antiguo primer ministro', 'assets/libros/portada8.jpg', 16, 4),
('Una corona de mentiras', 5, '2023-10-26', 128, 'Alemán', 'Ficción', 'Como princesa secreta, la segunda gemela en nacer.', 'assets/libros/portada9.jpg', 10, 9),
('El trono usurpado',5, '2024-05-16', 176, 'Alemán', 'Ficción', 'Soy una impostora, la reina que nunca debí ser.', 'assets/libros/portada10.jpg', 16, 10),
('Powerless', 11, '2023-02-08', 416, 'Español', 'Aventura', 'Ella es lo que él ha pasado toda su vida cazando.', 'assets/libros/portada11.jpg', 25, 11),
('Fabricantes de lagrinas', 12, '2023-01-26', 640, 'Japones', 'Drama', ' En el orfanato en el que Nica creció.', 'assets/libros/portada12.jpg', 15, 12),
('Save me 1', 13, '2021-01-13', 416, 'Rumano', 'Juvenil', 'Ruby Bell tiene dos objetivos para este curso.', 'assets/libros/portada13.jpg', 17, 13),
('Save me 2', 13, '1998-05-27', 400, 'Rumano', 'Juvenil', 'Ruby está destrozada.', 'assets/libros/portada14.jpg', 1, 14),
('Save me 3', 13, '2021-10-06', 400, 'Rumano', 'Juvenil', 'Tras ser suspendida.', 'assets/libros/portada15.jpg', 19, 15),
('Una corte de rosas y espinas', 16, '2022-04-13', 456, 'Ruso', 'Cuento', 'Quitó una vida. Ahora tiene que pagar con su propio corazón. ', 'assets/libros/portada16.jpg', 18, 16),
('Una corte de niebla y furia', 17, '2022-04-13', 592 , 'Ruso', 'Cuento', 'Tras haber superado más pruebas de las que un corazón humano puede soportar.', 'assets/libros/portada17.jpg',18, 17),
('Una corte de alas y ruinas', 18, '2022-04-13', 672 , 'Ruso', 'Cuento', 'Feyre regresa a la Corte Primavera, decidida a reunir información.', 'assets/libros/portada18.jpg', 18, 18),
('Una corte de hielo y estrellas', 19, '2022-04-13', 272, 'Ruso', 'Cuento', 'Feyre, Rhys y su círculo más íntimo de amigos.', 'assets/libros/portada19.jpg', 18, 19),
('Una corte de llamas plateadas', 20, '2022-04-13', 688, 'Ruso', 'Cuento', 'Se convirtió en alta fae en contra de su voluntad.', 'assets/libros/portada20.jpg', 18, 20);


-- EDICIONES
INSERT INTO edicion (id_libro, nombre_edicion, anno_edicion, formato, portada, precio, id_editorial) VALUES
(2, 'Casa de tierra y sangre', 2024, 'Tapa dura', 'assets/ediciones/portada1.jpg', 19, 1),
(3, 'Casa de cielo y aliento ', 2024, 'Tapa dura', 'assets/ediciones/portada2.jpg', 24, 2),
(11, 'Powerless', 2023, 'Tapa dura', 'assets/ediciones/portada3.jpg', 23, 3),
(12, 'Fabricantes de lagrinas', 2024, 'Tapa dura', 'assets/ediciones/portada4.jpg', 21, 4),
(11, 'Powerless', 2024, 'AudioLibro', 'assets/ediciones/portada5.jpg', 19, 5),
(13, 'Save me 1', 2024, 'Libro de bolsillo', 'assets/ediciones/portada6.jpg', 19, 6),
(14, 'Save me 2', 2022, 'Libro de bolsillo', 'assets/ediciones/portada7.jpg', 22, 7),
(15, 'Save me 3', 2022, 'Libro de bolsillo', 'assets/ediciones/portada8.jpg', 15, 8),
(13, 'Save me 1', 2021, 'AudioLibro', 'assets/ediciones/portada9.jpg', 12, 9),
(14, 'Save me 2', 2021, 'AudioLibro', 'assets/ediciones/portada10.jpg', 17, 10),
(15, 'Save me 3', 2021, 'AudioLibro', 'assets/ediciones/portada11.jpg', 23, 11),
(1, 'Donde no puedas encontrarme', 2024, 'AudioLibro', 'assets/ediciones/portada12.jpg', 13, 12),
(2, 'Casa de tierra y sangre', 2024, 'AudioLibro', 'assets/ediciones/portada13.jpg', 20, 13),
(3, 'Casa de cielo y aliento', 2024, 'AudioLibro', 'assets/ediciones/portada14.jpg', 24, 14),
(4, 'Un destino de ira y fuego', 2024, 'AudioLibro', 'assets/ediciones/portada15.jpg', 34, 15),
(5, 'Una maldicion de sangre y piedra', 2024, 'AudioLibro', 'assets/ediciones/portada16.jpg', 19, 16),
(6, 'Una reina de ladrones y caos', 2024, 'AudioLibro', 'assets/ediciones/portada17.jpg', 16, 17),
(7, 'Leyendas y mentiras', 2024, 'AudioLibro', 'assets/ediciones/portada18.jpg', 26, 18),
(8, 'Ecos y llamas', 2024, 'AudioLibro', 'assets/ediciones/portada19.jpg', 28, 19),
(9, 'Una corona de mentiras', 2024, 'AudioLibro', 'assets/ediciones/portada20.jpg', 27, 20);


-- VENTAS
INSERT INTO venta (id_libro, id_cliente, fecha_venta, cantidad, precio_venta, metodo_pago, estado_pedido) VALUES
(1, 1, '2023-01-15', 2, 39.98, 'Tarjeta de crédito', 'Entregado'),
(2, 2, '2023-01-20', 1, 24.99, 'PayPal', 'Entregado'),
(3, 3, '2023-01-25', 3, 89.97, 'Tarjeta de débito', 'Entregado'),
(4, 4, '2023-01-30', 2, 43.98, 'Transferencia bancaria', 'Entregado'),
(5, 5, '2023-02-05', 1, 18.99, 'Efectivo', 'Entregado'),
(6, 6, '2023-02-10', 4, 59.96, 'Tarjeta de crédito', 'Entregado'),
(7, 7, '2023-02-15', 2, 45.98, 'PayPal', 'Entregado'),
(8, 8, '2023-02-20', 1, 15.99, 'Tarjeta de débito', 'Entregado'),
(9, 9, '2023-02-25', 3, 38.97, 'Transferencia bancaria', 'Entregado'),
(10, 10, '2023-03-01', 2, 35.98, 'Efectivo', 'Entregado'),
(11, 11, '2023-03-05', 1, 23.99, 'Tarjeta de crédito', 'Entregado'),
(12, 12, '2023-03-10', 4, 55.96, 'PayPal', 'Entregado'),
(13, 13, '2023-03-15', 2, 41.98, 'Tarjeta de débito', 'Entregado'),
(14, 14, '2023-03-20', 1, 24.99, 'Transferencia bancaria', 'Entregado'),
(15, 15, '2023-03-25', 3, 104.97, 'Efectivo', 'Entregado'),
(16, 16, '2023-03-30', 2, 39.98, 'Tarjeta de crédito', 'Entregado'),
(17, 17, '2023-04-05', 1, 16.99, 'PayPal', 'Entregado'),
(18, 18, '2023-04-10', 4, 107.96, 'Tarjeta de débito', 'Entregado'),
(19, 19, '2023-04-15', 2, 57.98, 'Transferencia bancaria', 'Entregado'),
(20, 20, '2023-04-20', 1, 27.99, 'Efectivo', 'Entregado');
