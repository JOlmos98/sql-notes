Creamos la tabla del ejemplo (SQLPlus o SQLDeveloper):

``` sql
CREATE TABLE TABLA1 (

       DNI VARCHAR2(9) PRIMARY KEY,

       NOMBRE VARCHAR2(20),

       DIRECCION VARCHAR2(20),

TELEFONO NUMBER(9)

       )
```

Para insertar datos en una tabla se usa la frase:

``` sql
INSERT INTO NOMBRE_TABLA (NOMBRE_ATRIBUTO/CAMPO) VALUES (VALOR_A_INTRODUCIR);
```

Por ejemplo, si tenemos una TABLA1 con los campos DNI, NOMBRE, DIRECCION y TELEFONO sería:

```sql
INSERT INTO TABLA1 (DNI, NOMBRE, DIRECCION, TELEFONO) VALUES ('49338447B', 'RAUL', 'CALLE SALAMANCA', '676555384');
```

Si queremos meter varias filas en una sola sentencia sería:

``` sql
INSERT INTO TABLA1 (DNI, NOMBRE, DIRECCION, TELEFONO) VALUES

('49338447B', 'RAUL', 'CALLE SALAMANCA', '676555384'),

('37449114M', 'JUAN', 'CALLE MANUEL', '633555283'),

('39114223B', 'ALBERTO', 'CALLE SALAMANCA', '633555053');
```

El tema de la creación de tablas continua en el punto “10. CREACIÓN DE TABLAS”.

Para insertar una fecha usamos una sentencia como esta:

```sql
INSERT INTO TABLA1 (FECHA_NAC) VALUES ('18-09-1998');
```