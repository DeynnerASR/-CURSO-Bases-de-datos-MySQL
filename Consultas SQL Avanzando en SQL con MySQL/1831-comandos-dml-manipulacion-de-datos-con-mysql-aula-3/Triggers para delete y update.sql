/*
	TRIGGERS
    
*/
DROP TRIGGER TG_FACTURACION_UPDATE;

DELIMITER //
CREATE TRIGGER TG_FACTURACION_DELETE
AFTER DELETE ON tb_items_facturas1
FOR EACH ROW BEGIN
  DELETE FROM tb_facturacion;
  INSERT INTO tb_facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM tb_factura1 A
  INNER JOIN
  tb_items_facturas1 B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END //

DELIMITER //
CREATE TRIGGER TG_FACTURACION_UPDATE
AFTER UPDATE ON tb_items_facturas1
FOR EACH ROW BEGIN
  DELETE FROM tb_facturacion;
  INSERT INTO tb_facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM tb_factura1 A
  INNER JOIN
  tb_items_facturas1 B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END //

UPDATE tb_items_facturas1 SET CANTIDAD = 1000
WHERE NUMERO = '009' AND CODIGO = '1002767';

select * from tb_items_facturas1;
SELECT * FROM tb_facturacion;

DELETE FROM tb_items_facturas1 
WHERE NUMERO = '115' AND CODIGO = '1004327';

SELECT * FROM tb_facturacion;