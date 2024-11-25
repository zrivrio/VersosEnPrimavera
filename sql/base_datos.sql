-- Creación del esquema y selección del mismo
CREATE SCHEMA IF NOT EXISTS versos_en_primavera;
USE versos_en_primavera;

-- Creación de la tabla 'usuario'
CREATE TABLE usuario (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,   -- Clave primaria autoincremental para la identificación única de cada usuario
  nombre VARCHAR(100) NOT NULL,                -- Nombre del usuario, no puede ser nulo
  apellido VARCHAR(100) NOT NULL,              -- Apellido del usuario, no puede ser nulo
  correo_electronico VARCHAR(100) UNIQUE NOT NULL, -- Correo electrónico único del usuario, no puede ser nulo
  telefono VARCHAR(20),                        -- Teléfono del usuario
  direccion VARCHAR(255)                       -- Dirección del usuario
);

-- Creación de la tabla 'autor'
CREATE TABLE autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,     -- Clave primaria autoincremental para la identificación única de cada autor
  nombre VARCHAR(100) NOT NULL,                -- Nombre del autor, no puede ser nulo
  apellido VARCHAR(100) NOT NULL,              -- Apellido del autor, no puede ser nulo
  fecha_nacimiento DATE,                       -- Fecha de nacimiento del autor
  nacionalidad VARCHAR(50),                    -- Nacionalidad del autor
  fotografia VARCHAR(255)                      -- Ruta o URL de la fotografía del autor
);

-- Creación de la tabla 'editorial'
CREATE TABLE editorial (
  id_editorial INT AUTO_INCREMENT PRIMARY KEY, -- Clave primaria autoincremental para la identificación única de cada editorial
  nombre_editorial VARCHAR(100) NOT NULL,      -- Nombre de la editorial, no puede ser nulo
  direccion VARCHAR(255),                      -- Dirección de la editorial
  telefono VARCHAR(20),                        -- Teléfono de la editorial
  correo_electronico VARCHAR(100),             -- Correo electrónico de la editorial
  sitio_web VARCHAR(100)                       -- Sitio web de la editorial
);

-- Creación de la tabla 'libro'
CREATE TABLE libro (
  id_libro INT AUTO_INCREMENT PRIMARY KEY,     -- Clave primaria autoincremental para la identificación única de cada libro
  titulo VARCHAR(255) NOT NULL,                -- Título del libro, no puede ser nulo
  id_autor INT,                                -- Identificación del autor del libro, clave foránea
  fecha_publicacion DATE,                      -- Fecha de publicación del libro
  numero_paginas INT,                          -- Número de páginas del libro
  idioma VARCHAR(50),                          -- Idioma del libro
  genero VARCHAR(100),                         -- Género literario del libro
  descripcion TEXT,                            -- Descripción del libro
  portada VARCHAR(500),                        -- Ruta o URL de la portada del libro
  precio DECIMAL(10, 2),                       -- Precio del libro
  id_editorial INT,                            -- Identificación de la editorial del libro, clave foránea
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor),         -- Definición de la clave foránea para el autor
  FOREIGN KEY (id_editorial) REFERENCES editorial(id_editorial) -- Definición de la clave foránea para la editorial
);

-- Creación de la tabla 'edicion'
CREATE TABLE edicion (
  id_edicion INT AUTO_INCREMENT PRIMARY KEY,   -- Clave primaria autoincremental para la identificación única de cada edición
  id_libro INT,                                -- Identificación del libro al que pertenece la edición, clave foránea
  nombre_edicion VARCHAR(100),                 -- Nombre de la edición
  anno_edicion YEAR,                           -- Año de la edición
  formato VARCHAR(50),                         -- Formato de la edición (e.g., tapa dura, e-book)
  portada VARCHAR(500),                        -- Ruta o URL de la portada de la edición
  precio DECIMAL(10, 2),                       -- Precio de la edición
  id_editorial INT,                            -- Identificación de la editorial de la edición, clave foránea
  FOREIGN KEY (id_libro) REFERENCES libro(id_libro),          -- Definición de la clave foránea para el libro
  FOREIGN KEY (id_editorial) REFERENCES editorial(id_editorial) -- Definición de la clave foránea para la editorial
);

-- Creación de la tabla 'venta'
CREATE TABLE venta (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,     -- Clave primaria autoincremental para la identificación única de cada venta
  id_libro INT,                                -- Identificación del libro vendido, clave foránea
  id_cliente INT,                              -- Identificación del cliente que realiza la compra, clave foránea
  fecha_venta DATE,                            -- Fecha de la venta
  cantidad INT,                                -- Cantidad de libros vendidos
  precio_venta DECIMAL(10, 2),                 -- Precio de venta del libro
  metodo_pago VARCHAR(50),                     -- Método de pago utilizado
  estado_pedido VARCHAR(50),                   -- Estado del pedido (e.g., procesado, enviado)
  FOREIGN KEY (id_libro) REFERENCES libro(id_libro),           -- Definición de la clave foránea para el libro
  FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario)      -- Definición de la clave foránea para el usuario (cliente)
);
