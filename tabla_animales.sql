USE animales;

CREATE TABLE animales(
    ID INT,
    tipo varchar(255),
    estado varchar(255),
    PRIMARY KEY(ID)
);

-- Moficar tabla
ALTER TABLE animales MODIFY COLUMN id INT auto_increment; 

-- SHOW CREATE TABLE animales;

-- crear una tabla
CREATE TABLE `animales` ( 
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `tipo` varchar(255) DEFAULT NULL,
    `estado` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`) 
);

-- ----------------------------------------CRUD----------------------------------------

-- Insertar valores C 
INSERT INTO animales (tipo, estado) VALUES ('chanchito', 'feliz');
INSERT INTO animales (tipo, estado) VALUES ('dragon', 'feliz');
INSERT INTO animales (tipo, estado) VALUES ('felipe', 'triste');

-- consultar valores R
SELECT * FROM animales;
SELECT * FROM animales WHERE id = 1;
SELECT * FROM animales WHERE estado = 'feliz';
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'chanchito';
SELECT * FROM animales WHERE id BETWEEN 4 AND 6;

-- Actualizar datos U
UPDATE animales SET estado = 'feliz' WHERE tipo = 'felipe';
UPDATE animales SET estado = 'triste' WHERE id = 5;

-- Eliminar registros D
DELETE FROM animales WHERE estado = 'feliz'; -- Esto genera un error 

SELECT * FROM animales;     

---------------------------------------------------------------------------------------





----------------------------------------Crear tabla user-------------------------------------------------

-- Crear nueva tabla user
CREATE TABLE user(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    edad INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

-- Insertar datos    C
INSERT INTO user (name, edad, email) VALUES ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Nicolas', 36, 'nicolas@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Chanchito', 7, 'oscar@gmail.com');

-- Seleccionar datos R
SELECT * FROM user;
SELECT * FROM user LIMIT 1; --Limitar la busqueda a cantidades
SELECT * FROM user WHERE edad > 15; -- usar operadores matematicos en las busquedas
SELECT * FROM user WHERE edad >= 15;-- Usar operadores matema
SELECT * FROM user WHERE edad > 20 AND email = 'nicolas@gmail.com'; -- Buscar usando dos condiciones y que se cumplan las dos si o si
SELECT * FROM user WHERE edad > 20 OR email = 'layla@gmail.com';-- Buscar usando dos condiciones y que se cumplan cualquiera de las dos
SELECT * FROM user WHERE email != 'layla@gmail.com';-- Negacion de una condicion, devuelve los registros que no cumplan con esta condicion
SELECT * FROM user WHERE edad BETWEEN 15 AND 30; -- Buscando en medio de dos argumentos
SELECT * FROM user WHERE email LIKE '%gmail%'; -- Buscar por cadenas sin importar como inicie o como finalice
SELECT * FROM user WHERE email LIKE '%gmail'; -- Buscar por cadenas sin importar como inicie
SELECT * FROM user WHERE email LIKE 'oscar%'; -- Buscar por cadenas sin importar como finalice
SELECT * FROM user ORDER BY edad ASC; -- Buscar por edad en orden ascendente
SELECT * FROM user ORDER BY edad DESC; -- Buscar por edad en orden descendente
-- MAX y MIN son funciones
SELECT MAX(edad) AS mayor FROM user; -- Buscar por la mayor edad, en una tabla provisional llamada mayor
SELECT MIN(edad) AS menor FROM user; -- Buscar el menor registro en una tabla provisional llamada menor

-- Otra forma de busquedas sin seleccionar todos los datos
SELECT id, name FROM user;-- Buscar solamente las columnas nombradas
SELECT id, name AS chanchito FROM user;-- Cambiar el nombre de las columnas

--------------------------------------------------------------------------------------------------------





--------------------------------------------------------JOIN--------------------------------------------

-- Crear nueva tabla products
CREATE TABLE products(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_by INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    PRIMARY KEY(id), -- Definir la llave primaria de esta nueva tabla
    FOREIGN KEY(created_by) REFERENCES user (id) -- Definir la llave foranea, references es referencia a la tabla y la colunma a la cual se hace referencia
);

--Renombrar una tabla
RENAME TABLE products TO product; 

-- Insertar datos otra alternativa
-- Insertar varios datos en un solo Insert
INSERT INTO product (name, created_by, marca)
VALUES  
    ('iPad', 1, 'Apple'),
    ('iPhone', 1, 'Apple'),
    ('Watch', 2, 'Apple'),
    ('MacBook', 1, 'Apple'),
    ('iMac', 3, 'Apple'),
    ('iPad Mini', 2, 'Apple')
;

SELECT * FROM product;

------------------------------------------------------------------ LEFT JOIN--------------------------------------------------------------------
-- En este caso usa la tabla de user como la tabla principal

SELECT u.id, u.email, p.name FROM user u LEFT JOIN product p ON u.id = p.created_by;


------------------------------------------------------------------RIGHT JOIN--------------------------------------------------------------------
-- En este caso usa la tabla product como la tabla principal

SELECT u.id, u.email, p.name FROM user u RIGHT JOIN product p ON u.id = p.created_by;

------------------------------------------------------------------INNER JOIN--------------------------------------------------------------------
-- En este caso trae tanto usuarios como productos siempre y cuando estos puedan ser asociados

SELECT u.id, u.email, p.name FROM user u INNER JOIN product p ON u.id = p.created_by;


------------------------------------------------------------------CROSS JOIN--------------------------------------------------------------------

SELECT u.id, u.name, p.id, p.name FROM user u CROSS JOIN product p;


-- GROUP BY
SELECT COUNT(id), marca FROM product GROUP BY marca;


SELECT COUNT(p.id), u.name FROM product p LEFT JOIN user u ON u.id = p.created_by GROUP BY p.created_by;

SELECT COUNT(p.id), u.name FROM product p LEFT JOIN user u ON u.id = p.created_by GROUP BY p.created_by HAVING COUNT(p.id) >= 2;

-- Eliminar tablas

DROP TABLE product;
DROP TABLE animales;
DROP TABLE user;



-- Script creado por workbench
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
;