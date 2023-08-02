USE ventas_jugos2;

SELECT * FROM tb_producto;

/*Update a un solo campo de un dato*/
UPDATE tb_producto SET precio_lista = 5
	WHERE codigo = '1000889';

UPDATE tb_producto SET descripcion = 'Sabor de la Montaña', 
					   tamano = '1 litro', envase = 'Botella PET'
WHERE codigo = '1000889';

SELECT * FROM tb_cliente;
    
/*Actualizando un campo para todos los registros*/
UPDATE tb_cliente SET volumen_compra = (volumen_compra/10);

UPDATE tb_cliente SET
 direccion = 'Jorge Emilio 23',
 barrio = 'San Antonio',
 ciudad = 'Guadalajara',
 estado = 'Jalisco',
 cp = '44700000'
WHERE DNI = '5840119709';

/**/
SELECT * FROM tb_vendedor;
SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT * FROM tb_vendedor a
	INNER JOIN jugos_ventas.tabla_de_vendedores b
	ON a.matricula = SUBSTRING(b.matricula,3,3);
    
UPDATE tb_vendedor a INNER JOIN
		jugos_ventas.tabla_de_vendedores b 
        ON a.matricula = SUBSTRING(b.matricula,3,3)
SET A.VACACIONES = b.Vacaciones;

SELECT A.DNI FROM tb_cliente A INNER JOIN tb_vendedor B
	ON A.barrio = B.BARRIO;

/* aumentar en 30% el volumen de compra de los clientes que tienen, en sus direcciones, barrios donde los vendedores cuentan con oficinas.*/
UPDATE tb_cliente A INNER JOIN tb_vendedor B 
		ON (A.barrio = B.barrio)
 SET volumen_compra = (volumen_compra*(1.3));
 
 /*
	Eliminar datos
 */
DELETE FROM tb_producto WHERE codigo = '1001000';
DELETE FROM tb_producto WHERE tamano = '1 Litro';

SELECT codigo_del_producto FROM jugos_ventas.tabla_de_productos;

DELETE FROM tb_producto 
WHERE codigo NOT IN (SELECT codigo_del_producto FROM jugos_ventas.tabla_de_productos);

DELETE A FROM tb_factura A
INNER JOIN 
tb_cliente B 
ON A.DNI = B.DNI
WHERE B.EDAD < 18;