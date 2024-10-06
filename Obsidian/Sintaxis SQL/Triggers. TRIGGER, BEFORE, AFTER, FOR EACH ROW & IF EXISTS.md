Un “trigger” o disparador genera un evento antes o después de insertar, actualizar o eliminar información en una tabla. Por ejemplo, si queremos crear un trigger que se ejecute después (after) de insertar en la tabla productos un registro, sería:

```sql
CREATE TRIGGER PRODUCTOS_AI AFTER INSERT ON PRODUCTOS…
```

**EJEMPLO TRIGGER REGISTROS (INSERT):**

Entonces, para insertar los datos del nuevo registro en otra tabla llamada REGISTROS_PRODUCTOS primero creamos la tabla:

```sql
CREATE TABLE REGISTROS_PRODUCTOS (

       CÓDIGOARTÍCULO VARCHAR(25),

       NOMBREARTÍCULO VARCHAR(30),

       PRECIO INT(4),

       INSERTADO DATETIME

);
```

Y ahora creamos el trigger que haga que al insertar un nuevo registro en la tabla PRODUCTOS, se inserte otro registro automáticamente en la tabla REGISTROS_PRODUCTOS con los respectivos datos:

```sql
CREATE TRIGGER PRODUCTOS_AI AFTER INSERT ON PRODUCTOS FOR EACH ROW INSERT INTO REG_PRODUCTOS

(CÓDIGOARTÍCULO, NOMBREARTÍCULO, PRECIO, INSERTADO)

VALUES

(NEW.CÓDIGOARTÍCULO, NEW.NOMBREARTÍCULO, NEW.PRECIO, NOW());
```

Con esto ya podríamos insertar un nuevo registro en la tabla PRODUCTOS y que se registrasen los datos automáticamente en la tabla REGISTROS_PRODUCTOS.

**EJEMPLO TRIGGER CAMBIOS (UPDATE):**

Creamos la tabla donde se almacenarán los datos antiguos antes de la actualización y los datos nuevos una vez actualizados los registros:

```sql
CREATE TABLE PRODUCTOS_ACTUALIZADOS (

       ANTERIOR_CÓDIGOARTÍCULO VARCHAR(4), NUEVO_CÓDIGOARTÍCULO VARCHAR(4),

       ANTERIOR_NOMBREARTÍCULO VARCHAR(25), NUEVO_NOMBREARTÍCULO VARCHAR(25),

       ANTERIOR_SECCIÓN VARCHAR(15), NUEVO_SECCIÓN VARCHAR(25),

       ANTERIOR_PRECIO INT(4), NUEVO_PRECIO INT(4),

       ANTERIOR_IMPORTADO VARCHAR(15), NUEVO_IMPORTADO VARCHAR(15),

       ANTERIOR_PAÍSDEORIGEN VARCHAR(15), NUEVO_PAÍSDEORIGEN VARCHAR(15),

       ANTERIOR_FECHA DATE, NUEVO_FECHA DATE,

       USUARIO VARCHAR(15), FECHA_MODIFICACION DATE

       );
```

Una vez creada la tabla, procedemos con la creación del trigger:

```sql
CREATE TRIGGER ACTUALIZA_PRODUCTOS_BU BEFORE UPDATE ON PRODUCTOS FOR EACH ROW INSERT INTO PRODUCTOS_ACTUALIZADOS (

            ANTERIOR_CÓDIGOARTÍCULO, NUEVO_CÓDIGOARTÍCULO,

       ANTERIOR_NOMBREARTÍCULO, NUEVO_NOMBREARTÍCULO,

       ANTERIOR_SECCIÓN, NUEVO_SECCIÓN,

       ANTERIOR_PRECIO, NUEVO_PRECIO,

       ANTERIOR_IMPORTADO, NUEVO_IMPORTADO,

       ANTERIOR_PAÍSDEORIGEN, NUEVO_PAÍSDEORIGEN,

       ANTERIOR_FECHA, NUEVO_FECHA,

       USUARIO, FECHA_MODIFICACION

)

       VALUES (

       OLD.CÓDIGOARTÍCULO, NEW.CÓDIGOARTÍCULO,

       OLD.NOMBREARTÍCULO, NEW.NOMBREARTÍCULO,

       OLD.SECCIÓN, NEW.SECCIÓN,

       OLD.PRECIO, NEW.PRECIO,

       OLD.IMPORTADO, NEW.IMPORTADO,

       OLD.PAÍSDEORIGEN, NEW.PAÍSDEORIGEN,

       OLD.FECHA, NEW.FECHA,

       CURRENT_USER, NOW()

);
```

Con la tabla para almacenar las actualizaciones y el trigger creado, creamos dos actualizaciones de ejemplo:

```sql
UPDATE PRODUCTOS SET PRECIO=PRECIO+500 WHERE CÓDIGOARTÍCULO='AR11';

UPDATE PRODUCTOS SET PAÍSDEORIGEN='FINLANDIA' WHERE CÓDIGOARTÍCULO='AR11';
```

Con estas dos sentencias se almacenarán dos registros en la tabla PRODUCTOS_ACTUALIZADOS, en el primer registro sólo cambiará PRECIO y en el segundo registro sólo cambiará PAÍSDEORIGEN.

**EJEMPLO TRIGGER ELIMINACIÓN (DELETE):**

Creamos la tabla donde se van a almacenar los registros eliminados:

```sql
CREATE TABLE PROD_ELIMINADOS (

       CÓDIGOARTÍCULO VARCHAR(5),

       NOMBREARTÍCULO VARCHAR(15),

       PAÍSDEORIGEN VARCHAR(15),

       PRECIO INTEGER,

       SECCIÓN VARCHAR(15)

       );
```

Entonces creamos el trigger de eliminación:

```sql
CREATE TRIGGER ELIM_PROD_AD AFTER DELETE ON PRODUCTOS FOR EACH ROW INSERT INTO PROD_ELIMINADOS (

            CÓDIGOARTÍCULO,

       NOMBREARTÍCULO,

       PAÍSDEORIGEN,

       PRECIO,

       SECCIÓN)

       VALUES

       (OLD.CÓDIGOARTÍCULO,

       OLD.NOMBREARTÍCULO,

       OLD.PAÍSDEORIGEN,

       OLD.PRECIO,

       OLD.SECCIÓN);
```

Una vez creado el trigger y la tabla para almacenar los eventos del trigger, eliminamos un registro como ejemplo:

```sql
DELETE FROM PRODUCTOS WHERE CÓDIGOARTÍCULO='AR26';
```

Y deberían almacenarse sólo los valores que hemos establecido en la tabla PROD_ELIMINADOS.

**ELIMINACIÓN Y MODIFICACIÓN DE TRIGGERS:**

Si queremos modificar el trigger anterior para que incluya el usuario que ha realizado la eliminación y la fecha de eliminación, primero modificamos la tabla del trigger añadiendo los campos USUARIO y FECHA_ELIM:

```sql
ALTER TABLE PROD_ELIMINADOS ADD COLUMN (USUARIO VARCHAR(15), FECHA_ELIM DATE);
```

Una vez modificada la tabla, modificamos el trigger, como no existe la sentencia ALTER TRIGGER, lo que tendríamos que hacer es eliminarlo y volverlo a crear, pero se puede escribir todo en un mismo código:

```sql
DROP TRIGGER IF EXISTS ELIM_PROD_AD;

CREATE TRIGGER ELIM_PROD_AD AFTER DELETE ON PRODUCTOS FOR EACH ROW INSERT INTO PROD_ELIMINADOS (

            CÓDIGOARTÍCULO,

       NOMBREARTÍCULO,

       PAÍSDEORIGEN,

       PRECIO,

       SECCIÓN,

USUARIO,

FECHA_ELIM)

       VALUES

       (OLD.CÓDIGOARTÍCULO,

       OLD.NOMBREARTÍCULO,

       OLD.PAÍSDEORIGEN,

       OLD.PRECIO,

       OLD.SECCIÓN,

CURRENT_USER,

NOW());
```

Después realizamos alguna eliminación en la tabla PRODUCTOS como estas dos:

```sql
DELETE FROM PRODUCTOS WHERE CÓDIGOARTÍCULO='AR25';

DELETE FROM PRODUCTOS WHERE CÓDIGOARTÍCULO='AR39';
```

Y veremos como en la tabla PROD_ELEIMINADOS aparecen dos nuevos registros, esta vez con el usuario que realizó la eliminación y la fecha.