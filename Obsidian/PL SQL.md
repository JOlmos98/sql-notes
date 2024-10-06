
Esto son apuntes del [curso de PL SQL de INFORMATICONFIG en Youtube](https://www.youtube.com/watch?v=l6wOghW_gNI&list=PL2Z95CSZ1N4EO3wqFmTBNZXCovLpxkEqB&index=2&ab_channel=INFORMATICONFIG).
[[SQL]].
## 1. Sesiones

Hay 4 sesiones en PL/SQL:
- DECLARE
- BEGIN
- EXCEPTION
- END

En el recuadro de código se explica su función:
```sql
DECLARE
-- Sección declarativa.

BEGIN
--Sección ejectubale. (Obligatoria)

EXCEPTION 
--Manejo de excepciones.

END;
--Declara el final del programa. (Obligatoria)
```
## 2. Tipos de bloques

Existen tres tipos de bloques:
### Bloques anónimos:
No tienen nombre, se construyen de forma dinámica y se ejecutan una sola vez.
### Bloques con nombres:
Tienen nombre, se construyen de forma dinámica y se ejecutan una sola vez.
### Disparadores (Triggers):
Bloques con nombre que también se almacenan en la base de datos, se ejecutan varias veces.

## 3. Variables & Imprimir por consola

En el siguiente código de SQL Developer se ponen en uso la frase `set serveroutput on` en la primera línea, que se usa para permitir mostrar el resultado del código por consola, la frase `dbms_output.put_line` que tiene un uso similar al `System.out.println()` de Java y nos permite mostrar por consola la información de las variables y concatenarlas con Strings, como hacemos en dicho código (en Java se concatena con "+", en PL/SQL con "||").

En el código se repasan los tipos de variables principales y se ejemplifica su uso:

```sql
set serveroutput on

DECLARE
identificador INTEGER:=50;
nombre VARCHAR2(25):='Jesus Olmos';
apodo CHAR(10):='Yeezus';
sueldo NUMBER(5):=24000;
comision DECIMAL(4,2):=50.80;
--En DECIMAL el 4 significa que pueden haber 4 dígitos totales y 2 de decimal.
fecha_actual DATE:=(sysdate);
fecha DATE:=to_date('2023/04/08','yyyy/mm/dd');
saludo VARCHAR2(50) default 'Buenos días mi gente.';

BEGIN
dbms_output.put_line('El número identificador es: '||identificador);
dbms_output.put_line('El nombre de usuario es '||nombre);
dbms_output.put_line('El apodo es: '||apodo);
dbms_output.put_line('El sueldo anual del usuario es: '||sueldo);
dbms_output.put_line('La comisión es: '||comision);
dbms_output.put_line('La fecha actual es: '||fecha_actual);
dbms_output.put_line('La fecha ingresada es: '||fecha);
dbms_output.put_line(' ');
dbms_output.put_line(saludo);

END;
``` 
## 4. Constantes

En el siguiente código exponemos variables constantes, en la línea de comentario modificamos el contenido de una variable, si no fuese comentario y se ejecutase esa línea, el programa daría error al ejecutarlo, ya que la variable es constante y no se puede modificar, en ese caso tendríamos que borrar la línea en la que la modificamos o borrar la palabra `CONSTANT` en la declaración de `mensaje`.

```sql
set serveroutput on

DECLARE
mensaje CONSTANT VARCHAR2(30):='Buenos días people';
numero CONSTANT NUMBER(6):=30000;
BEGIN
--mensaje:='Adios people';
dbms_output.put_line(mensaje);
dbms_output.put_line(numero);
END;
```
## 5. IF-ELSE

En el siguiente código creamos un programa IF-ELSE que compara dos números y nos dice cuál es mayor y cuál menor que el otro.

```sql
set serveroutput on

DECLARE
a NUMBER(2):=30;
b NUMBER(2):=20;

BEGIN
IF a>b THEN
dbms_output.put_line(a||' es mayor que '||b);
ELSE 
dbms_output.put_line(b||' es mayor que '||a);
END IF;
END;
```

En el siguiente código mostramos el funcionamiento del `else if`, que en este caso se escribe como ELSIF omitiendo la segunda E.

```sql
set serveroutput on

DECLARE
a NUMBER(3):=22;

BEGIN
IF (a=10) THEN
dbms_output.put_line('El valor de la variable es 10.');
ELSIF (a=20) THEN
dbms_output.put_line('El valor de la variable es 20.');
ELSIF (a=30) THEN
dbms_output.put_line('El valor de la variable es 30.');
ELSE 
dbms_output.put_line('El valor de la variable es distinto de 10, 20 o 30.'); 
END IF;
dbms_output.put_line('El valor exacto de la variable es '||a);

END;
```
## 6. Bucles (LOOP & EXIT)

Hay una forma de hacer los bucles básicos muy rudimentaria en PL/SQL que es con la palabra reservada `LOOP`, en el siguiente código se expone su funcionamiento:

```sql
set serveroutput on

DECLARE
a NUMBER(3):=10;

BEGIN
    LOOP
        dbms_output.put_line(a);
        a:=a+10;
        IF a>50 THEN
	        EXIT;
        END IF;
    END LOOP;
    dbms_output.put_line('Valor final='||a);
END;
```

En este código sumamos 10 a la variable "a" cada vez que se recorre el bucle hasta que esta sea mayor de 50. Para ello introducimos un IF dentro del bucle. Cuando "a" sea mayor de 50, el IF termina y ejecuta la palabra reservada `EXIT`, saliendo así del IF, continuando con el código y terminando el IF y el LOOP e imprimiendo la sentencia final.

También podríamos sustituir las dos líneas de IF y EXIT por una línea que dijese lo siguiente:

`EXIT WHEN a>50;`
## 7. Strings (CLOB, SUBSTR & TRIM)

En este primer código se expone el funcionamiento de un String sencillo y el uso de CLOB y de las palabras reservadas UPPER y LOWER: 

```sql
set serveroutput on

DECLARE
    saludo VARCHAR2(30):='Buenas tardes, mi gente.';
    parrafo CLOB:='En principio CLOB se utiliza para poner una extensa cadena de caracteres.';
BEGIN
    dbms_output.put_line(saludo);
    dbms_output.put_line('Ahora imprimimos usando UPPER y después LOWER, y por último imprimimos el párrafo al natural.');
    dbms_output.put_line('');
    dbms_output.put_line(UPPER(saludo)); --Convierte a mayúsculas.
    dbms_output.put_line(LOWER(saludo)); --Convierte a minúsculas.
    dbms_output.put_line(parrafo);
END;
```

En este segundo código se expone el funcionamiento de INITCAP y los diversos funcionamientos de SUBSTR y por último el de la palabra reservada INSTR.

```sql
set serveroutput on

DECLARE
    saludo VARCHAR2(30):='Buenas tardes, mi gente.';
BEGIN
    dbms_output.put_line(INITCAP(saludo)); --Convierte en mayus la primera letra de cada palabra.
    
    dbms_output.put_line(SUBSTR(saludo, 1, 1)); --Nos devuelve la primera letra desde la primera letra.
    dbms_output.put_line(SUBSTR(saludo, 1, 5)); --Nos devuelve las 5 letras siguientes desde la primera letra.
    dbms_output.put_line(SUBSTR(saludo, 13, 10)); --Nos devuelve las 10 letras siguientes desde la letra 13.
    dbms_output.put_line(SUBSTR(saludo, 5)); --Nos devuelve todo el String a partir de la letra 5.
    
    dbms_output.put_line(INSTR(saludo, 'a')); --Nos devuelve la posición de la primera 'a'.
END;
```

En este último trozo de código se expone el funcionamiento de las variantes de TRIM:

```sql
set serveroutput on

DECLARE
    saludo VARCHAR2(40):='###Buenas tardes, mi gente.#####';
BEGIN
    dbms_output.put_line(RTRIM(saludo, '#')); --Elimina los '#' de la parte derecha del String.
    dbms_output.put_line(LTRIM(saludo, '#')); --Elimina los '#' de la parte izquierda del String.
    dbms_output.put_line(TRIM('#' FROM saludo)); --Elimina todos los '#' del String,
END;
```
## 8. WHILE

En el siguiente código se expone el funcionamiento de un bucle WHILE, en él indicamos que se ejecute el código interior del LOOP mientras que a<20 y cada vez que se ejecute el LOOP, se le suma 1 a "a".

```sql
set serveroutput on

DECLARE
    a NUMBER(2):=10;
BEGIN
    WHILE a<20 LOOP
        dbms_output.put_line('el valor es: '||a);
        a:=a+1;
    END LOOP;
END;
```

Con este otro bucle WHILE imprimimos la tabla de multiplicar del número 8:

```sql
set serveroutput on

DECLARE
    a NUMBER(2):=8;
    b NUMBER(2):=0;
    resultado NUMBER(2):=0;
BEGIN
    WHILE resultado<80 LOOP
        dbms_output.put_line(a||'x'||b||'='||resultado);
        b:=b+1;
        resultado:=a*b;
    END LOOP;
    dbms_output.put_line(a||'x'||b||'='||resultado);
END;
```


## 9. FOR

Este tipo de bucles son los más sencillos de escribir, en el siguiente código definimos una variable A con valor 0 y al establecer el bucle le asignamos un valor inicial de 10 y uno final de 20 a la variable. Al llegar a 20, el bucle finaliza. El bucle imprime los números 10 y 20 también.

```sql
set serveroutput on

DECLARE
    A NUMBER(2):=0;
BEGIN
    FOR A IN 10..20 LOOP
        dbms_output.put_line('Valor del número: '||A);
    END LOOP;
END;
```

En este caso usamos el bucle FOR IN REVERSE, el cual identifica al revés el tramo de números indicado, es decir, empieza por el 15 y termina en 0:
(Aquí no declaramos ninguna variable, no es necesario si sólo la usamos en el bucle).

```SQL
set serveroutput on

DECLARE

BEGIN
    FOR F IN REVERSE 0..15 LOOP
        dbms_output.put_line('Valor del número: '||F);
    END LOOP;
END;
```

Imprimimos la tabla de multiplicar del 6 de mayor a menor así:

```sql
set serveroutput on

DECLARE
    A NUMBER:=0;
BEGIN
    FOR A IN REVERSE 0..10 LOOP
        dbms_output.put_line('6x'||A||'='||6*A);
    END LOOP;
END;
```
## 10. Bucles anidados

En el siguiente código creamos un primer bucle con un segundo bucle en su interior, ese segundo aumentará un número del 1 al 5, después terminará y a su vez terminará el primer bucle aumentando en 1 la cantidad del número del bucle 1 y restableciendo el número del bucle 2 a 0, entonces se vuelve a repetir el bucle completo, es decir, el bucle 2 aumenta su número del 0 al 5 y el bucle 1 aumenta llegando esta vez al número 2, y así hasta llegar a 3 como especifica en la sentencia `EXIT WHEN B1=3;`.
```sql
set serveroutput on

DECLARE
    B1 NUMBER:=0;
    B2 NUMBER:=0;
BEGIN
    LOOP
        dbms_output.put_line('Inicio del bucle 1.');
        dbms_output.put_line('El valor de B1 es: '||B1);
            LOOP
            dbms_output.put_line('Inicio del bucle 2.');
            dbms_output.put_line('El valor de B2 es: '||B2);
            B2:=B2+1;
            EXIT WHEN B2=5;
            END LOOP;
        B1:=B1+1;
        B2:=0;
        dbms_output.put_line('----------');
        EXIT WHEN B1=3;
        END LOOP;
END;
```

Es decir, hay un bucle externo con una variable asignada (B1) y un bucle interno con otra variable asignada (B2), el programa termina cuando B1 llega a 3. Cada vez que se recorren ambos bucles, B2 va del 0 al 5 en el bucle interno y se resetea al final del bucle externo, por lo que, en definitiva, B2 llega tres veces de 0 a 5 y el B1 sencillamente llega del 0 al 3 aumentando en 1 cada vez que se ejecutan los dos bucles.
## 11. Arrays (.count & CHR(10))

En el siguiente código se expone el uso de un VARRAY, que sería algo equivalente a un ArrayList de Java. En él se declara un tipo de variable, y cada variable de ese tipo (paises) será un VARRAY de 5 elementos que a su vez esos elementos serán de tipo VARCHAR2(15). Después creamos la variable `nombre` de tipo `paises`, asignamos los valores a sus cinco elementos y los leemos con un bucle FOR.  

```SQL
set serveroutput on

DECLARE
    TYPE paises IS VARRAY(5) OF VARCHAR2(15);   
    nombre paises; --Creamos una variable de tipo "paises" (que es un varray de 5 elementos tipo varchar2 cada uno.
BEGIN
    nombre:=paises('España', 'Bolivia', 'Nigeria', 'Argentina', 'Venezuela');
    FOR i IN 1..5 LOOP
        dbms_output.put_line(i||'. '||nombre(i));
    END LOOP;
END;
```

En el siguiente código usamos el método `.count` para contar la cantidad de variables que almacena el array en cuestión y también usamos CHR(10) para añadir un salto de línea al imprimir por consola:

```sql
set serveroutput on

DECLARE
    TYPE matriz_nombres IS VARRAY(5) OF VARCHAR2(20);
    TYPE matriz_edad IS VARRAY(5) OF INTEGER;
    nombres matriz_nombres; 
    edades matriz_edad;
    total integer;
BEGIN
    edades:=matriz_edad(18, 34, 23, 45, 23);
    nombres:=matriz_nombres('Jesús', 'María', 'Nuria', 'Alejandro', 'Alberto');
    total:=nombres.count;
    FOR i IN 1..total LOOP
        dbms_output.put_line('Nombre: '||nombres(i)||CHR(10)||'Edad: '||edades(i)||CHR(10));
        END LOOP;
END; 
```

## 12. Procedimientos almacenados (stored procedure)

Un procedimiento almacenado almacena un bloque de código y lo automatiza, es como crear un método en Java, aquí creamos (o remplazamos en caso de que exista) el procedimiento "saludo" en el primer bloque de código y al llamarlo en el segundo bloque de código se imprime el String. 

```sql
set serveroutput on

CREATE OR REPLACE PROCEDURE saludo
AS
BEGIN
    dbms_output.put_line('El procedimiento almacenado que imprime esto.');
END saludo;
--Aquí termina el almacenado del procedimiento.
/
BEGIN
    saludo;
END;
/
```

También podemos ejecutar el procedimiento con la sentencia `EXECUTE saludo;`.

En el siguiente código creamos un procedimiento que aumenta el precio de nuestra tabla en un 1%.

```sql
set serveroutput on

CREATE OR REPLACE PROCEDURE aumentar_precio
AS
BEGIN
    UPDATE productos_curso SET precio=precio*1.01;
END aumentar_precio;
```

Para realizar una consulta y mostrar todos los procedimientos creados escribiríamos lo siguiente:

```sql
SELECT * FROM user_objects WHERE object_type='PROCEDURE';
```

Para eliminar procedimientos usamos DROP:

```sql
DROP PROCEDURE saludo;
```
## 13. Procedimientos almacenados con parámetros

Para este ejemplo vamos a crear unas tablas con el siguiente código:
```sql
 -- Borrar tabla empelados anterior
 drop table empleados;
 
 -- Crear nueva tabla empleados
 create table empleados(
  documento char(8),
  nombre varchar2(20),
  apellido varchar2(20),
  sueldo number(6,2),
  fechaingreso date
 );

 -- Ingreso de datos
 insert into empleados values('22222222','Juan','Perez',300,to_date('10/10/1980','dd/mm/yyyy'));
 insert into empleados values('22333333','Luis','Lopez',300,to_date('12/05/1998','dd/mm/yyyy'));
 insert into empleados values('22444444','Marta','Perez',500,to_date('25/08/1990','dd/mm/yyyy'));
 insert into empleados values('22555555','Susana','Garcia',400,to_date('05/05/2000','dd/mm/yyyy'));
 insert into empleados values('22666666','Jose Maria','Morales',400,to_date('24/10/2005','dd/mm/yyyy'));
```

Ahora creamos un procedimiento que aumente el sueldo a los empleados con una antigüedad de años que nosotros indicamos por parámetros y un porcentaje que nosotros indicamos:

```sql
CREATE OR REPLACE PROCEDURE aumentasueldo(anyo IN NUMBER, porcentaje IN NUMBER)
AS
BEGIN
    UPDATE empleados SET sueldo=sueldo+(sueldo*porcentaje/100)
    WHERE (EXTRACT(YEAR FROM current_date)-EXTRACT(YEAR FROM fechaingreso))>anyo;
END aumentasueldo;
/
EXECUTE aumentasueldo(10,20);
/
SELECT * FROM empleados;

--Todo funciona correctamente.
```

Como se observa, declaramos los dos parámetros de tipo NUMBER y escribimos las sentencias para sumar el porcentaje especificado al sueldo con el filtro de que la antigüedad sea mayor al año que introducimos por parámetro.

En el siguiente código creamos un procedimiento (como un método en Java) que inserta un empleado en la tabla `empleados` recibiendo como argumento (documento, nombre, apellido) y dejando en `null` el sueldo y la fecha de ingreso:

```sql
CREATE OR REPLACE PROCEDURE ingresarempleado(docu IN CHAR, nom IN VARCHAR2, ape IN VARCHAR2)
AS
BEGIN
    INSERT INTO empleados VALUES (docu, nom, ape, null, null);
END ingresarempleado;
/
--EXECUTE ingresarempleado ('38473628', 'Jesús', 'Olmos');
/
SELECT * FROM empleados;
/
DROP PROCEDURE ingresarempleado;
```

La línea que está comentada ingresaría un empleado. La última línea borra el procedimiento.
## 14. Procedimientos almacenados con variables

Primero metemos estas dos tablas para la demostración:

```sql
CREATE TABLE tabla1 (titulo VARCHAR2(40), precio NUMBER(6,2));

CREATE TABLE libros (
    idlibro NUMBER(1),
    titulo VARCHAR2(30),
    autor VARCHAR2(30),
    precio NUMBER(6, 2)
    );
    
INSERT INTO libros (idlibro, titulo, autor, precio) VALUES (1, 'El Quijote', 'Miguel de Cervantes', 459.05);
INSERT INTO libros (idlibro, titulo, autor, precio) VALUES (2, 'Cien Años de Soledad', 'Gabriel G. Márquez', 550.85);
INSERT INTO libros (idlibro, titulo, autor, precio) VALUES (3, 'El Alquimista', 'Paulo Coelho', 642.66);
```

A continuación creamos un procedimiento almacenado para que, usando una variable del propio procedimiento (var_autor) donde insertaremos un valor, insertaremos a su vez de una tabla a otra ciertos valores cogiendo como referencia los valores donde coincidan el parámetro "atitulo" que hemos introducido.

```sql
CREATE OR REPLACE PROCEDURE autorlibro(atitulo IN VARCHAR2)
AS
var_autor VARCHAR2(20);
BEGIN
    SELECT autor INTO var_autor FROM libros WHERE titulo=atitulo;
    INSERT INTO tabla1
    SELECT titulo, precio FROM libros WHERE autor=var_autor;
END autorlibro;
/
EXECUTE autorlibro('El Quijote');
/
SELECT * FROM tabla1;
SELECT * FROM libros;
```

Después de ejecutar el código, el programa cogerá el autor del libro "El Quijote" que hemos introducido por parámetro, almacenará el autor en la *var_autor*, y después tomando como referencia *var_autor* leerá el registro donde aparezca dicho autor y exportará a la tabla1 los datos adecuados, en este caso el título y el precio.

## 15. Funciones (métodos)

En el siguiente código creamos una función que multiplica por dos el número que introduzcamos por parámetro, después hacemos la consulta adecuada para que nos devuelva la solución en forma de tabla:

```sql
CREATE OR REPLACE FUNCTION f_pordos(valor NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN valor*2;
END;
/
--EXECUTE pordos(4);
SELECT f_pordos(4) AS total FROM dual;
```

La línea comentada estaría mal, así se ejecutan los procedimientos, pero no las funciones.
Ahora escribimos una función que nos dice si un libro (de la tabla anteriormente usada LIBROS) es caro o barato en función de si su precio está o no por encima de 500:

(Esta función nos devuelve un VARCHAR2, la primera nos devolvía un NUMBER).
```sql
CREATE OR REPLACE FUNCTION f_costo(valor NUMBER)
RETURN VARCHAR2
IS
    costo VARCHAR2(20);
BEGIN
    costo:='';
    IF valor<=500 THEN
    costo:='Económico';
    ELSE costo:='Costoso';
    END IF;
    RETURN costo;
END;
/
SELECT titulo, autor, precio, f_costo(precio) FROM libros;
```
## 16. CASE

Ahora repasamos las funciones pero usando esta vez, en vez de un IF, un CASE:

```sql
CREATE OR REPLACE FUNCTION f_diasemana(numero NUMBER)
RETURN VARCHAR2
IS
    dia VARCHAR2(20);
BEGIN
    dia:='';
    CASE numero
    WHEN 1 THEN dia:='Lunes';
    WHEN 2 THEN dia:='Martes';
    WHEN 3 THEN dia:='Miércoles';
    WHEN 4 THEN dia:='Jueves';
    WHEN 5 THEN dia:='Viernes';
    WHEN 6 THEN dia:='Sábado';
    WHEN 7 THEN dia:='Domingo';
    ELSE dia:='Número NO válido';
    END CASE;
    RETURN dia;
END;
/
SELECT f_diasemana(3) AS DIA FROM DUAL;
```

Ahora creamos un programa en el que le metemos un VARCHAR2 como parámetro indicando un mes y nos dice a que trimestre corresponde:

```sql
CREATE OR REPLACE FUNCTION f_trimestre(mes VARCHAR2)
RETURN VARCHAR2
IS
    trimestre VARCHAR2(30);
BEGIN
    trimestre:='';
    CASE mes
    WHEN 'enero' THEN trimestre:='Primer trimestre';
    WHEN 'febrero' THEN trimestre:='Primer trimestre';
    WHEN 'marzo' THEN trimestre:='Primer trimestre';
    WHEN 'abril' THEN trimestre:='Segundo trimestre';
    WHEN 'mayo' THEN trimestre:='Segundo trimestre';
    WHEN 'junio' THEN trimestre:='Segundo trimestre';
    WHEN 'julio' THEN trimestre:='Tercer trimestre';
    WHEN 'agosto' THEN trimestre:='Tercer trimestre';
    WHEN 'septiembre' THEN trimestre:='Tercer trimestre';
    WHEN 'octubre' THEN trimestre:='Cuarto trimestre';
    WHEN 'noviembre' THEN trimestre:='Cuarto trimestre';
    WHEN 'diciembre' THEN trimestre:='Cuarto trimestre';
    ELSE trimestre:='Nombre de mes NO válido.';
    END CASE;
    RETURN trimestre;
END;
/
SELECT f_trimestre('septiembre') AS TRIMESTRE_ACTUAL FROM DUAL;
```
## 17. TRIGGERS

Primero, para el ejemplo, creamos las tablas `libros` y `control`:

```sql
DROP TABLE libros;
DROP TABLE control;

CREATE TABLE libros(
    codigo NUMBER(6),
    titulo VARCHAR2(40),
    autor VARCHAR2(30),
    editorial VARCHAR2(20),
    precio NUMBER(6,2)
    );
    
CREATE TABLE control(
    usuario VARCHAR2(30),
    fecha DATE
    );
```

Ahora creamos un trigger que se ejecute automáticamente antes (before) de insertar un nuevo registro en la tabla `libros` y que guarde el usuario que ha introducido el registro y la fecha y hora en la tabla `control`:

```sql
CREATE OR REPLACE TRIGGER tr_ingresolibros
BEFORE INSERT ON libros
BEGIN
    INSERT INTO control VALUES (user, sysdate);
    END tr_ingresolibros;
/
--Insertamos registros en la tabla libros para ver que funciona.
INSERT INTO libros VALUES(100,'Uno', 'Richard Bach','Planeta',25);
INSERT INTO libros VALUES(102,'Matemática Estás Ahí', 'Paenza','Nuevo Siglo',12);
/
--Vemos que funciona porque se han insertado, a su vez, otro dos registros en la tabla control.
SELECT * FROM control;
--Para hacer una consulta del trigger y ver su información:
SELECT * FROM USER_TRIGGERS WHERE TRIGGER_NAME='TR_INGRESOLIBROS';
--Recuerda que SQL no es case sensitive.
```

## 18. TRIGGERS FOR EACH ROW

Para este ejemplo creamos la tabla empleados:

```SQL
DROP TABLE empleados;

CREATE TABLE empleados(
  documento CHAR(8),
  apellido VARCHAR2(30),
  nombre VARCHAR2(30),
  seccion VARCHAR2(20)
 );

TRUNCATE TABLE control;
```

Con la última sentencia limpiamos los registros de la tabla `control`.

```sql
CREATE OR REPLACE TRIGGER ingresaempleados
BEFORE INSERT ON empleados FOR EACH ROW
BEGIN
    INSERT INTO control VALUES(user, sysdate);
END ingresaempleados;
/
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria');
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria');
 insert into empleados values('22999000','FUENTES','Federico','Sistemas');
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria');
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas');
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria');
/
 SELECT * FROM control;
```

La diferencia entre el primer trigger que hicimos y este (FOR EACH ROW) radica en que si en una sola ejecución insertamos 3 registros, sólo se guardaría un registro de control en el primer trigger, pero en este segundo caso, usando FOR EACH ROW se guarda un registro por cada fila insertada.

## 19. TRIGGERS BEFORE DELETE

Antes de nada limpiamos la tabla `control` y creamos la tabla `alumnos` con sus valores:

```sql
TRUNCATE TABLE control;
DROP TABLE alumnos;
/
CREATE TABLE alumnos(
legajo varchar2(4) not null,
documento varchar2(8) not null,
nombre varchar2(30) not null,
curso number(1) not null,
materia varchar2(15) not null,
nota_final number(3,2) not null);

insert into alumnos values('A234','23333333','LOPEZ ANA',5,'MATEMATICA',9);
insert into alumnos values('A345','24444444','GARCIA CARLOS',6,'MATEMATICA',8.5);
insert into alumnos values('A457','26666666','PEREZ FABIAN',6,'LENGUA',3.2);
insert into alumnos values('A348','25555555','PEREZ PATRICIA',6,'LENGUA',7.85);
insert into alumnos values('A123','22222222','PEREZ PATRICIA',5,'MATEMATICAS',9);
insert into alumnos values('A124','32222222','GONZALES JOSE',5,'BIOLOGIA',9);
insert into alumnos values('A124','32222222','GONZALES JOSE',5,'MATEMATICAS',8);
```

Ahora creamos un disparador que registre cuando se borra un alumno usando BEFORE DELETE:

```sql
CREATE OR REPLACE TRIGGER borradoalumnos
BEFORE DELETE ON alumnos FOR EACH ROW
BEGIN
    INSERT INTO control VALUES(user, sysdate);
END borradoalumnos;
/
SELECT * FROM alumnos;
/
DELETE alumnos WHERE curso=5;
/
SELECT * FROM control;
```

Vemos con la última sentencia como usando BEFORE DELETE, guarda el registro después de borrar el otro registro de la tabla `alumnos`, podríamos cambiar el trigger y en vez de guardar sólo el nombre del usuario que ha borrado el registro y la fecha, que también añada campos a la tabla control como el nombre del alumno, el documento del alumno, etc, pero para eso también debería tener esos campos de antes la tabla `control` y sería una tabla específica para la tabla `alumnos`.
## 20. TRIGGERS BEFORE UPDATE

Este trigger funciona exactamente igual que BEFORE DELETE, pero en vez de cuando se elimina, cuando se actualiza un registro, bastante fácil de entender. Ingresamos las tablas y datos para el ejemplo:

```sql
-- Creacion tabla empleados
DROP TABLE empleados;
create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
-- Creacion tala control
DROP TABLE control;
create table control(
  usuario varchar2(30),
  fecha date
 );

-- Ingreso de datos
 insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
```

En el siguiente código actualizamos el documento cambiándolo a '88888888' donde el apellido='JUAREZ'; y se crea un registro en la tabla ``control``:

```sql
CREATE OR REPLACE TRIGGER actualizacionempleado
BEFORE UPDATE ON empleados FOR EACH ROW
BEGIN
    INSERT INTO control VALUES (user, sysdate);
END actualizacionempleado;
/
SELECT * FROM empleados;
/
UPDATE empleados SET documento='88888888' WHERE apellido='JUAREZ';
/
SELECT * FROM empleados;
SELECT * FROM control;
```

## 21. TRIGGERS múltiples eventos

Creamos las tablas para el ejemplo:

```sql
CREATE TABLE control_empleados(
	usuario VARCHAR2(20),
	fecha DATE,
	accion VARCHAR2(20)
	);
```

Ahora creamos el TRIGGER que contemple la eliminación, actualización o ingreso en la tabla `empleados` utilizada en ejemplos anteriores. Para ello usamos IF-ELSE en el TRIGGER. Después manipulamos la tabla `empleados` de las tres formas para comprobar el funcionamiento del TRIGGER:

```sql
CREATE OR REPLACE TRIGGER tr_control_empleados
BEFORE INSERT OR UPDATE OR DELETE ON empleados FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO control_empleados VALUES(user, sysdate, 'Ingreso');
    ELSIF DELETING THEN
        INSERT INTO control_empleados VALUES(user, sysdate, 'Eliminado');
    ELSIF UPDATING THEN
        INSERT INTO control_empleados VALUES(user, sysdate, 'Actualización');
    ELSE
        INSERT INTO control_empleados VALUES(user, sysdate, 'Otro');
    END IF;
END tr_control_empleados;
/
SELECT * FROM empleados;
/
UPDATE empleados SET sueldo=501 WHERE apellido='ACOSTA';
INSERT INTO empleados VALUES ('32454567', 'OLMOS', 'JESUS', 'Sistemas', 900);
DELETE empleados WHERE apellido='GOMEZ';
/
SELECT * FROM control_empleados;
```
## 22. TRIGGERS :NEW :OLD

Creamos las tablas para el ejemplo:

```sql
drop table libros;
drop table ofertas;

 create table libros(
  codigo number(6),
  titulo varchar2(40),
  autor varchar2(30),
  editorial varchar(20),
  precio number(6,2)
 );
 create table ofertas(
  codigo number(6),
  precio number(6,2),
  usuario varchar2(20),
  fecha date
 );
 insert into libros values(100,'Uno','Richard Bach','Planeta',25);
 insert into libros values(103,'El aleph','Borges','Emece',28);
 insert into libros values(105,'Matematica estas ahi','Paenza','Nuevo siglo',12);
 insert into libros values(120,'Aprenda PHP','Molina Mario','Nuevo siglo',55);
 insert into libros values(145,'Alicia en el pais de las maravillas','Carroll','Planeta',35);
```

Ahora creamos un TRIGGER que al insertar un nuevo libro en `libros`, si el precio es menor o igual a 30, cree un registro en la tabla `ofertas` con los datos de la tabla especificados anteriormente:

```sql
CREATE OR REPLACE TRIGGER tr_ingresalibros
BEFORE INSERT ON libros FOR EACH ROW
BEGIN
    IF(:NEW.precio<=30) THEN
        INSERT INTO ofertas VALUES(:NEW.codigo, :NEW.precio, user, sysdate);
    END IF;
END tr_ingresalibros;
/
SELECT * FROM libros;
/
INSERT INTO libros VALUES (150, 'Fundación', 'Isaac Asimov', 'Debolsillo', 29);
/
SELECT * FROM ofertas;
```

Esta vez haremos un TRIGGER que valore el precio antiguo y el nuevo y elimine o inserte los libros en la tabla ofertas en función de la actualización del precio:

```sql
CREATE OR REPLACE TRIGGER tr_actualizalibros
BEFORE UPDATE OF precio ON libros FOR EACH ROW
BEGIN
    IF(:OLD.precio<=30) AND (:new.precio>30) THEN
    DELETE FROM ofertas WHERE codigo=:OLD.codigo;
    ELSIF (:OLD.precio>30) AND (:NEW.precio<=30) THEN
    INSERT INTO ofertas VALUES(:NEW.codigo, :new.precio, user, sysdate);
    END IF;
END tr_actualizalibros;
/
SELECT * FROM libros;
/
UPDATE libros SET precio=28 WHERE codigo=120;
/
SELECT * FROM ofertas;
```

## 23. TRIGGERS WHEN/IF

Creamos las tablas para este ejemplo:

```sql
drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(20),
  nombre varchar2(20),
  seccion varchar2(30),
  sueldo number(8,2)
 );
   drop table control;
 create table control(
  usuario varchar2(30),
  fecha date,
  documento char(8),
  antiguosueldo number(8,2),
  nuevosueldo number(8,2)
 ); 
  insert into empleados values('22333444','ACOSTA','Ana','Secretaria',500);
 insert into empleados values('22555666','CASEROS','Carlos','Contaduria',900);
 insert into empleados values('22777888','DOMINGUEZ','Daniel','Secretaria',560);
 insert into empleados values('22999000','FUENTES','Federico','Sistemas',680);
 insert into empleados values('23444555','GOMEZ','Gabriela','Sistemas',1200);
 insert into empleados values('23666777','JUAREZ','Juan','Contaduria',1000);
```

Creamos un TRIGGER que al actualizar la tabla empleados aumentando el sueldo, cuando (WHEN) el nuevo sueldo sea mayor al antiguo, inserte un registro en `control` con ambos sueldos como campos:

```sql
CREATE OR REPLACE TRIGGER tr_aumentasueldo
BEFORE UPDATE OF sueldo ON empleados FOR EACH ROW
WHEN (NEW.sueldo>OLD.sueldo)
BEGIN
    INSERT INTO control VALUES(user, sysdate, :OLD.documento, :OLD.sueldo, :NEW.sueldo);
END tr_aumentasueldo;
/
SELECT * FROM empleados;
/
UPDATE empleados SET sueldo=sueldo*1.05;
/
SELECT * FROM control;
```

En este último código subimos el sueldo a los seis empleados un 5%, entonces se crean seis registros en la tabla `control`, uno por cada sueldo actualizado, y en la tabla se nos muestra el sueldo antiguo y el nuevo.

Ahora creamos un TRIGGER que al introducir un nuevo empleado, el apellido lo pone automáticamente en mayúsculas y si el sueldo es NULL lo establece en 0 automáticamente.

```sql
CREATE OR REPLACE TRIGGER tr_actualizadatos
BEFORE INSERT ON EMPLEADOS FOR EACH ROW
BEGIN
    :NEW.apellido :=UPPER(:NEW.apellido);
    IF :NEW.sueldo IS NULL THEN
        :NEW.sueldo:=0;
    END IF;
END tr_actualizadatos;
/
SELECT * FROM empleados;
/
INSERT INTO empleados VALUES ('12345678', 'olmos', 'Jesús','Sistemas', null);
/
SELECT * FROM empleados;
```

Observamos como poniendo el apellido en minúsculas y `null` en sueldo, cuando consultamos la tabla el apellido está en mayúsculas y el sueldo en 0.

## 24. TRIGGERS ENABLE/DISABLE

Para desactivar un TRIGGER primer vamos a ver en la tabla de nuestros triggers los que hay y si están activados o no con la siguiente consulta:

```sql
SELECT TRIGGER_NAME, STATUS FROM USER_TRIGGERS;
```

Ahí vemos si están enabled o disabled, en caso de que queramos desactivar uno que está enabled pondríamos la siguiente sentencia:

```sql
ALTER TRIGGER TR_AUMENTASUELDO DISABLE;
```

Y al volver a consultar la tabla anterior veríamos que el status ha cambiado y el trigger no estaría funcionando. De igual manera si ponemos la misma sentencia usando ALTER TRIGGER pero esta vez ponemos ENABLE, volverá a cambiar el status a enabled.
## 25. TRIGGERS RAISE_APPLICATION_ERROR

Creamos las tablas para el ejemplo:

```sql
drop table empleados;
drop table control;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );

 create table control(
  usuario varchar2(30),
  fecha date,
  operacion varchar2(30)
 );

 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contaduria',3000);
```

Ahora creamos un TRIGGER que valore las inserciones, eliminaciones y actualizaciones y restrinja si establecemos un sueldo superior a 5000 dólares, si manipulamos o eliminamos un empleado con sección 'Gerencia' y si actualizamos un documento, si ocurre una de esas tres situaciones el programa arrojará un error:

```sql
CREATE OR REPLACE TRIGGER tr_control_empleados
BEFORE INSERT OR UPDATE OR DELETE ON EMPLEADOS FOR EACH ROW
BEGIN
    IF(:NEW.sueldo>5000)THEN
        RAISE_APPLICATION_ERROR(-20000, 'EL SUELDO NO PUEDE SUPERAR LOS $5000');
    END IF;
    INSERT INTO control VALUES (USER, SYSDATE, 'INSERCION');
    IF (:OLD.seccion='Gerencia')THEN
        RAISE_APPLICATION_ERROR(-20000, 'NO SE PUEDE ELEIMINAR PUESTO DE GERENCIA');
    END IF;
    INSERT INTO control VALUES(USER, SYSDATE, 'BORRADO');
    IF UPDATING('documento')THEN
        RAISE_APPLICATION_ERROR(-20000,'NO SE PUEDE ACTUALIZAR NUMERO DE DOCUMENTOS');
    END IF;
END tr_control_empleados;
/
SELECT * FROM empleados;
/
UPDATE empleados SET sueldo=5001 WHERE nombre='Ana';
```

Al ejecutar la última línea, como asignamos un salario superior a 5000, el programa arroja un error con nuestro mensaje. El número -20000 identificará el ORA que aparecerá en el error, pondrá algo como `ORA-20000: EL SUELDO NO PUEDE SUPERAR LOS $5000`.
## 26 Cursores

Atributos básicos:
- %ISOPEN: Devuelve "true" si el cursor está abierto.
- %FOUND: Devuelve "true" si el registro fue procesado con éxito.
- %NOTFOUND: Devuelve "true" si el registro no pudo ser procesado. normalmente ocurre cuando ya se han procesado todos los registros devueltos por el cursor.
- %ROWCOUNT: Devuelve el número de registros que han sido procesados hasta ese momento.

Creamos las tablas para el ejemplo:

```sql
 drop table empleados;

 create table empleados(
  documento char(8),
  apellido varchar2(30),
  nombre varchar2(30),
  domicilio varchar2(30),
  seccion varchar2(20),
  sueldo number(8,2)
 );
 insert into empleados values('22222222','Acosta','Ana','Avellaneda 11','Secretaria',1800);
 insert into empleados values('23333333','Bustos','Betina','Bulnes 22','Gerencia',5000);
 insert into empleados values('24444444','Caseres','Carlos','Colon 333','Contabilidad',3000);
 insert into empleados values('32323255','Gonzales','Miguel','Calle 4ta No.90','Contabilidad',8000);
 insert into empleados values('56565555','Suarez','Tomas','Atarazana 78','Cobros',1500);
```

Creamos un cursor que actualice el sueldo de los empleados cuyo sueldo es mayor a 9000 sumándole 500 más, si no hay ninguno, es decir %NOTFOUND=true, imprime `==NO HAY EMPLEADOS DISPONIBLES==`, si %FOUND=true, imprime el número de empleados actualizados:

```sql
SELECT * FROM EMPLEADOS;
/
DECLARE
    FILAS NUMBER(2);
BEGIN
    UPDATE EMPLEADOS SET SUELDO=SUELDO+500 WHERE SUELDO>=9000;
    IF SQL%NOTFOUND THEN
    dbms_output.put_line('==NO HAY EMPLEADOS DISPONIBLES==');
    ELSIF SQL%FOUND THEN
    FILAS:=SQL%ROWCOUNT;
    dbms_output.put_line(FILAS||':EMPLEADOS ACTUALIZADOS');
    END IF;
END;
```

Si ponemos 9000 nos devolverá `==NO HAY EMPLEADOS DISPONIBLES==`, pero si cambiamos ese valor a 3000 nos devolverá la otra opción, es decir, `3: EMPLEADOS ACTUALIZADOS`.

## 27. Cursores explícitos & %TYPE

%TYPE: Cuando se usa %TYPE para declarar una variable estamos indicando que tiene el mismo tipo de dato que la variable especificada. Normalmente se relaciona con una columna de la BD indicando el nombre de la tabla de base de datos y el nombre de la columna. Una ventaja del uso de este atributo, es que si cambia la definición de una columna de la BD, no será necesario cambiar la declaración de la variable.

Ahora con la tabla del último ejemplo creamos un cursor que use las variables que vamos a declarar, realice una consulta e imprima por consola lo especificado en el código:

```sql
set serveroutput on;

SELECT * FROM EMPLEADOS;
/
DECLARE
    V_DOCU EMPLEADOS.DOCUMENTO%TYPE;
    V_NOM EMPLEADOS.NOMBRE%TYPE;
    V_APE EMPLEADOS.APELLIDO%TYPE;
    V_SUEL EMPLEADOS.SUELDO%TYPE;
    
    CURSOR C_CURSOR2 IS
        SELECT DOCUMENTO, NOMBRE, APELLIDO, SUELDO FROM EMPLEADOS WHERE DOCUMENTO='22222222';
BEGIN
    OPEN C_CURSOR2;
    FETCH C_CURSOR2 INTO V_DOCU, V_NOM, V_APE, V_SUEL;
    CLOSE C_CURSOR2;
    DBMS_OUTPUT.PUT_LINE('Documento: '||V_DOCU);
    DBMS_OUTPUT.PUT_LINE('Nombre: '||V_NOM);
    DBMS_OUTPUT.PUT_LINE('Apellido: '||V_APE);
    DBMS_OUTPUT.PUT_LINE('Sueldo: '||V_SUEL);
END;
```

Es decir, de la consulta que hay en el código, se cogen esos valores y se guardan en el cursor, es decir, en las variables anteriormente declaradas, después se exponen con las palabras reservadas OPEN, FETCH y CLOSE y se imprimen las líneas posteriores.

Es decir, las palabras reservadas mencionadas funcionan así:
- OPEN: Abre el cursor para poder usarlo.
- FETCH: Extrae las variables y junto a INTO las almacena en las variables declaradas.
- CLOSE: Cierra el cursor.

La utilidad de los cursores se aprecia mejor a la hora de conectar aplicaciones a bases de datos Oracle.

## 28. Cursores explícitos SELECT & UPDATE

%ROWTYPE: En el siguiente código, al usarla significará que la variable `V_EMPLEADOS` va a contener todos los tipos de variable de la tabla `EMPLEADOS`.

```SQL
set serveroutput on;

SELECT * FROM EMPLEADOS;
/
DECLARE
    V_EMPLEADOS EMPLEADOS%ROWTYPE;
BEGIN
    FOR V_EMPLEADOS IN (SELECT * FROM EMPLEADOS) LOOP
    DBMS_OUTPUT.PUT_LINE(V_EMPLEADOS.NOMBRE||' - '||V_EMPLEADOS.SUELDO);
    END LOOP;
END;
```

Y así, usando sólo una variable podemos imprimir todos los datos de la tabla a través de ella, porque va asignándose automáticamente el tipo de dato que necesita de la tabla.

En el siguiente caso usamos un cursor para actualizar la tabla empleados estableciendo el sueldo según el documento, si el documento coincide, el sueldo se actualizará, si no, imprimirá `NO EXISTE REGISTRO PARA MODIFICAR`.

```sql
set serveroutput on;

SELECT * FROM EMPLEADOS;
/
DECLARE
    
BEGIN
    UPDATE EMPLEADOS SET SUELDO=5001 WHERE DOCUMENTO='00000000';
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EXISTE REGISTRO PARA MODIFICAR');
    END IF;
END;
```

## 29. Cursores con parámetros

Creamos las tablas para el ejemplo:

```sql
drop table productos;

create table productos(
id_producto int not null,
nombre_producto VARCHAR2(25),
precio NUMBER(6,2),
descripcion VARCHAR2(50));

insert into productos values(1,'Abrazadera',560,'Abrazadera de media pulgada');
insert into productos values(2,'Destornillador',120,'destornillador cabeza plana');
insert into productos values(3,'Martillo',300,'Martillo con ganzua'); 
insert into productos values(4,'Llave inglesa',200,'Llave inglesa de plomeria');
insert into productos values(5,'Pasadores RTR',935,'Tuerca exagonal de Almenada');
insert into productos values(6,'Tornillo exagonal',90,'Tornillo exagonal de baja o tuerca');
```

En el siguiente código usamos %TYPE para asignar automáticamente el tipo de variable a V_NOM y V_PRE de la variable que representan. declaramos un cursor con un parámetro que hará la función del ID_PRODUCTO como señalamos en la siguiente consulta. En el BEGIN abrimos el cursor y le insertamos el parámetro determinado que pueden ser los distintos IDs de los productos, en este caso 2, y con un LOOP y la palabra reservada FETCH insertamos los valores que el cursor ha extraído de la consulta según el id introducido como parámetro en las variables anteriormente declaradas V_NOM y V_PRE y creamos una línea que salga del LOOP cuando no encuentre más productos con el ID especificado, es decir, con el ID 2. Después en la última línea imprime la información indicada y por último, fuera del LOOP, se cierra el cursor. Es decir, si hubiese más de un producto con el ID 2, se imprimirían más de una línea, pero no es el caso, así que sólo se imprimirá una línea de información sobre un producto.

```SQL
set serveroutput on;

DECLARE
    V_NOM PRODUCTOS.NOMBRE_PRODUCTO%TYPE;
    V_PRE PRODUCTOS.PRECIO%TYPE;
    
    CURSOR C_PRODUCTOS (IDPROD PRODUCTOS.ID_PRODUCTO%TYPE)
    IS SELECT NOMBRE_PRODUCTO, PRECIO FROM PRODUCTOS WHERE ID_PRODUCTO=IDPROD;
BEGIN
    OPEN C_PRODUCTOS(2);
    LOOP
        FETCH C_PRODUCTOS INTO V_NOM, V_PRE;
        EXIT WHEN C_PRODUCTOS%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Articulo: '||V_NOM||', precio: '||V_PRE);
    END LOOP;
    CLOSE C_PRODUCTOS;
END;
```
## 30 Cursores REF_CURSORS

==Explicar el código:

```sql
set serveroutput on;

SELECT * FROM EMPLEADOS;
/
CREATE OR REPLACE FUNCTION F_DATOEMPLEADOS(V_DOCUMENTO IN NUMBER)
RETURN SYS_REFCURSOR 
IS
    V_REF SYS_REFCURSOR;
BEGIN
    OPEN V_REF FOR SELECT * FROM EMPLEADOS WHERE DOCUMENTO=V_DOCUMENTO;
    RETURN V_REF;
END;
/
SELECT F_DATOEMPLEADOS(23333333) FROM DUAL;
```

## 
## 
## 
## 
