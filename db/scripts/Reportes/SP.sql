-- ################ Reporte 1 ###################################################
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
-- ################ Reporte 2 ###################################################
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
-- ################ Reporte 3 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Producto_Movimientos_Especifico_Mes;
DELIMITER //
CREATE PROCEDURE Reporte_Producto_Movimientos_Especifico_Mes(IN cpk_producto INT, IN mes INT )
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;


Select 

DATE_FORMAT((DATE(NOW()) - INTERVAL mes MONTH), "%d-%m-%y") as fecha,
(Select IFNULL(SUM(
	d1.cantidad
),0) 
from detalle as d1 where
d1.fk_movimiento in (
	Select m1.pk_movimiento FROM movimiento as m1 where
	m1.fecha_movimiento between 
	(DATE(NOW()) - INTERVAL mes MONTH) 
	and 
	(DATE(NOW()) - INTERVAL (mes-1) MONTH)
	and
	 tipo_movimiento = 1
) and d1.fk_producto = cpk_producto) as ingreso,
(Select IFNULL(SUM(
	d1.cantidad
),0) 
from detalle as d1 where
d1.fk_movimiento in (
	Select m1.pk_movimiento FROM movimiento as m1 where
	m1.fecha_movimiento between 
	(DATE(NOW()) - INTERVAL mes MONTH) 
	and 
	(DATE(NOW()) - INTERVAL (mes-1) MONTH)
	and
	 tipo_movimiento = 2
) and d1.fk_producto = cpk_producto) as egreso;

END //
DELIMITER ;
-- ################ Reporte 4 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Sin_Ventas;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Sin_Ventas(IN mes INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
Select 
	*,
	(
	 SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  
	d1.fk_producto=p.pk_producto
	and 
	d1.fk_movimiento in
	(
		Select
		m1.pk_movimiento
		from movimiento as m1
		where
		fecha_movimiento between 
		(DATE(NOW()) - INTERVAL mes MONTH) 
		and 
		(DATE(NOW()))
		and tipo_movimiento = 2
	)) as Egreso
	FROM
	producto as p having
	Egreso=0;
END //
DELIMITER ;
-- ################ Reporte 5 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Top_Ventas;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Top_Ventas(IN mes INT, IN N INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
Select 
	*,
	(
	 SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  
	d1.fk_producto=p.pk_producto
	and 
	d1.fk_movimiento in
	(
		Select
		m1.pk_movimiento
		from movimiento as m1
		where
		fecha_movimiento between 
		(DATE(NOW()) - INTERVAL mes MONTH) 
		and 
		(DATE(NOW()))
		and tipo_movimiento = 2
	)) as Egreso
	FROM
	producto as p having
	Egreso >0
	order by Egreso desc
	limit N;
END //
DELIMITER ;
-- ################ Reporte 6 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Top_Caros;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Top_Caros(IN N INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	Select 
	*
	from
	producto as p 
	order by precio desc
	limit N;
END //
DELIMITER ;
-- ################ Reporte 7 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Top_Baratos;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Top_Baratos(IN N INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	Select 
	*
	from
	producto as p 
	order by precio asc
	limit N;
END //
DELIMITER ;
-- ******************************************************************************
-- ################ Reporte 8 ###################################################
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Reporte_Productos_Top_Menos_Ventas;
DELIMITER //
CREATE PROCEDURE Reporte_Productos_Top_Menos_Ventas(IN mes INT, IN N INT)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
Select 
	*,
	(
	 SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  
	d1.fk_producto=p.pk_producto
	and 
	d1.fk_movimiento in
	(
		Select
		m1.pk_movimiento
		from movimiento as m1
		where
		fecha_movimiento between 
		(DATE(NOW()) - INTERVAL mes MONTH) 
		and 
		(DATE(NOW()))
		and tipo_movimiento = 2
	)) as Egreso
	FROM
	producto as p having
	Egreso >0
	order by Egreso asc
	limit N;
END //
DELIMITER ;