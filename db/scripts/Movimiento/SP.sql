-- ******************************************************************************
DROP PROCEDURE IF EXISTS Ingreso_Movimiento;
DELIMITER //
CREATE PROCEDURE Ingreso_Movimiento
(
	IN cfecha_movimiento 	DATE,
	IN cfk_vendedor 		INT,
	IN cfk_proveedor 		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	-- TipoMovimiento = 1->Ingresos, 2->Egresos
	INSERT INTO movimiento (tipo_movimiento, fecha_movimiento, fk_vendedor, fk_proveedor) 
	VALUES (1, cfecha_movimiento, cfk_vendedor, cfk_proveedor);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Egreso_Movimiento;
DELIMITER //
CREATE PROCEDURE Egreso_Movimiento
(
	IN cfecha_movimiento 	DATE,
	IN cfk_vendedor 		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	-- TipoMovimiento = 1->Ingresos, 2->Egresos
	INSERT INTO movimiento (tipo_movimiento, fecha_movimiento, fk_vendedor, fk_proveedor) 
	VALUES (2, cfecha_movimiento, cfk_vendedor, 0);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Ingreso_Listar;
DELIMITER //
CREATE PROCEDURE Ingreso_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_movimiento, 
	tipo_movimiento, 
	DATE_FORMAT(fecha_movimiento, "%d-%m-%y") as fecha_movimiento,
	(Select concat(u1.nombre,' ',u1.apellido) from usuario as u1 where u1.pk_usuario=m.fk_vendedor) as vendedor, 
	(Select concat(u2.nombre,' ',u2.apellido) from usuario as u2 where u2.pk_usuario=m.fk_proveedor) as proveedor,
	fk_vendedor,
	fk_proveedor,
	(Select sum(d1.total) from detalle as d1 where d1.fk_movimiento = m.pk_movimiento) as total
	FROM movimiento as m
	where tipo_movimiento=1;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Ingreso_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Ingreso_Buscar_Por_Id(
	IN cpk_movimiento		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_movimiento, 
	tipo_movimiento, 
	fecha_movimiento, 
	(Select concat(u1.nombre,' ',u1.apellido) from usuario as u1 where u1.pk_usuario=m.fk_vendedor) as vendedor, 
	(Select concat(u2.nombre,' ',u2.apellido) from usuario as u2 where u2.pk_usuario=m.fk_proveedor) as proveedor,
	fk_vendedor,
	fk_proveedor,
	(Select sum(d1.total) from detalle as d1 where d1.fk_movimiento = m.pk_movimiento) as total
	FROM movimiento as m
	where m.tipo_movimiento=1 and m.pk_movimiento = cpk_movimiento;
END //
DELIMITER ;

-- ******************************************************************************
DROP PROCEDURE IF EXISTS Egreso_Listar;
DELIMITER //
CREATE PROCEDURE Egreso_Listar()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_movimiento, 
	tipo_movimiento, 
	fecha_movimiento, 
	(Select concat(u1.nombre,' ',u1.apellido) from usuario as u1 where u1.pk_usuario=m.fk_vendedor) as vendedor, 
	fk_vendedor,
	(Select sum(d1.total) from detalle as d1 where d1.fk_movimiento = m.pk_movimiento) as total
	FROM movimiento as m
	where tipo_movimiento=2;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Egreso_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Egreso_Buscar_Por_Id(
		IN cpk_movimiento		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_movimiento, 
	tipo_movimiento, 
	fecha_movimiento, 
	(Select concat(u1.nombre,' ',u1.apellido) from usuario as u1 where u1.pk_usuario=m.fk_vendedor) as vendedor, 
	fk_vendedor,
	(Select sum(d1.total) from detalle as d1 where d1.fk_movimiento = m.pk_movimiento) as total
	FROM movimiento as m
	where m.tipo_movimiento=2 and m.pk_movimiento = cpk_movimiento;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Movimiento_Eliminar;
DELIMITER //
CREATE PROCEDURE Movimiento_Eliminar
(
	IN cpk_movimiento		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	DELETE FROM detalle WHERE fk_movimiento=cpk_movimiento;
	DELETE FROM movimiento WHERE pk_movimiento=cpk_movimiento;
END //
DELIMITER ;
-- ******************************************************************************