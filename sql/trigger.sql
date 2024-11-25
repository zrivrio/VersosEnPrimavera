-- TABLA DEL TRIGGER
CREATE TABLE auditoria_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT,
    id_cliente INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50)
);
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

-- TABLA TRIGGER 
CREATE TABLE auditoria_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    nombre VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(50)
);
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

