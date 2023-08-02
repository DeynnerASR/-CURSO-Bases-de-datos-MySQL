/*
	Transacciones
	
    START TRANSACTION
    
    COMMIT | ROLLBACK
*/




SELECT * FROM tb_vendedor;

START TRANSACTION;
	INSERT INTO `ventas_jugos2`.`tb_vendedor`
	(`matricula`,
	`nombre`,
	`barrio`,
	`comision`,
	`fecha_admision`,
	`vacaciones`)
	VALUES
	('257',
	'Fernando Rojas',
	'Oblatos',
	'0.1',
	'2015-06-14',
	0);
	INSERT INTO `ventas_jugos2`.`tb_vendedor`
	(`matricula`,
	`nombre`,
	`barrio`,
	`comision`,
	`fecha_admision`,
	`vacaciones`)
	VALUES
	('258',
	'David',
	'Del valle',
	'0.1',
	'2015-06-14',
	0);

    UPDATE tb_vendedor SET comision = comision * 1.05;
COMMIT;    
    CREATE TABLE tb_identificacion(
		id int not null auto_increment,
        descripcion VARCHAR(50) NULL,
        
        Primary key(id)
    );

    INSERT INTO tb_identificacion(descripcion)  VALUES ('cliente mamon');
    INSERT INTO tb_identificacion(descripcion)  VALUES ('cliente sencillo');
    INSERT INTO tb_identificacion(descripcion)  VALUES ('cliente humilde');
    INSERT INTO tb_identificacion(descripcion)  VALUES ('cliente prro');
    INSERT INTO tb_identificacion(descripcion)  VALUES ('cliente gatuno');
    
    CREATE TABLE tb_default(
		id INT NOT NULL auto_increment,
        descipcion VARCHAR(45) NOT NULL,
        direccion VARCHAR(100) NOT NULL,
        Ciudad Varchar(50) default  'Monterrey',
        FECHA_DE_CREACION TIMESTAMP DEFAULT current_timestamp(),
        PRIMARY KEY (ID)
    );
    
    INSERT INTO tb_default (descipcion,direccion,ciudad) VALUES ('alura','calle gatuna ñau','Alameida');
    INSERT INTO tb_default (descipcion,direccion,ciudad) VALUES ('ERika','calle gatuna ñau','Alameida');
    SELECT * FROM tb_default;
 
