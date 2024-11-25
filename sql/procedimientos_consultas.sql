Use versos_en_primavera;

-- Procedimiento para poder filtrar a un autor
delimiter $$
CREATE PROCEDURE mostra_escritores(
    IN nombre_procedimiento VARCHAR(100),
    IN apellido_procedimiento VARCHAR(100),
    IN pais VARCHAR(50))
BEGIN
    IF nombre_procedimiento = '' THEN 
        SET nombre_procedimiento = '%';
    END IF;

    IF apellido_procedimiento = '' THEN 
        SET apellido_procedimiento = '%';
    END IF;

    IF pais = '' THEN 
        SET pais = '%';
    END IF;

    SELECT * 
    FROM autor 
    WHERE nombre LIKE nombre_procedimiento 
      AND apellido LIKE apellido_procedimiento 
      AND nacionalidad LIKE pais;
END$$
delimiter ;

-- Procedimiento para mostrar libros
DELIMITER $$

CREATE PROCEDURE mostra_libros(
    IN titulo_procedimiento VARCHAR(100),
    IN id_autor_procedimiento INT,
    IN fecha_publicacion_procedimiento DATE,
    IN numero_paginas_procedimiento INT,
    IN idioma_procedimiento VARCHAR(50),
    IN genero_procedimiento VARCHAR(50),
    IN precio_procedimiento DECIMAL(10, 2),
    IN id_editorial_procedimiento INT)
BEGIN
    -- Si el título es una cadena vacía, lo tratamos como NULL
    IF titulo_procedimiento = '' THEN
        SET titulo_procedimiento = NULL;
    END IF;
    -- Similar para otros parámetros de entrada
    IF id_autor_procedimiento = 0 THEN
        SET id_autor_procedimiento = NULL;
    END IF;
    IF fecha_publicacion_procedimiento = '0000-00-00' THEN
        SET fecha_publicacion_procedimiento = NULL;
    END IF;
    IF numero_paginas_procedimiento = 0 THEN
        SET numero_paginas_procedimiento = NULL;
    END IF;
    IF idioma_procedimiento = '' THEN
        SET idioma_procedimiento = NULL;
    END IF;
    IF genero_procedimiento = '' THEN
        SET genero_procedimiento = NULL;
    END IF;
    IF precio_procedimiento = 0 THEN
        SET precio_procedimiento = NULL;
    END IF;
    IF id_editorial_procedimiento = 0 THEN
        SET id_editorial_procedimiento = NULL;
    END IF;

    SELECT * 
    FROM libro
    WHERE (titulo LIKE CONCAT('%', titulo_procedimiento, '%') OR titulo_procedimiento IS NULL)
      AND (id_autor = id_autor_procedimiento OR id_autor_procedimiento IS NULL)
      AND (fecha_publicacion = fecha_publicacion_procedimiento OR fecha_publicacion_procedimiento IS NULL)
      AND (numero_paginas = numero_paginas_procedimiento OR numero_paginas_procedimiento IS NULL)
      AND (idioma = idioma_procedimiento OR idioma_procedimiento IS NULL)
      AND (genero = genero_procedimiento OR genero_procedimiento IS NULL)
      AND (precio = precio_procedimiento OR precio_procedimiento IS NULL)
      AND (id_editorial = id_editorial_procedimiento OR id_editorial_procedimiento IS NULL);
END$$

DELIMITER ;


-- Procedimiento para mostrar ediciones
DELIMITER $$

CREATE PROCEDURE mostra_ediciones(
    IN nombre_edicion_procedimiento VARCHAR(100),
    IN anno_edicion_procedimiento YEAR,
    IN formato_procedimiento VARCHAR(50),
    IN precio_procedimiento DECIMAL(10, 2),
    IN id_editorial_procedimiento INT)
BEGIN
    -- Si el título es una cadena vacía, lo tratamos como NULL
    IF nombre_edicion_procedimiento = '' THEN
        SET nombre_edicion_procedimiento = NULL;
    END IF;
    -- Similar para otros parámetros de entrada
    IF anno_edicion_procedimiento = '0000' THEN
        SET anno_edicion_procedimiento = NULL;
    END IF;
    IF formato_procedimiento = '' THEN
        SET formato_procedimiento = NULL;
    END IF;
    IF precio_procedimiento = 0 THEN
        SET precio_procedimiento = NULL;
    END IF;
    IF id_editorial_procedimiento = 0 THEN
        SET id_editorial_procedimiento = NULL;
    END IF;

    SELECT * 
    FROM edicion
    WHERE (nombre_edicion LIKE CONCAT('%', nombre_edicion_procedimiento, '%') OR nombre_edicion_procedimiento IS NULL)
      AND (anno_edicion = anno_edicion_procedimiento OR anno_edicion_procedimiento IS NULL)
      AND (formato = formato_procedimiento OR formato_procedimiento IS NULL)
      AND (precio = precio_procedimiento OR precio_procedimiento IS NULL)
      AND (id_editorial = id_editorial_procedimiento OR id_editorial_procedimiento IS NULL);
END$$

DELIMITER ;

-- Procedimiento para insertar usuarios
DELIMITER $$

CREATE PROCEDURE insertar_usuario (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_correo_electronico VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO usuario (nombre, apellido, correo_electronico, telefono, direccion)
    VALUES (p_nombre, p_apellido, p_correo_electronico, p_telefono, p_direccion);
END $$

DELIMITER ;

-- Procedimiento para insertar escritores

DELIMITER $$

CREATE PROCEDURE insertar_autor (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_fecha_nacimiento DATE,
    IN p_nacionalidad VARCHAR(50),
    IN p_imagen VARCHAR(255)
)
BEGIN
    INSERT INTO autor (nombre, apellido, fecha_nacimiento, nacionalidad, fotografia)
    VALUES (p_nombre, p_apellido, p_fecha_nacimiento, p_nacionalidad, p_imagen);
END $$

DELIMITER ;
-- Procedimiento paar insertar una venta
DELIMITER $$

CREATE PROCEDURE insertar_venta (
    IN p_titulo_libro VARCHAR(255),
    IN p_nombre_usuario VARCHAR(100),
    IN p_apellido_usuario VARCHAR(100),
    IN p_fecha_venta DATE,
    IN p_cantidad INT,
    IN p_metodo_pago VARCHAR(50)
)
BEGIN
    DECLARE v_id_libro INT;
    DECLARE v_id_cliente INT;

    -- Buscar id_libro a partir del titulo
    SELECT id_libro INTO v_id_libro
    FROM libro
    WHERE titulo = p_titulo_libro
    LIMIT 1;

    -- Buscar id_cliente a partir del nombre y apellido
    SELECT id_usuario INTO v_id_cliente
    FROM usuario
    WHERE nombre = p_nombre_usuario AND apellido = p_apellido_usuario
    LIMIT 1;

    -- Insertar la venta en la tabla venta
    INSERT INTO venta (id_libro, id_cliente, fecha_venta, cantidad, metodo_pago)
    VALUES (v_id_libro, v_id_cliente, p_fecha_venta, p_cantidad, p_metodo_pago);
END $$

DELIMITER ;
-- Procedimiento de elminicacion de ventas 
DELIMITER $$

CREATE PROCEDURE eliminar_venta(
    IN nombre_libro VARCHAR(255),
    IN nombre_cliente VARCHAR(255)
)
BEGIN
    DECLARE libro_id INT;
    DECLARE cliente_id INT;

    -- Obtener el ID del libro
    SELECT id_libro INTO libro_id
    FROM libro
    WHERE titulo = nombre_libro
    LIMIT 1;

    -- Obtener el ID del cliente
    SELECT id_usuario INTO cliente_id
    FROM usuario
    WHERE nombre_usuario = nombre_cliente
    LIMIT 1;

    -- Eliminar la venta correspondiente
    DELETE FROM venta
    WHERE id_libro = libro_id
      AND id_cliente = cliente_id;

END $$

DELIMITER ;

-- CREACION DEL TRIGGER
DELIMITER $$

CREATE TRIGGER after_delete_venta
AFTER DELETE ON venta
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_ventas (id_libro, id_cliente, accion)
    VALUES (OLD.id_libro, OLD.id_cliente, 'DELETE');
END $$

DELIMITER ;

-- Procedimiento que inserta un libro
DELIMITER $$

CREATE PROCEDURE insertar_libro (
    IN p_titulo VARCHAR(255),
    IN p_nombre_autor VARCHAR(100),
    IN p_fecha_publicacion DATE,
    IN p_numero_paginas INT,
    IN p_idioma VARCHAR(50),
    IN p_genero VARCHAR(100),
    IN p_resumen TEXT, -- Agregar el parámetro resumen
    IN p_precio DECIMAL(10, 2),
    IN p_id_editorial INT
)
BEGIN
    DECLARE v_id_autor INT;

    -- Buscar id_autor a partir del nombre del autor
    SELECT id_autor INTO v_id_autor
    FROM autor
    WHERE nombre = p_nombre_autor
    LIMIT 1;

    -- Insertar el libro en la tabla libro
    INSERT INTO libro (titulo, id_autor, fecha_publicacion, numero_paginas, idioma, genero, resumen, precio, id_editorial)
    VALUES (p_titulo, v_id_autor, p_fecha_publicacion, p_numero_paginas, p_idioma, p_genero, p_resumen, p_precio, p_id_editorial);
END $$

DELIMITER ;

-- Procedimiento que inserta una edicion
DELIMITER $$

CREATE PROCEDURE insertar_edicion (
    IN p_titulo_libro VARCHAR(255),
    IN p_nombre_edicion VARCHAR(100),
    IN p_anno_edicion YEAR,
    IN p_formato VARCHAR(50),
    IN p_precio DECIMAL(10, 2),
    IN p_id_editorial INT
)
BEGIN
    DECLARE v_id_libro INT;

    -- Buscar id_libro a partir del título del libro
    SELECT id_libro INTO v_id_libro
    FROM libro
    WHERE titulo = p_titulo_libro
    LIMIT 1;

    -- Insertar la edición en la tabla edicion
    INSERT INTO edicion (id_libro, nombre_edicion, anno_edicion, formato, precio, id_editorial)
    VALUES (v_id_libro, p_nombre_edicion, p_anno_edicion, p_formato, p_precio, p_id_editorial);
END $$

DELIMITER ;
-- Procedimiento que elimina una libro
DELIMITER $$

CREATE PROCEDURE eliminar_libro (
    IN p_titulo_libro VARCHAR(255)
)
BEGIN
    DECLARE v_id_libro INT;

    -- Buscar id_libro a partir del título del libro
    SELECT id_libro INTO v_id_libro
    FROM libro
    WHERE titulo = p_titulo_libro
    LIMIT 1;

    -- Verificar si se encontró el libro
    IF v_id_libro IS NOT NULL THEN
        -- Eliminar las ediciones relacionadas con el libro
        DELETE FROM edicion
        WHERE id_libro = v_id_libro;

        -- Eliminar el libro
        DELETE FROM libro
        WHERE id_libro = v_id_libro;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Libro no encontrado';
    END IF;
END $$

DELIMITER ;
-- Procedimiento que elimina una edicion

DELIMITER $$

CREATE PROCEDURE eliminar_edicion (
    IN p_titulo_libro VARCHAR(255),
    IN p_nombre_edicion VARCHAR(100)
)
BEGIN
    DECLARE v_id_libro INT;

    -- Buscar id_libro a partir del título del libro
    SELECT id_libro INTO v_id_libro
    FROM libro
    WHERE titulo = p_titulo_libro
    LIMIT 1;

    -- Verificar si se encontró el libro
    IF v_id_libro IS NOT NULL THEN
        -- Eliminar la edición específica del libro
        DELETE FROM edicion
        WHERE id_libro = v_id_libro
          AND nombre_edicion = p_nombre_edicion;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Libro no encontrado';
    END IF;
END $$

DELIMITER ;

- Procedimiento que elimina un usuario

DELIMITER $$

CREATE PROCEDURE eliminar_usuario (
    IN p_nombre VARCHAR(100)
)
BEGIN
    DECLARE v_id_usuario INT;

    -- Buscar id_usuario a partir del nombre
    SELECT id_usuario INTO v_id_usuario
    FROM usuario
    WHERE nombre = p_nombre
    LIMIT 1;

    -- Verificar si se encontró el usuario
    IF v_id_usuario IS NOT NULL THEN
        -- Eliminar el usuario
        DELETE FROM usuario
        WHERE id_usuario = v_id_usuario;
    ELSE
        SELECT 'El usuario no fue encontrado.';
    END IF;
END $$

DELIMITER ;

-- CREACION TRIGGER 
DELIMITER $$

CREATE TRIGGER after_delete_usuario
AFTER DELETE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_usuarios (id_usuario, nombre, accion)
    VALUES (OLD.id_usuario, OLD.nombre, 'DELETE');
END $$

DELIMITER ;

-- Procedimiento que elimina un autor

DELIMITER $$

CREATE PROCEDURE eliminar_autor (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100)
)
BEGIN
    DECLARE v_id_autor INT;

    -- Buscar id_autor a partir del nombre y apellido
    SELECT id_autor INTO v_id_autor
    FROM autor
    WHERE nombre = p_nombre AND apellido = p_apellido
    LIMIT 1;

    -- Verificar si se encontró el autor
    IF v_id_autor IS NOT NULL THEN
        -- Eliminar el autor
        DELETE FROM autor
        WHERE id_autor = v_id_autor;
    ELSE
        SELECT 'El autor no fue encontrado.';
    END IF;
END $$

DELIMITER ;


