/*
	Commandos 
    -LIMIT 
    -LIKE

*/

USE jugos_ventas;

/*
	LIMIT
*/

SELECT DNI, NOMBRE, DIRECCION_1, EDAD
FROM tabla_de_clientes
LIMIT 6;

SELECT * FROM tabla_de_productos
WHERE sabor IN ('Mango','Uva')
LIMIT 15;

SELECT * FROM tabla_de_productos LIMIT 5,5;

SELECT * FROM facturas  WHERE FECHA_VENTA = '2017-01-01' LIMIT 10;

/*
	LIKE
*/

SELECT * FROM tabla_de_productos
WHERE sabor LIKE ('%manzana%');
    
SELECT * FROM tabla_de_clientes
WHERE nombre LIKE ('%ez');

SELECT * FROM tabla_de_vendedores
	WHERE matricula = '00235';
    
