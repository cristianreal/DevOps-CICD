DROP TABLE IF EXISTS detalle;
CREATE TABLE detalle(
	cantidad		INT,
	total			FLOAT,
	fk_producto		INT,
	fk_movimiento	INT,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);