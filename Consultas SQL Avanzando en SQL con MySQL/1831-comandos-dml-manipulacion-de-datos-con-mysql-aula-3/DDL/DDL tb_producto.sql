CREATE TABLE `tb_producto2` (
  `codigo` varchar(10) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `sabor` varchar(50) DEFAULT NULL,
  `tamano` varchar(50) DEFAULT NULL,
  `envase` varchar(50) DEFAULT NULL,
  `precio_lista` float DEFAULT NULL,
  PRIMARY KEY (`codigo`)
);

INSERT INTO tb_producto2
(SELECT * FROM tb_producto);

UPDATE tb_producto2 set Precio_lista = precio_lista * 1.15
