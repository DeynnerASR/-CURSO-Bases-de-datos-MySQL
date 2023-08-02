/*
	Subconsultas
*/

use jugos_ventas;

SELECT DISTINCT barrio FROM tabla_de_vendedores;

/*Mostrar todos los clientes los cuales viven en los barrios que estan registrados en la tabla*/
SELECT * from tabla_de_clientes
	WHERE barrio IN (SELECT DISTINCT barrio FROM tabla_de_vendedores);
    







