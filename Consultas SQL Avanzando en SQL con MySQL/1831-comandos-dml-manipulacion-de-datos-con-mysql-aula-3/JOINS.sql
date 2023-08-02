/*
	JOINS 
		JOIN
		INNER JOIN
        NATURAL JOIN
        LEFT JOIN
        RIGHT JOIN
*/

USE jugos_ventas;

SELECT  tabla_de_productos.codigo_del_producto ,tabla_de_productos.NOMBRE_DEL_PRODUCTO , items_facturas.NUMERO, facturas.MATRICULA
FROM tabla_de_productos NATURAL JOIN
	items_facturas	NATURAL JOIN
    facturas
WHERE MATRICULA = '00235';
		
