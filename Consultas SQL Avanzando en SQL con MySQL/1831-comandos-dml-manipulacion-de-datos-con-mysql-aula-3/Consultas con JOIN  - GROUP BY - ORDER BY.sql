/*USANDO TODAS LAS QUERIES*/

SELECT * FROM tabla_de_vendedores;

SELECT tabla_de_vendedores.nombre,facturas.FECHA_VENTA, facturas.NUMERO, facturas.impuesto FROM tabla_de_vendedores
	INNER JOIN facturas
		ON (tabla_de_vendedores.MATRICULA = facturas.MATRICULA);

/*Calculando el total del impuesto que paga para cada vendedor*/
SELECT vendedor.nombre, SUM(factura.IMPUESTO) AS 'total_de_impuestos' FROM tabla_de_vendedores AS vendedor
	INNER JOIN facturas AS factura
		ON (vendedor.MATRICULA = factura.MATRICULA)
GROUP BY factura.MATRICULA;

/*Cantidad de ventas que realizo cada vendedor*/
SELECT factura.matricula, vendedor.nombre, COUNT(*) AS ventas_realizadas FROM tabla_de_vendedores AS vendedor
	INNER JOIN facturas AS factura
		ON (vendedor.MATRICULA = factura.matricula)
GROUP BY factura.MATRICULA, vendedor.nombre;

/*Obtener la facturacion anual de la empresa*/
SELECT YEAR(factura.FECHA_VENTA) AS 'año_de_venta', SUM(item.cantidad * item.precio) AS valor_financiero
FROM items_facturas AS item
 INNER JOIN facturas AS factura
	ON(item.numero = factura.numero)
GROUP BY YEAR('año_de_venta');

/*Mostrando los clientes que han o no realizado compras*/
SELECT DISTINCT a.dni, a.nombre, b.dni , a.ciudad FROM tabla_de_clientes a
	LEFT JOIN facturas b
		ON a.dni = b.dni
WHERE b.dni is NULL;

/*Mostrando todos los clientes de ciertos barrios que son atendidos o no por vendedores*/
SELECT tabla_de_clientes.NOMBRE AS nombre_cliente, tabla_de_clientes.ciudad ,tabla_de_clientes.BARRIO,
	   tabla_de_vendedores.NOMBRE as nombre_vendedor FROM 
	tabla_de_clientes LEFT JOIN tabla_de_vendedores ON (tabla_de_clientes.BARRIO = tabla_de_vendedores.barrio);
    
/*Quiero saber todos los barrios en los cuales mi empresa esta operando*/
SELECT DISTINCT barrio FROM tabla_de_clientes
UNION
SELECT DISTINCT barrio FROM tabla_de_vendedores;

/*Forma correcta de realizar el FULL JOIN en MySql*/
SELECT tabla_de_clientes.NOMBRE AS nombre_cliente, tabla_de_clientes.ciudad ,tabla_de_clientes.BARRIO,
	   tabla_de_vendedores.NOMBRE as nombre_vendedor FROM 
	tabla_de_clientes LEFT JOIN tabla_de_vendedores ON (tabla_de_clientes.BARRIO = tabla_de_vendedores.barrio)
UNION
SELECT tabla_de_clientes.NOMBRE AS nombre_cliente, tabla_de_clientes.ciudad ,tabla_de_clientes.BARRIO,
	   tabla_de_vendedores.NOMBRE as nombre_vendedor FROM 
	tabla_de_clientes RIGHT JOIN tabla_de_vendedores ON (tabla_de_clientes.BARRIO = tabla_de_vendedores.barrio);
    
