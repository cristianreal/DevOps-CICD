DROP PROCEDURE IF EXISTS Producto_Crear;
DELIMITER //
CREATE PROCEDURE Producto_Crear
(
	IN cnombre			VARCHAR(50),
	IN cdescripcion		VARCHAR(50),
	IN cprecio			FLOAT,
	IN cfk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	INSERT INTO producto (nombre, descripcion, precio, fk_marca) 
	VALUES (cnombre, cdescripcion, cprecio, cfk_marca);
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Listar;
DELIMITER //
CREATE PROCEDURE Producto_Listar()
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
	/* Marca */
	(SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as Marca,
	/* Cantidad */
	((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	)as existencia
	FROM producto as p;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Buscar_Por_Id;
DELIMITER //
CREATE PROCEDURE Producto_Buscar_Por_Id(
	IN cpk_producto		INT
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
	((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	)as existencia
	FROM producto as p WHERE pk_producto=cpk_producto;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Detalle_Movimientos;
DELIMITER //
CREATE PROCEDURE Producto_Detalle_Movimientos(
	IN cpk_producto		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
Select 
	pk_movimiento,
	DATE_FORMAT(fecha_movimiento, "%d-%m-%y") as fecha_movimiento,
	case 
		when tipo_movimiento=1 then 'ingreso'
		when tipo_movimiento=2 then 'egreso'
	end as tipo_movimiento,
	case
 		when tipo_movimiento=1 then (SELECT sum(d1.cantidad) FROM detalle as d1 where  d1.fk_movimiento=m1.pk_movimiento and d1.fk_producto=cpk_producto)
		when tipo_movimiento=2 then 0
	end as cantidadIngreso,
	case
 		when tipo_movimiento=1 then 0
		when tipo_movimiento=2 then (SELECT sum(d1.cantidad) FROM detalle as d1 where  d1.fk_movimiento=m1.pk_movimiento and d1.fk_producto=cpk_producto)
	end as catidadEgreso
FROM movimiento as m1 where m1.pk_movimiento in (SELECT d1.fk_movimiento FROM detalle as d1 where d1.fk_producto=cpk_producto);

END //
DELIMITER ;
-- ******************************************************************************

DROP PROCEDURE IF EXISTS Producto_Modificar;
DELIMITER //
CREATE PROCEDURE Producto_Modificar
(
	IN cpk_producto		INT,
	IN cnombre			VARCHAR(50),
	IN cdescripcion		VARCHAR(50),
	IN cprecio			FLOAT,
	IN cfk_marca		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	UPDATE producto 
	SET nombre=cnombre, descripcion = cdescripcion, precio = cprecio, fk_marca = cfk_marca 
	WHERE pk_producto=cpk_producto;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Eliminar;
DELIMITER //
CREATE PROCEDURE Producto_Eliminar
(
	IN cpk_producto		INT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	DELETE FROM producto WHERE pk_producto=cpk_producto;
END //
DELIMITER ;
-- ******************************************************************************