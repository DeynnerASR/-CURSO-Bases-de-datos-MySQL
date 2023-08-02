USE jugos_ventas;

/*Funciones en MySQL*/
SELECT TRIM("   MYsql is easy my brother  ");
SELECT CONCAT("primera string","Segunda string");
SELECT UPPER('utilizando la base de datos con MySql');
SELECT SUBSTRING('utilizando la base de datos con MySql',32);
SELECT CONCAT(nombre, " " , dni) FROM tabla_de_clientes;
select * FROM vw_envases_grandes;
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '1995-02-11');

SELECT DISTINCT fecha_venta,
DAYNAME(fecha_venta) as dia, MONTHNAME(fecha_venta) AS mes, YEAR(fecha_venta) as año
FROM facturas;

/*Consulta que muestre el nombre y la edad actual del cliente*/
SELECT nombre,(YEAR(CURRENT_DATE()) - YEAR(fecha_de_nacimiento))  as edad 
FROM tabla_de_clientes;

SELECT NOMBRE, TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS    EDAD
FROM  tabla_de_clientes;

/*
	Funciones matematicas
*/

SELECT ceiling(23.111172);
SELECT RAND() AS RESULT;
SELECT ROUND(254.545,2);

SELECT NUMERO, CANTIDAD * PRECIO as facturacion FROM items_facturas;

SELECT * from facturas;
SELECT * from items_facturas;

SELECT CONCAT("La fecha y el hoprario son : "),
DATE_FORMAT(CURRENT_TIMESTAMP(), "%M / %Y - alas %T") AS RESULTADO;

SELECT CONVERT(23.45 , CHAR) AS 'numero tipo string';


