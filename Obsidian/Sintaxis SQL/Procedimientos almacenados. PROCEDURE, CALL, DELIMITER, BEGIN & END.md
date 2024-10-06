
Los procedimientos almacenados son una manera de automatizar sentencias y comprimirlas para a la hora de querer hacer algo, sólo tener que introducir ciertos valores pasándolos por parámetros o simplemente darle a un botón.

Por ejemplo, si queremos cambiar el precio de un producto de la tabla PRODUCTOS haríamos el siguiente procedimiento:

``` sql
CREATE PROCEDURE ACTUALIZA_PRODUCTOS (N_PRECIO DOUBLE, CODIGO VARCHAR(4))

UPDATE PRODUCTOS SET PRECIO=N_PRECIO WHERE CÓDIGOARTÍCULO=CODIGO;
```

En la primera sentencia creamos el procedimiento con las palabras reservadas CREATE PROCEDURE y estableciendo los parámetros a introducir, en la segunda sentencia le damos una función a los parámetros. Entonces, para llamar al procedimiento y establecer un nuevo precio

``` sql
CALL ACTUALIZA_PRODUCTOS(37, 'AR01');
```

Entonces el precio del producto con código AR01 será 37, si queremos volver al mismo precio, tendríamos que hacer lo mismo introduciendo el precio anterior:

``` sql
CALL ACTUALIZA_PRODUCTOS(6.6280, 'AR01');
```

Si queremos eliminar el procedimiento escribiríamos:

``` sql
DROP PROCEDURE ACTUALIZA_PRODUCTOS;
```

Si queremos crear un procedimiento almacenado más complejo, por ejemplo, que nos devuelva la edad que tenemos según nuestro año de nacimiento, lo haríamos de la siguiente forma declarando variables y estableciendo un bloque de código con BEGIN y END:

``` sql
CREATE PROCEDURE CALCULA_EDAD (AGNO_NACIMIENTO INT)

BEGIN

       DECLARE AGNO_ACTUAL INT DEFAULT 2024;

       DECLARE EDAD INT;

       SET EDAD=AGNO_ACTUAL-AGNO_NACIMIENTO;

SELECT EDAD;

END;
```

En este caso tenemos que poner obligatoriamente el “;” al final del bloque de código, después del END, o en su caso, podemos usar un delimitador con la palabra reservada DELIMITER y estableciendo el símbolo delimitador, que por convención suelen ser “//” o “$ $”. Sería así:

``` sql
DELIMITER $$

CREATE PROCEDURE CALCULA_EDAD (AGNO_NACIMIENTO INT)

BEGIN

       DECLARE AGNO_ACTUAL INT DEFAULT 2024;

       DECLARE EDAD INT;

       SET EDAD=AGNO_ACTUAL-AGNO_NACIMIENTO;

SELECT EDAD;

END;$$

DELIMITER;
```

Y cerrar el DELIMITER al final del código.

Creamos un trigger que compruebe si el nuevo precio establecido es menor que 0 o mayor que 1000, en cuyo caso, establezca el valor en 0 o en 1000;

``` sql
DELIMITER $$

CREATE TRIGGER COMPRUEBA_PRECIO_BU BEFORE UPDATE ON PRODUCTOS FOR EACH ROW

BEGIN

       IF (NEW.PRECIO<0) THEN

               SET NEW.PRECIO=0;

       ELSEIF (NEW.PRECIO>1000) THEN

               SET NEW.PRECIO=1000;

       END IF;

END;$$

DELIMITER;
```

Entonces, una vez creado este trigger, ponemos en consola, por ejemplo:

``` sql
UPDATE PRODUCTOS SET PRECIO=1800 WHERE CÓDIGOARTÍCULO=’AR03’;
```

Entonces, el trigger establecerá el precio en 1000.