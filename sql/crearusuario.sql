-- Selección del esquema a utilizar
USE versos_en_primavera;

-- Creación del usuario 'insetar_eliminar' con privilegios específicos
CREATE USER 'insetar_eliminar'@'localhost' IDENTIFIED BY 'insetar_eliminar';

-- Concesión de privilegios de INSERT y DELETE en todas las tablas del esquema 'versos_en_primavera'
GRANT INSERT, DELETE ON versos_en_primavera.* TO 'insetar_eliminar'@'localhost';

-- Concesión de permisos para ejecutar procedimientos almacenados específicos
GRANT EXECUTE ON PROCEDURE versos_en_primavera.insertar_autor TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.eliminar_autor TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.insertar_libro TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.eliminar_libro TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.insertar_venta TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.eliminar_venta TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.insertar_usuario TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.eliminar_usuario TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.insertar_edicion TO 'insetar_eliminar'@'localhost';
GRANT EXECUTE ON PROCEDURE versos_en_primavera.eliminar_edicion TO 'insetar_eliminar'@'localhost';

-- Concesión de permisos para ejecutar triggers almacenados específicos
GRANT TRIGGER ON versos_en_primavera.auditoria_ventas TO 'insetar_eliminar'@'localhost';
GRANT TRIGGER ON  versos_en_primavera.auditoria_usuarios TO 'insetar_eliminar'@'localhost';

-- Creación del usuario 'consultar_productos' con privilegios específicos
CREATE USER 'consultar_productos'@'localhost' IDENTIFIED BY 'consultar_productos';

-- Concesión de privilegios de SELECT en la tabla 'libro' del esquema 'versos_en_primavera'
GRANT SELECT ON versos_en_primavera.libro TO 'consultar_productos'@'localhost';

-- Concesión de permisos para ejecutar un procedimiento almacenado específico
GRANT EXECUTE ON PROCEDURE versos_en_primavera.mostra_libros TO 'consultar_productos'@'localhost';





