DROP PROCEDURE IF EXISTS Producto_Crear;
DELIMITER //
CREATE PROCEDURE Producto_Crear
(
	IN cnombre			VARCHAR(50),
	IN cdescripcion		VARCHAR(50),
	IN cprecio			FLOAT,
	IN cfk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	INSERT INTO producto (nombre, descripcion, precio, fk_marca) 
	VALUES (cnombre, cdescripcion, cprecio, cfk_marca);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Listar;
DELIMITER //
CREATE PROCEDURE Producto_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT pk_producto, nombre, descripcion, precio, (SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as Marca FROM producto as p;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Producto_Buscar_Por_Id(
	IN cpk_producto		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT pk_producto, nombre, descripcion, precio, (SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as Marca FROM producto as p WHERE pk_producto=cpk_producto;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Modificar;
DELIMITER //
CREATE PROCEDURE Producto_Modificar
(
	IN cpk_producto		INT,
	IN cnombre			VARCHAR(50),
	IN cdescripcion		VARCHAR(50),
	IN cprecio			FLOAT,
	IN cfk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	UPDATE producto 
	SET nombre=cnombre, descripcion = cdescripcion, precio = cprecio, fk_marca = cfk_marca 
	WHERE pk_producto=cpk_producto;
END //
DELIMITER ;
-- ******************************************************************************