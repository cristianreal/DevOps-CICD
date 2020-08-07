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
	(SELECT m.nombre FROM marca as m WHERE m.pk_marca = p.fk_marca) as marca,
	/* Cantidad */
	IFNULL(((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	),0) as existencia
	FROM producto as p;
END //
DELIMITER ;
-- ******************************************************************************
DROP PROCEDURE IF EXISTS Producto_Total;
DELIMITER //
CREATE PROCEDURE Producto_Total()
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SHOW ERRORS;
END;
	SELECT 
	count(*) as total
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
	IFNULL(((SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 1 ) and d1.fk_producto=p.pk_producto)
	-
	(SELECT sum(d1.cantidad)  as cantidad  FROM detalle as d1 where  d1.fk_movimiento in (SELECT m1.pk_movimiento FROM movimiento as m1 where m1.tipo_movimiento = 2 ) and d1.fk_producto=p.pk_producto)
	),0) as existencia
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
m1.pk_movimiento ,
DATE_FORMAT(m1.fecha_movimiento, "%d-%m-%y") as fecha_movimiento,
case 
		when m1.tipo_movimiento=1 then 'ingreso'
		when m1.tipo_movimiento=2 then 'egreso'
end as tipo_movimiento,
/* ------------------ */
	case
 		when m1.tipo_movimiento=1 then (SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  d1.fk_producto=cpk_producto and d1.fk_movimiento=m1.pk_movimiento)
		when m1.tipo_movimiento=2 then 0
	end as cantidadIngreso,
	case
 		when m1.tipo_movimiento=1 then 0
		when m1.tipo_movimiento=2 then (SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  d1.fk_producto=cpk_producto and d1.fk_movimiento=m1.pk_movimiento)
	end as catidadEgreso,
/* ------------------ */
	(
	 (SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  
	d1.fk_producto=cpk_producto
	and 
	d1.fk_movimiento in
	(
		Select
		m2.pk_movimiento
		from movimiento as m2
		where
		fecha_movimiento <= m1.fecha_movimiento
		and tipo_movimiento = 1
	))
	-
	 (SELECT IFNULL(sum(d1.cantidad),0) FROM detalle as d1 where  
	d1.fk_producto=cpk_producto
	and 
	d1.fk_movimiento in
	(
		Select
		m2.pk_movimiento
		from movimiento as m2
		where
		fecha_movimiento <= m1.fecha_movimiento
		and tipo_movimiento = 2
	))
	) as existencia

FROM movimiento as m1 where
	m1.fecha_movimiento <= 
	(DATE(NOW()) ) and m1.pk_movimiento in(
		Select d1.fk_movimiento from detalle as d1 where d1.fk_producto = cpk_producto
	) order by m1.fecha_movimiento asc
	;

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