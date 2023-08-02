CREATE DATABASE ventas_jugos2;

USE ventas_jugos2;


CREATE TABLE tb_vendedor(
	matricula VARCHAR(5) NOT NULL,
    nombre VARCHAR(100),
    barrio VARCHAR(50),
    comision FLOAT,
    fecha_admision DATE,
    vacaciones BIT(1),
    
    
    PRIMARY KEY (matricula)
);

CREATE TABLE tb_productos(
	codigo VARCHAR(10) NOT NULL,
	descripcion VARCHAR(100),
    sabor VARCHAR(50),
    tamano VARCHAR(50),
    envase VARCHAR(50),
    precio_lista FLOAT,
    
    PRIMARY KEY (codigo)
);

CREATE TABLE clientes (
  DNI varchar(11) NOT NULL,
  NOMBRE varchar(100) DEFAULT NULL,
  DIRECCION varchar(150) DEFAULT NULL,
  BARRIO varchar(50) DEFAULT NULL,
  CIUDAD varchar(50) DEFAULT NULL,
  ESTADO varchar(45) DEFAULT NULL,
  CP varchar(8) DEFAULT NULL,
  FECHA_NACIMIENTO date DEFAULT NULL,
  EDAD int(2) DEFAULT NULL,
  SEXO varchar(1) DEFAULT NULL,
  LIMITE_CREDITO float DEFAULT NULL,
  VOLUMEN_COMPRA float DEFAULT NULL,
  PRIMERA_COMPRA bit(1) DEFAULT NULL,
  PRIMARY KEY (DNI));
  
  
  
  CREATE TABLE venta(
	numero VARCHAR(5) NOT NULL,
    fecha DATE,
    dni VARCHAR(11),
    matricula VARCHAR(5),
    impuesto FLOAT,
    
    PRIMARY KEY (numero),
    FOREIGN KEY (matricula)
		REFERENCES tb_vendedor(matricula),
	FOREIGN KEY (dni)
		REFERENCES clientes(DNI)
  );
  
  CREATE TABLE items_vendidos(
	numero VARCHAR(5) NOT NULL,
    codigo VARCHAR(10),
    cantidad INT,
    precio FLOAT,
    
    PRIMARY KEY (numero),
    FOREIGN KEY (numero)
		REFERENCES venta(numero),
	FOREIGN KEY (codigo)
		REFERENCES tb_productos(codigo)
  );
  
