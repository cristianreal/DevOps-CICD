-- JORNADA = 1->Matutina, 2->Vespertina
CREATE TABLE IF NOT EXISTS vendedor(
	pk_vendedor			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	fecha_nacimiento	DATE,
	fecha_vinculacion	DATE,
	jornada				INT,
	pass			VARCHAR(50),
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);