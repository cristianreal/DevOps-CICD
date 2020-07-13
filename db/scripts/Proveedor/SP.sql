-- ******************************************************************************
DROP PROCEDURE IF EXISTS Proveedor_Crear;
DELIMITER //
CREATE PROCEDURE Proveedor_Crear
(
	IN cnombre				VARCHAR(50),
	IN capellido			VARCHAR(50),
	IN cdireccion			VARCHAR(50),
	IN ctelefono			VARCHAR(30),
	IN cemail				VARCHAR(50),
	IN cgenero 				INT,
	IN cpagina_web			VARCHAR(50),
   	IN cpais				VARCHAR(50),
   	IN cciudad				VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	-- JORNADA = 1->Matutina, 2->Vespertina
	-- GENERO= 1->Masculino, 2->Femenino
	-- TipoUsuario = 1->Admin, 2->Vendedor, 3->Proveedor
	INSERT INTO proveedor (pagina_web, pais, ciudad)
	VALUES (cpagina_web, cpais, cciudad);

	SELECT @ultimo_proveedor := MAX(pk_proveedor) FROM proveedor;

	INSERT INTO usuario 
	(nombre,apellido,direccion,telefono,email,genero,tipo_usuario,fk_vendedor,fk_proveedor) 
	VALUES 
	(cnombre, capellido, cdireccion, ctelefono, cemail, cgenero, 3, 0, @ultimo_proveedor);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Proveedor_Listar;
DELIMITER //
CREATE PROCEDURE Proveedor_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT P.pk_proveedor, U.nombre, U.apellido,
			U.direccion, U.telefono, U.email, 
			P.pagina_web, P.pais, P.ciudad 
	FROM proveedor AS P 
	INNER JOIN usuario AS U ON P.pk_proveedor = U.fk_proveedor;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Proveedor_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Proveedor_Buscar_Por_Id
(
	IN cpk_proveedor		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT P.pk_proveedor, U.nombre, U.apellido,
			U.direccion, U.telefono, U.email, 
			P.pagina_web, P.pais, P.ciudad 
	FROM proveedor AS P 
	INNER JOIN usuario AS U 
	ON P.pk_proveedor = U.fk_proveedor AND P.pk_proveedor = cpk_proveedor;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Proveedor_Modificar;
DELIMITER //
CREATE PROCEDURE Proveedor_Modificar
(
	IN cpk_proveedor	INT,
	IN cnombre			VARCHAR(50),
	IN capellido		VARCHAR(50),
	IN cdireccion		VARCHAR(50),
	IN ctelefono		VARCHAR(30),
	IN cemail			VARCHAR(50),
	IN cgenero 			INT,
	IN cpagina_web		VARCHAR(50),
   	IN cpais			VARCHAR(50),
   	IN cciudad			VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	UPDATE usuario 
	SET nombre = cnombre, 
		apellido = capellido, 
		direccion = cdireccion,
		telefono = ctelefono,
		email = cemail
		WHERE fk_proveedor = cpk_proveedor;
	
	UPDATE proveedor
	SET pagina_web = cpagina_web,
		pais = cpais,
		ciudad = cciudad
	WHERE pk_proveedor = cpk_proveedor;

END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Proveedor_Eliminar;
DELIMITER //
CREATE PROCEDURE Proveedor_Eliminar
(
	IN cpk_proveedor		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	DELETE FROM usuario WHERE fk_proveedor = cpk_proveedor;
	DELETE FROM proveedor WHERE pk_proveedor= cpk_proveedor;
END //
DELIMITER ;