-- TipoMovimiento = 1->Ingresos, 2->Egresos
DROP TABLE IF EXISTS movimiento;
CREATE TABLE movimiento(
	pk_movimiento		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	tipo_movimiento		INT,
	fecha_movimiento	DATE,
	fk_vendedor			INT,
	fk_proveedor		INT,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);