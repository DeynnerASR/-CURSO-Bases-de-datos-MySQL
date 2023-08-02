USE jugos_ventas;

SELECT ENVASE, TAMANO FROM tabla_de_productos;

/*
	DISCTINCT
*/
SELECT  DISTINCT ENVASE, TAMANO FROM tabla_de_productos;

SELECT  DISTINCT ENVASE, TAMANO FROM tabla_de_productos
WHERE sabor = 'Naranja';

SELECT DISTINCT barrio FROM tabla_de_clientes
WHERE ciudad = 'Ciudad de México' ;

SELECT DISTINCT barrio FROM tabla_de_clientes
WHERE ciudad = 'Ciudad de México' LIMIT 3,3;

/*
	ORDER BY
*/
/*Mostrar toda la tabla de productos, ordenada por el precio de lista de forma ascendente*/
SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA ASC;

SELECT DISTINCT NOMBRE_DEL_PRODUCTO, TAMANO, PRECIO_DE_LISTA 
	FROM tabla_de_productos ORDER BY TAMANO DESC;
    
SELECT DNI, nombre, edad, sexo 
	FROM tabla_de_clientes
ORDER BY nombre ASC, edad DESC;

SELECT * FROM tabla_de_productos
	NATURAL JOIN items_facturas 
	WHERE tabla_de_productos.tamano = '1 Litro'
		AND sabor = 'Frutilla/Limón'
        AND nombre_del_producto = 'Refrescante'
ORDER BY items_facturas.cantidad DESC 
LIMIT 5; 

SELECT NOMBRE_DEL_PRODUCTO, SABOR, PRECIO_DE_LISTA
FROM tabla_de_productos
	WHERE nombre_del_producto = 'Clean'
    ORDER BY PRECIO_DE_LISTA ASC;

/*
	GROUP BY
*/
SELECT NOMBRE_DEL_PRODUCTO, SABOR,envase,tamano, MAX(PRECIO_DE_LISTA) AS maximo_precio
FROM tabla_de_productos
GROUP BY NOMBRE_DEL_PRODUCTO;

SELECT sabor,count(*) as cantidad_del_producto 
FROM tabla_de_productos
GROUP BY sabor
ORDER BY cantidad_del_producto ASC;

/*La edad maxima que cada barrio tiene*/
SELECT estado,barrio,max(edad) AS edad_mayor
FROM tabla_de_clientes
GROUP BY barrio ;

/*Cuantos items vendidos cuentan con la mayor cantidad del producto 1101035*/
SELECT codigo_del_producto, max(cantidad) AS items_vendidos
FROM items_facturas
WHERE codigo_del_producto = '1101035'
GROUP BY codigo_del_producto;


/*
	HAVING   
*/

/*Selecciono los nombres de los clientes que tienen la minima edad en su barrio, y ademas tienen una edad igual a 25*/
SELECT barrio, nombre, min(edad) AS edad_minima
FROM tabla_de_clientes
GROUP BY barrio
HAVING edad_minima = 25;

SELECT ENVASE, MAX(precio_de_lista) AS precio_maximo, MIN(precio_de_lista) AS precio_minimo
FROM tabla_de_productos
GROUP BY ENVASE
HAVING precio_maximo > 5;

SELECT ENVASE, MAX(precio_de_lista) AS precio_maximo, MIN(precio_de_lista) AS precio_minimo
FROM tabla_de_productos
GROUP BY ENVASE
HAVING SUM(precio_de_lista) > 80;

SELECT facturas.DNI, nombre, COUNT(nombre) AS cantidad_compras
FROM facturas 
	 INNER JOIN tabla_de_clientes ON (facturas.DNI = tabla_de_clientes.DNI)
WHERE year(fecha_venta) = 2015
GROUP BY fecha_venta
HAVING cantidad_compras > 70;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2015
GROUP BY DNI
HAVING COUNT(*) > 70;

SELECT DNI, fecha_venta
FROM facturas
WHERE year(fecha_venta)='2015';

SELECT * FROM tabla_de_productos;

/*
	CASE
    
    Es como un tipo de switch case, el cual evalua condiciones
*/

SELECT nombre_del_producto,tamano,sabor,
CASE
	WHEN (precio_de_lista  BETWEEN 30 AND 40) THEN 'Bastante Costoso'
    WHEN (precio_de_lista BETWEEN 19 AND 29) THEN 'Caro'
    WHEN (precio_de_lista BETWEEN 10 AND 18.9) THEN 'Economico'
    WHEN (precio_de_lista BETWEEN 0 AND 9.9) THEN 'Asequible'
    ELSE 'Precio con rango no deseado'
  END AS clasificacion
FROM tabla_de_productos;

SELECT nombre,fecha_de_nacimiento,
CASE 
	WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejo'
    WHEN YEAR(fecha_de_nacimiento) BETWEEN 1990 AND 1995 THEN 'Joven'
    WHEN YEAR(fecha_de_nacimiento) > 1995 THEN 'Niño'
END AS clasificacion
FROM tabla_de_clientes;
    

