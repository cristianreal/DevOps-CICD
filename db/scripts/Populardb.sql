-- ******************************************************************************
CALL Marca_Crear('Faber-Castell','Guatemala','www.fabercastell.com');
CALL Marca_Crear('Tucan','Guatemala','www.tucan.com');
CALL Marca_Crear('Casio','Guatemala','www.casio.com');
CALL Marca_Crear('Pilot','Guatemala','www.pilot.com');
CALL Marca_Crear('Bic','Guatemala','www.bic.com');
-- ******************************************************************************
CALL Vendedor_Crear('ADMIN', '', 'Guatemala', '12345678', 'admin@gmail.com', 1, '1996-05-20', '2020-05-15', 1,"123456");
CALL Vendedor_Crear('Lionel', 'Messi', 'Barcelona', '12345678', 'messi@gmail.com', 1, '1996-05-20', '2020-05-15', 1,"ABC");
CALL Vendedor_Crear('Miguel', 'Ruano', 'Chimaltenango', '87654321', 'miguel@gmail.com', 1, '1994-07-24', '2020-05-15', 1,"DEF");
CALL Vendedor_Crear('Andrea', 'Lopez', 'Guatemala', '12345678', 'andrea@gmail.com', 2, '1999-01-07', '2020-05-15', 2,"GHI");
CALL Vendedor_Crear('Lucia', 'Flores', 'Mexico', '87654321', 'lucia@gmail.com', 2, '2001-03-16', '2020-05-15', 2,"JKL");
-- ******************************************************************************
-- CALL Vendedor_Modificar(1, 'Andres', 'Iniesta', 'Switzerland', '11111111', 'ai@gmail.com', 2);
-- ******************************************************************************
CALL Proveedor_Crear('Antonio','Hernandez', 'Guatemala', '65478124', 'ant@gmail.com', 1, 'www.mattel.com', 'Switzerland', 'Luxemburgo');
CALL Proveedor_Crear('Lucas','Perez', 'Honduras', '14571234', 'lu@gmail.com', 1, 'www.test1.com', 'Germany', 'Chelsea');
CALL Proveedor_Crear('Raul','Lozano', 'Mexico', '21479563', 'ra@gmail.com', 1, 'www.test2.com', 'Netherlands', 'Henna');
CALL Proveedor_Crear('Fernando','Abad', 'Costa Rica', '42135687', 'fer@gmail.com', 1, 'www.test3.com', 'Spain', 'Madrid');
-- ******************************************************************************
call Producto_Crear('Producto A','Sirve para muchas cosas',15.23,1);
call Producto_Crear('Producto B','Sirve para muchas cosas',19,2);
call Ingreso_Movimiento('2020-07-15',1,5);
call Detalle_Crear(5,123,1);
call Detalle_Crear(5,245,2);
call Egreso_Movimiento('2020-07-16',2);
call Detalle_Crear(3,78,1);
call Detalle_Crear(2,896,2);