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
DROP PROCEDURE IF EXISTS Movimiento_Listar;
DELIMITER //
CREATE PROCEDURE Movimiento_Listar()
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
	(Select u1.nombre from usuario as u1 where u1.pk_usuario=m.fk_vendedor) as vendedor, 
	(Select u2.nombre from usuario as u2 where u2.pk_usuario=m.fk_proveedor) as proveedor,
	fk_proveedor,
	fk_proveedor
	FROM movimiento as m;
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