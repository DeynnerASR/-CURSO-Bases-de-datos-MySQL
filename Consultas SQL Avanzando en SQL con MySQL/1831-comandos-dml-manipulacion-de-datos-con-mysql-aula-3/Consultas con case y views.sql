USE jugos_ventas;

SELECT * FROM FACTURAS;
SELECT * FROM ITEMS_FACTURAS;

SELECT F.DNI, F.FECHA_VENTA, Ifa.cantidad
FROM facturas f INNER JOIN 
	items_facturas Ifa ON (f.numero = Ifa.numero);
    
    
SELECT F.DNI, DATE_FORMAT( F.FECHA_VENTA, "%m - %y") as MES_AÑO , Ifa.cantidad
FROM facturas f INNER JOIN 
	items_facturas Ifa ON (f.numero = Ifa.numero);
    
/*Cantidad de ventas por mes para cada cliente*/
SELECT F.DNI, DATE_FORMAT( F.FECHA_VENTA, "%m - %y") as MES_AÑO , SUM(Ifa.cantidad) AS cantidad_vendida 
FROM facturas f INNER JOIN 
	items_facturas Ifa ON (f.numero = Ifa.numero);

/*Que ventas se dan como validas o invalidas*/
SELECT A.DNI, A.NOMBRE, A.MES_AÑO, (CANTIDAD_MAXIMA - CANTIDAD_VENDIDA) AS DIFERENCIA, 
	  CASE 
		WHEN (CANTIDAD_MAXIMA - CANTIDAD_VENDIDA) >0 THEN 'venta valida'
        ELSE 'venta invalida'
	  END AS Estatus_venta
FROM (
	SELECT F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m -%y") AS MES_AÑO, SUM(IFa.cantidad) AS CANTIDAD_VENDIDA,
		   MAX(VOLUMEN_DE_COMPRA)/10 AS CANTIDAD_MAXIMA
    FROM facturas f INNER JOIN
		 items_facturas IFa 
			ON (F.numero = IFa.numero)
         INNER JOIN tabla_de_clientes TC
			ON TC.DNI = F.DNI
	GROUP BY
		F.DNI, TC.NOMBRE, DATE_FORMAT(F.FECHA_VENTA, "%m - %Y")) A;

/*La anterior consulta fue convertida en una view para facilitar su comprension y uso, como
vw_estatus_ventas
*/        
SELECT * FROM vw_estatus_ventas
WHERE Estatus_venta = 'venta invalida';


/*VENTAS REALIZADAS POR SABOR, CANTIDAD DE LITROS, % DE PARTICIPACION DE ESTAS VENTAS DE FORMA DESCENDENTE*/
SELECT pr.sabor, count(iFA.cantidad) as cantidad_vendida, pr.tamano 
FROM tabla_De_productos as pr INNER JOIN
	 items_facturas iFa
		ON (pr.codigo_del_producto = iFa.codigo_del_producto)
	 INNER JOIN facturas as fa
		ON (ifa.numero = fa.numero)
GROUP BY pr.sabor;


