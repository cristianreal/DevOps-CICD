DROP PROCEDURE IF EXISTS Detalle_Crear;
DELIMITER //
CREATE PROCEDURE Detalle_Crear
(
	IN ccantidad		INT,
	IN ctotal			FLOAT,
	IN cfk_producto		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SET @movimiento = (SELECT pk_movimiento FROM movimiento ORDER BY pk_movimiento DESC LIMIT 1);
	INSERT INTO detalle (cantidad, total, fk_producto, fk_movimiento) 
	VALUES (ccantidad, ctotal, cfk_producto, @movimiento);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Detalle_Movimiento;
DELIMITER //
CREATE PROCEDURE Detalle_Movimiento(
	IN cpk_movimiento		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT
		cantidad,
		total,
		(SELECT nombre from producto as p1 where p1.pk_producto=d.fk_producto) as producto,
		(SELECT precio from producto as p2 where p2.pk_producto=d.fk_producto) as precio,
		fk_producto,
	FROM detalle as d WHERE d.fk_movimiento = cpk_movimiento;
END //
DELIMITER ;
-- ******************************************************************************
