-- GENERO= 1->Masculino, 2->Femenino
-- TipoUsuario = 1->Admin, 2->Vendedor, 3->Proveedor
CREATE TABLE IF NOT EXISTS usuario(
	pk_usuario		INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre			VARCHAR(50),
	apellido		VARCHAR(50),
	direccion		VARCHAR(50),
	telefono		VARCHAR(30),
	email			VARCHAR(50),
	genero			INT,
	tipo_usuario	INT,
	fk_vendedor		INT,
	fk_proveedor	INT,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);