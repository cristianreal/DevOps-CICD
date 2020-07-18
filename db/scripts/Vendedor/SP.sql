-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Crear;
DELIMITER //
CREATE PROCEDURE Vendedor_Crear
(
	IN cnombre				VARCHAR(50),
	IN capellido			VARCHAR(50),
	IN cdireccion			VARCHAR(50),
	IN ctelefono			VARCHAR(30),
	IN cemail				VARCHAR(50),
	IN cgenero 				INT,
	IN cfecha_nacimiento 	DATE,
   	IN cfecha_vinculacion 	DATE,
   	IN cjornada				INT,
	IN cpassword			VARCHAR(50)
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
	INSERT INTO vendedor (fecha_nacimiento, fecha_vinculacion, jornada, pass)
	VALUES (cfecha_nacimiento, cfecha_vinculacion, cjornada, PASSWORD(cpassword));

	SELECT @ultimo_vendedor := MAX(pk_vendedor) FROM vendedor;

	INSERT INTO usuario 
	(nombre,apellido,direccion,telefono,email,genero,tipo_usuario,fk_vendedor,fk_proveedor) 
	VALUES 
	(cnombre, capellido, cdireccion, ctelefono, cemail, cgenero, 2, @ultimo_vendedor, 0);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Listar;
DELIMITER //
CREATE PROCEDURE Vendedor_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT V.pk_vendedor, U.nombre, U.apellido, 
	U.direccion, U.telefono, U.email, V.jornada 
	FROM vendedor AS V 
	INNER JOIN usuario AS U ON V.pk_vendedor = U.fk_vendedor;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Login;
DELIMITER //
CREATE PROCEDURE Vendedor_Login
(
	IN cemail				VARCHAR(50),
	IN cpassword			VARCHAR(50)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT V.pk_vendedor, U.nombre, U.apellido, 
			U.direccion, U.telefono, U.email, V.jornada 
	FROM vendedor AS V 
	INNER JOIN usuario AS U 
	ON V.pk_vendedor = U.fk_vendedor
	WHERE U.email=cemail and V.pass=PASSWORD(cpassword);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Vendedor_Buscar_Por_Id
(
	IN cpk_vendedor		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT V.pk_vendedor, U.nombre, U.apellido, 
			U.direccion, U.telefono, U.email, V.jornada 
	FROM vendedor AS V 
	INNER JOIN usuario AS U 
	ON V.pk_vendedor = U.fk_vendedor AND V.pk_vendedor = cpk_vendedor;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Modificar;
DELIMITER //
CREATE PROCEDURE Vendedor_Modificar
(
	IN cpk_vendedor		INT,
	IN cnombre			VARCHAR(50),
	IN capellido		VARCHAR(50),
	IN cdireccion		VARCHAR(50),
	IN ctelefono		VARCHAR(30),
	IN cemail			VARCHAR(50),
	IN cjornada			INT
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
		WHERE fk_vendedor = cpk_vendedor;
	
	UPDATE vendedor
	SET jornada = cjornada
	WHERE pk_vendedor = cpk_vendedor;

END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Vendedor_Eliminar;
DELIMITER //
CREATE PROCEDURE Vendedor_Eliminar
(
	IN cpk_vendedor		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	DELETE FROM usuario WHERE fk_vendedor = cpk_vendedor;
	DELETE FROM vendedor WHERE pk_vendedor= cpk_vendedor;
END //
DELIMITER ;
-- ******************************************************************************