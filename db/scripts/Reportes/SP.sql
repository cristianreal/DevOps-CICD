-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Sin_Existencia;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Sin_Existencia()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_producto, 
	nombre, 
	descripcion, 
	precio, 
	p.fk_marca, 
	(SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as marca, 
		/* Cantidad */
	IFNULL(((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	),0) as existencia
	FROM producto as p having existencia = 0;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Debajo_Limite;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Debajo_Limite(
	IN cLimite 				INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	pk_producto, 
	nombre, 
	descripcion, 
	precio, 
	p.fk_marca, 
	(SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as marca, 
		/* Cantidad */
	IFNULL(((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	),0)as existencia
	FROM producto as p having existencia <= cLimite;
END //
DELIMITER ;
-- ******************************************************************************
'''




'''
DROP PROCEDURE IF EXISTS Reporte_Productos_Sin_Existencia;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Sin_Existencia()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;

	SELECT * FROM movimiento
	WHERE YEAR(date_created) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
	AND MONTH(date_created) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)

	SELECT 
	pk_producto, 
	nombre, 
	descripcion, 
	precio, 
	p.fk_marca, 
	(SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as marca, 
		/* Cantidad */
	IFNULL(((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	),0) as existencia
	FROM producto as p having existencia = 0;
END //
DELIMITER ;
-- ******************************************************************************