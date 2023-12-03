--EJ2 Modificar las tablas creadas:

--Tabla Stock: 
--Una columna de tipo fecha llamada FechaUltimaEntrada que por defecto tome el valor de la fecha actual.
--Una columna llamada Beneficio que contendrá el tipo de porcentaje de beneficio que esa tienda aplica en ese producto. Se debe controlar que el valor que almacene sea 1,2, 3, 4 o 5.
ALTER TABLE STOCK ADD fechaultimaentrada DATE DEFAULT SYSDATE;
ALTER TABLE STOCK ADD beneficio NUMBER(5);
ALTER TABLE STOCK ADD CONSTRAINT CHK_BENEFICIO CHECK (beneficio>0);

--Tabla Producto:
--Eliminar de la tabla producto la columna Descripción.
--Añadir una columna llamada perecedero que únicamente acepte los valores: S o N.
--Modificar el tamaño de la columna Denoproducto a 70.
ALTER TABLE PRODUCTO DROP COLUMN descripcion;
ALTER TABLE PRODUCTO ADD perecedero VARCHAR2(1);
ALTER TABLE PRODUCTO ADD CONSTRAINT CHK_PERECEDERO CHECK (perecedero IN ('S', 'N'));
ALTER TABLE PRODUCTO MODIFY denoproducto VARCHAR2(70);

--Tabla Familia:
--Añadir una columna llamada IVA, que represente el porcentaje de IVA y únicamente pueda contener los valores 21,10,ó 4.
ALTER TABLE FAMILIA ADD iva NUMBER(2);
ALTER TABLE FAMILIA ADD CONSTRAINT CHK_IVA CHECK (iva IN (21, 10, 4));

--Tabla Tienda:
--La empresa desea restringir el número de tiendas con las que trabaja, de forma que no pueda haber más de una tienda en una misma zona (la zona se identifica por el código postal). Definir mediante DDL las restricciones necesarias para que se cumpla en el campo correspondiente..
ALTER TABLE TIENDA ADD CONSTRAINT UQ_CODIGO_POSTAL UNIQUE (codigopostal);

--Renombrar la tabla Stock por Prodxtiendas.
RENAME STOCK TO PRODXTIENDAS;

--Eliminar la tabla Familia y su contenido si lo tuviera.
DROP TABLE FAMILIA CASCADE CONSTRAINTS;

--Crea un usuario llamado C##INVITADO siguiendo los pasos de la unidad 1 y dale todos los privilegios sobre la tabla PRODUCTO.
CREATE USER C##INVITADO IDENTIFIED BY PASSINVITADO;
GRANT ALL ON PRODUCTO TO C##INVITADO;
--CODIGO ERRONEO, no se como hacer que un usuario creado, en este caso c##jesus tenga los privilegios suficientes para crear otro usuario.

--Retira los permisos de modificar la estructura de la tabla y borrar contenido de la tabla PRODUCTO al usuario anterior.
REVOKE ALTER, DELETE ON PRODUCTO FROM C##INVITADO;
--CODIGO ERRONEO, evidentemente si no existe el usuario, esta linea tampoco funciona, con el usuario administrador esto si funcionaria.



