/*
	VIEWS
*/

SELECT ENVASE, MAX(precio_De_lista)
AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

/*
	Utilizando la VIEW vw_envases_grandes
*/
SELECT X.ENVASE, X.PRECIO_MAXIMO 
FROM vw_envases_grandes AS x
WHERE x.PRECIO_MAXIMO >= 10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, B.PRECIO_MAXIMO
FROM tabla_de_productos as A 
	INNER JOIN vw_envases_grandes AS B
    ON (A.envase = B.envase);
    
SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA,
	   ((A.PRECIO_DE_LISTA/ B.PRECIO_MAXIMO)-1)*100 AS PORCENTAJE_DE_VARIACION
FROM tabla_de_productos as A 
	INNER JOIN vw_envases_grandes AS B
    ON (A.envase = B.envase);