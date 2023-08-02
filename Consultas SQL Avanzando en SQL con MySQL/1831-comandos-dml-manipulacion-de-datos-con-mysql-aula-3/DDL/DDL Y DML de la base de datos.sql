use ventas_jugos2;

ALTER TABLE venta RENAME tb_factura;
ALTER TABLE clientes RENAME tb_cliente;
ALTER TABLE tb_productos RENAME tb_producto;
ALTER TABLE items_vendidos RENAME tb_items_facturas;

INSERT INTO tb_cliente (SELECT * FROM jugos_ventas.tabla_de_clientes);

USE ventas_jugos;
INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE,
PRECIO_LISTA) VALUES ('1040107', 'Light', 'Sandía', '350 ml', 'Lata', 4.56);

INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE,
PRECIO_LISTA) VALUES ('1040108', 'Guanábana', 'Light', '350 ml', 'Lata', 4.00);

INSERT INTO tb_producto VALUES 
('1040109', 'Light', 'Asaí', '350 ml', 'Lata', 5.60), 
('1040110', 'Light', 'Manzana', '350 ml', 'Lata', 6.00),
('1040111', 'Light', 'Mango', '350 ml', 'Lata', 3.50);

INSERT INTO tb_producto
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);