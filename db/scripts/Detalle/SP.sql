DROP PROCEDURE IF EXISTS Detalle_Crear;
DELIMITER //
CREATE PROCEDURE Detalle_Crear
(
	IN ccantidad		INT,
	IN ctotal			FLOAT,
	IN cfk_producto		INT,
	IN cfk_movimiento	INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	INSERT INTO detalle (cantidad, total, fk_producto, fk_movimiento) 
	VALUES (ccantidad, ctotal, cfk_producto, cfk_movimiento);
END //
DELIMITER ;