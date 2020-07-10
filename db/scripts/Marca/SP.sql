-- ******************************************************************************
DROP PROCEDURE IF EXISTS Marca_Crear;
DELIMITER //
CREATE PROCEDURE Marca_Crear
(
	IN cnombre			VARCHAR(50),
	IN cpais			VARCHAR(50),
	IN cpagina_web		VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	INSERT INTO marca (nombre, pais, pagina_web) 
	VALUES (cnombre, cpais, cpagina_web);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Marca_Listar;
DELIMITER //
CREATE PROCEDURE Marca_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT pk_marca, nombre, pais, pagina_web FROM marca;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Marca_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Marca_Buscar_Por_Id
(
	IN cpk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT pk_marca, nombre, pais, pagina_web FROM marca WHERE pk_marca = cpk_marca;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Marca_Modificar;
DELIMITER //
CREATE PROCEDURE Marca_Modificar
(
	IN cpk_marca		INT,
	IN cnombre			VARCHAR(50),
	IN cpais			VARCHAR(50),
	IN cpagina_web		VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	UPDATE marca 
	SET nombre=cnombre, pais = cpais, pagina_web = cpagina_web 
	WHERE pk_marca=cpk_marca;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Marca_Eliminar;
DELIMITER //
CREATE PROCEDURE Marca_Eliminar
(
	IN cpk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	DELETE FROM marca WHERE pk_marca=cpk_marca;
END //
DELIMITER ;
-- ******************************************************************************