CREATE TABLE tb_facturacion(
	FECHA DATE NULL,
    venta_Tottal FLOAT
);

CREATE TABLE `tb_factura1` (
  `NUMERO` varchar(5) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `DNI` varchar(11) NOT NULL,
  `MATRICULA` varchar(5) NOT NULL,
  `IMPUESTO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  KEY `FK_CLIENTE1` (`DNI`),
  KEY `FK_VENDEDOR1` (`MATRICULA`),
  CONSTRAINT `FK_CLIENTE1` FOREIGN KEY (`DNI`) REFERENCES `tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR1` FOREIGN KEY (`MATRICULA`) REFERENCES `tb_vendedor` (`MATRICULA`)
) ;

CREATE TABLE `tb_items_facturas1` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUCTO1` (`CODIGO`),
  CONSTRAINT `FK_FACTURA1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO1` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
) ;

INSERT INTO tb_factura1 
VALUES('0100', '2021-01-01', '1471156710', '235', 0.10 );

INSERT INTO tb_items_facturas1
VALUES
('0101', '1002767', 100, 25),
('4055', '1004327', 200, 25),
('4056', '1013793', 300, 25);

SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_factura1;

/*
	TRIGGERS
*/

/*Este trigger se activara cuando se haga un insert ala tabla tb_items_facturas1*/
DELIMITER //
CREATE TRIGGER TG_FACTURACION_INSERT 
AFTER INSERT ON tb_items_facturas1
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

INSERT INTO tb_factura
VALUES('227', '2021-01-01', '1471156710', '235', 0.10 );

INSERT INTO tb_items_facturas1
VALUES('227', '1002767', 100, 25),
	  ('227', '1004327', 200, 25),
	  ('227', '1013793', 300, 25);
      
SELECT * FROM tb_facturacion;

SELECT * FROM tb_factura1;

/*Trigger para cliente*/
DELIMITER //
CREATE TRIGGER TG_EDAD_CLIENTES_INSERT
BEFORE INSERT ON tb_cliente
FOR EACH ROW
BEGIN
    SET NEW.EDAD =  timestampdiff(YEAR, NEW.FECHA_NACIMIENTO, NOW());
END
//

