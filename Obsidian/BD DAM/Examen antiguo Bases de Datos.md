
## APUNTES

Los cursores implícitos se usan en una frase como `SELECT COUNT(*) INTO V_VARIABLE FROM EMPLEADOS WHERE SUELDO=1500;`. Con los cursores explícitos hay que declarar una variable, declarar el cursor, guardar una consulta en el cursor (en DECLARE) y en BEGIN abrir el cursor, extraer la información del cursor y meterla en las variables declaradas y cerrar el cursor.

- En los triggers hay BEFORE y FOR EACH ROW pero no IS o AS (declare o sin declare).
- En las funciones hay IS y RETURN (y no hay declare). Se usan con DUAL.
- En los procedimientos se usa AS (sin declare), EXECUTE y se declara las variables con IN y OUT.
- No se pone =null o !=null, se usa el IS NULL y IS NOT NULL.
- LENGTH(:NEW.CLAVE)<9 THEN tal.

#### Cursor implícito
Un cursor implícito es cuando sencillamente se usa la sentencia `SELECT COUNT(*) INTO V_VALOR WHERE IDFAMILIA=FAM;`, en este caso almacenamos directamente en la variable V_VALOR el número extraído de la consulta, que señala la cantidad de familias que existen con el ID pasado por parámetro como FAM.

#### Cursor explícito

Un cursor explícito requiere más código, abrirlo, cerrarlo, etc, esto sería un cursor explícito:
```sql
DECLARE
	V_DOC EMPLEADOS.DOCUMENTO%TYPE;
	V_NOM EMPLEADOS.NOMBRE%TYPE;
	V_APE EMPLEADOS.APELLIDO%TYPE;
	V_SUEL EMPLEADOS.SUELDO%TYPE;
	
	CURSOR C_CURSOR1 IS
	SELECT DOCUMENTO, NOMBRE, APELLIDO, SUELDO FROM EMPLEADOS WHERE DOCUMENTO='88888888';
BEGIN
	OPEN C_CURSOR1;
	FETCH C_CURSOR1 INTO V_DOC, V_NOM, V_APE, V_SUEL;
	CLOSE C_CURSOR1;
	
	DBMS_OUTPUT.PUT_LINE('EL DOCUMENTO ES '||V_DOC);
	DBMS_OUTPUT.PUT_LINE('EL NOMBRE ES '||V_NOM);
	DBMS_OUTPUT.PUT_LINE('EL APELLIDO ES '||V_APE);
	DBMS_OUTPUT.PUT_LINE('EL SUELDO ES '||V_SUEL);
```

#### Función

Una función se caracteriza principalmente por tener un RETURN. Así se escribe una función:

```sql
CREATE OR REPLACE FUNCTION multiplicarx2(valor NUMBER)
RETURN NUMBER
IS
BEGIN
	RETURN VALOR*2;
END;
```

Se usa así:
```sql
SELECT multiplicarx2(5) AS TOTAL FROM DUAL:
```
Y nos muestra el registro 10 en la tabla DUAL.
#### Triggers

Los disparadores ejecutan una acción cuando se inserta, actualiza o elimina un registro de una tabla, lo importante es el manejo de :NEW y :OLD a la hora de insertar los registros en la tabla en la que mostramos la información de las actualizaciones, inserciones o eliminaciones, por ejemplo:

```sql
CREATE OR REPLACE TRIGGER TR_MOD_AGENTES
BEFORE INSERT OR UPDATE OR DELETE ON AGENTES FOR EACH ROW
BEGIN
    IF INSERTING OR UPDATING THEN
        IF :NEW.CATEGORIA<-100 OR :NEW.CATEGORIA>100 THEN
            RAISE_APPLICATION_ERROR('ERROR AL ASIGNAR CATEGORIA.');
        ELSE
            INSERT INTO HISTORICOAGENTES (IDAGENTE, NOMBRE, CATEGORIA, FAMILIA, OFICINA, FECHA)
            VALUES
            (:NEW.IDAGENTE, :NEW.NOMBRE, :NEW.CATEGORIA, :NEW.FAMILIA, :NEW.OFICINA, SYSDATE);
        END IF;
    END IF;
    IF DELETING THEN
        INSERT INTO HISTORICOAGENTES (IDAGENTE, NOMBRE, CATEGORIA, FAMILIA, OFICINA, FECHA)
        VALUES
        (:OLD.IDAGENTE, :OLD.NOMBRE, :OLD.CATEGORIA, :OLD.FAMILIA, :OLD.OFICINA, SYSDATE);
    END IF;
END TR_MOD_AGENTES;
```

En este caso el trigger almacena en HISTORICOAGENTES las modificaciones de un AGENTE si se inserta uno nuevo o si se actualiza, y también alamcena los datos del antiguo AGENTE cuando se elimina, todo eso con un último campo de la fecha (sysdate) en la que se realiza la acción.

También está el extra de que el trigger exige que la CATEGORIA nueva no sea menor que -100 ni mayor que 100.
#### Procedimientos almacenados

Un procedimiento almacenado es un bloque de código que podemos invocar sólo con nombrar el procedimiento:

```sql
CREATE OR REPLACE PROCEDURE AumentarSueldo(anyo IN NUMBER, porcentaje IN NUMBER)
AS
BEGIN
	UPDATE EMPLEADOS SET SUELDO=SUELDO+(SUELDO*porcentaje/100) WHERE (EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM FECHAINGRESO))>ANYO;

END AumentarSueldo;
```

Este procedimiento aumenta el sueldo el porcentaje especificado en caso de que tenga más antigüedad el empleado que la resta de AñoActual-AñoIngreso que se define en la sentencia `(EXTRACT(YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM FECHAINGRESO))>ANYO` siendo ANYO el parámetro introducido.

Se ejecutaría así:
```sql
EXECUTE AumentarSueldo(10, 20);
```

Esto aumentaría un 20% el sueldo a los empleados con más de 10 años de antigüedad.
#### Bucles

##### LOOP

```sql
DECLARE
	V_A NUMBER:=0;
BEGIN
	LOOP
		--[CODIGO]
		V_A:=V_A+1;
		IF V_A=10 THEN
			EXIT;
		END IF;
	END LOOP;
END;
```
##### WHILE

```sql
DECLARE
	A NUMBER:=10;
BEGIN
	WHILE A<20 LOOP
		-- [CODIGO]
		A:=A+1;
	END LOOP;
END;
```

##### FOR

```SQL
DECLARE
	A NUMBER:=0;
BEGIN
	FOR A IN 5...20 LOOP
		DBMS_OUTPUT.PUT_LINE(A);
	END LOOP;
END;
```

Este código imprime el número A quince veces, desde 5 hasta 20, ambos inclusive.
# Ejercicios
## Examen año pasado
### EJ1
Sea el siguiente modelo relacional: 
oficinas (idoficina, nombre, domicilio, localidad, codigo_postal) 
familias (idfamilia, nombre, familia, oficina) 
agentes (idagente, nombre, categoria, familia, oficina) 
historicoagentes (idagente, nombre, categoria, familia, oficina, fecha) 
Donde se han marcado las claves primarias mediante subrayado de las mismas y las ajenas con negrita. 
1. (5 Puntos). Elaborar una función llamado EJ1, que pasado como argumento de entrada una familia y una oficina, recorra la tabla AGENTES mediante un cursor implícito, y para cada agente de esa familia y oficina lo vaya sumando. La función debe devolver el número total de agentes de esa familia y oficina. En caso de que no exista la familia (en la tabla familias) o la oficina (en la tabla oficinas) pasadas como argumento, deberá emitir un error indicando esta circunstancia. La función debe informar de cualquier otro error que pudiera producirse (de forma genérica). Poner ejemplos de código para las llamadas a esta función.

### Solución 1:

```SQL
CREATE OR REPLACE FUNCTION EJ1(fam AGENTES.FAMILIA%TYPE, ofi AGENTES.OFICINA%TYPE)
RETURN NUMBER
IS
    V_AGENTES NUMBER:=0;
    V_FAMILIAS NUMBER:=0;
    V_OFICINAS NUMBER:=0;
BEGIN
    SELECT COUNT(*) INTO V_FAMILIAS FROM FAMILIAS WHERE IDFAMILIA=fam;
    IF V_FAMILIAS=0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'FAMILIA NO ENCONTRADA');
    END IF;
    SELECT COUNT(*) INTO V_OFICINAS FROM OFICINAS WHERE IDOFICINA=ofi;
    IF V_OFICINAS=0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'OFICINA NO ENCONTRADA');
    END IF;
    SELECT COUNT(*) INTO V_AGENTES FROM AGENTES WHERE FAMILIA=fam AND OFICINA=ofi;
    RETURN V_AGENTES;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'ERROR AL EJECUTAR EJ1. '||SQLERRM);
END;
/
DECLARE
    V_VALOR NUMBER;
BEGIN
    V_VALOR:=EJ1(2, 2);
    DBMS_OUTPUT.PUT_LINE('SE ENCONTRARON '||V_VALOR||' AGENTES.');
END;
/
```

### EJ2

oficinas (idoficina, nombre, domicilio, localidad, codigo_postal) 
familias (idfamilia, nombre, familia, oficina) 
agentes (idaogente, nombre, categoria, familia, oficina) 
historicoagentes (idagente, nombre, categoria, familia, oficina, fecha) 

2. (5 Puntos). Implementar los triggers necesarios para que cada vez que se agregue, elimine o modifique, un registro en la tabla AGENTES, agregue un registro a la tabla HISTORICOAGENTES con los datos del nuevo agente si se trata de una inserción o una actualización, o con los datos del anterior agente si se trata de un borrado de registro. En ambos casos debe informar el campo fecha con la fecha actual (SYSDATE). Para el caso de que se esté agregando un nuevo registro o modificando uno existente, debe impedir que el valor final del campo categoría sea superior a 100 o inferior a -100, impidiendo que el registro quede insertado o actualizado, según el caso.

### Solución 2:

```sql
CREATE OR REPLACE TRIGGER EJ2
BEFORE INSERT OR UPDATE OR DELETE ON AGENTES FOR EACH ROW
DECLARE
BEGIN
    IF INSERTING OR UPDATING THEN
        IF :NEW.CATEGORIA<-100 OR :NEW.CATEGORIA>100 THEN
            RAISE_APPLICATION_ERROR('ERROR AL ASIGNAR CATEGORIA.');
        ELSE
            INSERT INTO HISTORICOAGENTES (IDAGENTE, NOMBRE, CATEGORIA, FAMILIA, OFICINA, FECHA)
            VALUES
            (:NEW.IDAGENTE, :NEW.NOMBRE, :NEW.CATEGORIA, :NEW.FAMILIA, :NEW.OFICINA, SYSDATE);
        END IF;
    END IF;
    IF DELETING THEN
        INSERT INTO HISTORICOAGENTES (IDAGENTE, NOMBRE, CATEGORIA, FAMILIA, OFICINA, FECHA)
        VALUES
        (:OLD.IDAGENTE, :OLD.NOMBRE, :OLD.CATEGORIA, :OLD.FAMILIA, :OLD.OFICINA, SYSDATE);
    END IF;
END EJ2;
/
INSERT INTO AGENTES (IDAGENTE, NOMBRE, CATEGORIA, FAMILIA, OFICINA) VALUES (12, 'JESUS', 2, 11, 1);

```

## PDF 1 
```sql
CREATE TABLE MISPERMISOS ( "USUARIO" VARCHAR2(20) NOT NULL, "PERMISO" VARCHAR2(20) NOT NULL, "TABLA" VARCHAR2(20) NOT NULL ) ;

CREATE TABLE MISUSUARIOS ( "USUARIO" VARCHAR2(20) NOT NULL, "ACCESO" VARCHAR2(20) NOT NULL, "CLAVE" VARCHAR2(20) NOT NULL ) ;
```

### Ej1
Crear un procedimiento CrearUsuarios que cree los usuarios pasados en la tabla “MisUsuarios”.
### Solucion1
```sql
CREATE OR REPLACE PROCEDURE CrearUsuario(username IN VARCHAR2, password IN VARCHAR2)
DECLARE
BEGIN
	INSERT INTO MisUsuarios (NOMBRE, CONTRASEÑA) VALUES (username, password);
END CrearUsuario;
```


### Ej2
Crear un procedimiento AsignarPermisos que asigne los permisos especificados en la tabla MisPermisos.
### Solucion2
```sql
create or replace PROCEDURE AsignarPermisos IS
CURSOR C_Permisos IS
  SELECT usuario, permiso, tabla
  FROM MisPermisos;
  VARSQL VARCHAR2(200);
BEGIN
  FOR v_fila IN C_Permisos LOOP
    VARSQL:='GRANT ' || v_fila.permiso || ' ON ' || v_fila.tabla || ' TO ' || v_fila.usuario;
    EXECUTE IMMEDIATE VARSQL;
END LOOP;
END;

```
### Ej3
Crear un procedimiento EliminarUsuario que elimine el usuario pasado como parámetro.
### Solucion3
```sql
CREATE OR REPLACE PROCEDURE EliminarUsuario (username IN VARCHAR2)
BEGIN
	DELETE FROM MisUsuarios WHERE NOMBRE=username;
END;
```
### Ej4
Crear un procedimiento EliminarPermisos que revoque todos los permisos asignados a un usuario, pasado como argumento.
### Solucion4
```SQL
CREATE OR REPLACE PROCEDURE EliminarPermisos(username IN VARCHAR2)
BEGIN
	REVOKE CREATE SESSION FROM username;
END;
```
### Ej5
Crear un procedimiento AsignarPermisosUsuario, que cree de nuevo los permisos de la tabla MisPermisos, sólo para el usuario pasado como parámetro.
### Solucion5
```SQL
CREATE OR REPLACE PROCEDURE AsignarPermisosUsuario(username IN VARCHAR2)
BEGIN
	REVOKE CREATE SESSION FROM username;
END;
```
### 
### 
### 
### 
### 
### 
### 
### 
### 
## PDF 2

TIENDAS (TID, TDIR, TLOC) 
ALMACENES (AID, ADIR, ALOC) 
PRODUCTOS (PID, DESCRIPCION, PESO, PRECIO, STOCK) 
AEXISTENCIAS (**AID, PID**, ACANT) 
TEXISTENCIAS (**TID, PID**, TCANT) 
PEDIDOS (PEDID, **AID, TID, PID**, CANT, FPED, FENT, ESTADO)

### Enunciados.
1. Elaborar una función que pasados como argumento un identificador de tienda y un identificador de producto, devuelva el importe total de los pedidos de esa tienda para ese producto. 
2. Suponiendo que el stock inicial de todos los productos es 1000 unidades, y que cada vez que se hace un pedido de un producto, se resta esa cantidad del stock. Elaborar un procedimiento en el que dados como argumento un identificador de producto, compruebe si su stock es correcto. Para ello en un argumento de tipo OUT debe retornar “OK”, si todo ha ido bien, “UF” (underflow) si se han pedido más de 1000 unidades, “NK” (no OK), si no concuerda el stock que hay en productos, con el stock que debería haber según los pedidos realizados del producto. El procedimiento debe arreglar el error, y en caso de que el stock sea negativo que lo ponga a 0. [Otra alternativa para arreglar el error es que en caso de que el stock sea negativo que elimine el mínimo número de los pedidos más recientes que hagan que el stcok quede 0 o positivo] 
3. Implementar lo triggers mínimamente necesarios para que el stock siempre esté debidamente actualizado. 
4. Usando un cursor, calcular el peso de los pedidos sobre almacenes de Barcelona, de productos de más de 50 euros.
### Solucion 1
```sql
CREATE OR REPLACE FUNCTION ObtenerPrecio(VTID PEDIDOS.TID&TYPE, VPID PEDIDOS.PID%TYPE)
RETURN NUMBER
IS
DECLARE
	TOTALPEDIDOS NUMBER:=0;
	PRECIO NUMBER:=0;
BEGIN
	SELECT SUM(CANT*PRECIO) INTO TOTALPEDIDOS FROM PEDIDOS, PRODUCTOS WHERE VTID=PEDIDOS.TID AND VPID=PEDIDOS.PID;
	RETURN TOTALPEDIDOS;
	DBMS_OUTPUT.PUT_LINE('El importe total de los pedidos para la tienda con ID '||VTID||' y pedido con ID '||VPID||' es '||TOTALPEDIDOS||'.');
END; 
```
### Solucion 2

### 
### 
### 
### 
### 