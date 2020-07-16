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