-- ******************************************************************************
DROP PROCEDURE IF EXISTS Ingreso_Movimiento;
DELIMITER //
CREATE PROCEDURE Ingresos_Movimiento
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
	SELECT pk_movimiento, tipo_movimiento, fecha_movimiento, fk_vendedor, fk_proveedor FROM movimiento where tipo_movimiento =1;
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
	SELECT pk_movimiento, tipo_movimiento, fecha_movimiento, fk_vendedor, fk_proveedor FROM movimiento where tipo_movimiento =2;
END //
DELIMITER ;
-- ******************************************************************************