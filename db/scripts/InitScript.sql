USE test_proyectoeps;
-- CREATE TABLES
 source ./scripts/Usuario/INIT.sql
 source ./scripts/Movimiento/INIT.sql
 source ./scripts/Detalle/INIT.sql
 source ./scripts/Producto/INIT.sql
 source ./scripts/Marca/INIT.sql
 source ./scripts/Proveedor/INIT.sql
 source ./scripts/Vendedor/INIT.sql
-- CREATE STORE PROCEDURE
source ./scripts/Marca/SP.sql
source ./scripts/Producto/SP.sql
source ./scripts/Detalle/SP.sql
source ./scripts/Movimiento/SP.sql
source ./scripts/Proveedor/SP.sql
source ./scripts/Vendedor/SP.sql
source ./scripts/Reportes/SP.sql
-- FILL TABLES
source ./scripts/Populardb.sql
-- show tables;
-- show PROCEDURE STATUS;
