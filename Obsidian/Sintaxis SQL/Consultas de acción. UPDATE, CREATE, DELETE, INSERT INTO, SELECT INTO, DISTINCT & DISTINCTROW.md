**UPDATE:**

Si queremos actualizar, por ejemplo, los precios de una sección de nuestra base de datos, en este caso sumar 10 a los precios de los artículos de la sección de deportes, se haría así usando la cláusula SET:

```sql
UPDATE PRODUCTOS SET PRECIO+=10 WHERE SECCIÓN=’DEPORTES’;
```

Si en vez de eso quisiésemos restarles a todos los productos 10 en su precio, sencillamente sería así:

```sql
UPDATE PRODUCTOS SET PRECIO-=10;
```

Si queremos cambiar la denominación de una sección sería:

```sql
UPDATE PRODUCTOS SET SECCIÓN=’DEPORTIVOS’ WHERE SECCIÓN=’DEPORTES’;
```

**Creación de tablas (SELECT INTO, CREATE INTO):**

Si quisiésemos crear una tabla sólo con los registros de clientes donde la población sea Madrid, se haría distinto en Access y en MySQL:

ACCESS

```sql
SELECT * INTO CLIENTES_MADRID FROM CLIENTES WHERE POBLACIÓN='MADRID';
```

MySQL

```sql
CREATE TABLE CLIENTES_MADRID SELECT * FROM CLIENTES WHERE POBLACIÓN=’MADRID’;
```

**Eliminación (DELETE):**

Si queremos eliminar los registros de clientes donde la población es Madrid:

```sql
DELETE FROM CLIENTES WHERE POBLACIÓN=’MADRID’;
```

Para complicarlo un poco más podríamos hacer la siguiente consulta:

```sql
DELETE FROM PRODUCTOS WHERE SECCIÓN=’DEPORTES’ AND PRECIO BETWEEN 20 AND 100;
```

Y eliminaría los productos de la sección de deportes cuyo precio se encuentre entre 20 y 100.

**DISTINCT y DISTINCTROW:**

```sql
SELECT EMPRESA FROM CLIENTES INNER JOIN ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.CÓDIGOCLIENTE;
```

En la consulta anterior se nos mostraría los nombres de las empresas según los pedidos que han hecho, es decir si una empresa ha hecho cuatro pedidos, se mostrarían cuatro filas del mismo nombre de dicha empresa. Para evitar eso y que se nos muestre únicamente las empresas que han hecho pedidos una sola vez, se usaría la cláusula DISTINCT así:

```sql
SELECT DISTINCT EMPRESA FROM CLIENTES INNER JOIN ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.CÓDIGOCLIENTE;
```

De esta forma pedimos que no se repitan los campos, sólo aparecerá el nombre de cada empresa una sola vez.

Con DISTINCTROW impedimos que al realizar una consulta muestre las filas que son idénticas, es decir, si por lo que sea hay dos productos con el mismo código de producto, mismo nombre, mismo precio, etc, con DISTINCTROW solo se mostrará una vez.

```sql
SELECT * FROM PRODUCTOS WHERE SECCIÓN=’FERRETERÍA’;
```

Así, en el caso de haber dos productos en la sección ferretería repetidos por error, se mostrarían ambos en la consulta, lo podemos evitar así:

```sql
SELECT DISTINCTROW * FROM PRODUCTOS WHERE SECCIÓN=’FERRETERÍA’;
```

Conclusión: con DISTINCT realizamos consultas en las que se pueden repetir los nombres o los datos y hacemos que sólo se muestre una vez cada uno. Con DISTINCTROW evitamos que en las consultas se muestren filas que se repiten completamente, sólo se muestran una vez.

Ejemplo:

Si quisiésemos eliminar los clientes que no han hecho pedidos de la base de datos, tendríamos que utilizar DISTINCTROW de la siguiente manera:

```sql
DELETE DISTINCTROW CLIENTES.*, PEDIDOS.CÓDIGOCLIENTE FROM CLIENTE LEFT JOIN PEDIDOS ON CLIENTES.CÓDIGOCLIENTE=PEDIDOS.CÓDIGOCLIENTE WHERE PEDIDOS.CÓDIGOCLIENTE IS NULL
```

**INSERT INTO:**

Para este ejemplo primero eliminamos todos los clientes donde la población sea Madrid:

```sql
DELETE CLIENTES FROM CLIENTES WHERE POBLACIÓN=’MADRID’;
```

Entonces queremos meter los clientes de la tabla clientes Madrid, donde sólo están los clientes de Madrid, en la tabla clientes, es decir, revertir lo anteriormente eliminado añadiendo la tabla CLIENTES MADRID a la tabla CLIENTES:

```sql
INSERT INTO CLIENTES SELECT * FROM CLIENTES_MADRID;
```

Si no queremos anexar todos los campos la consulta sería, por ejemplo:

```sql
INSERT INTO CLIENTES (CÓDIGOCLIENTE, EMPRESA, POBLACIÓN, TELÉFONO) SELECT CÓDIGOCLIENTE, EMPRESA, POBLACIÓN, TELÉFONO FROM CLIENTES_MADRID;
```

Especificamos en ambos casos los campos elegidos.

# EJERCICIOS CONSULTAS DE ACCIÓN: UPDATE, CREATE, SELECT INTO.

1. Realizar una consulta de acción de creación de tabla a partir de la tabla CLIENTES, utilizando todos los campos de la tabla, pero únicamente los registros que sean de la población Madrid. El nuevo objeto lo nombramos con el texto “CLIENTES_DE_MADRID”. Ejecutamos la consulta.
```sql
CREATE TABLE CLIENTES_DE_MADRID SELECT * FROM CLIENTES HERE POBLACIÓN='MADRID';
```
2. Realizar una consulta de acción de creación de tabla a partir de la tabla PRODUCTOS, utilizando todos los campos de la tabla, pero sólo los registros que sean de la sección DEPORTES. El nuevo objeto – tabla lo nombramos con el texto “ARTÍCULOS_DE_DEPORTES”. Ejecutamos la consulta.
```sql
CREATE TABLE ARTÍCULOS_DE_DEPORTE SELECT * FROM PRODUCTOS WHERE SECCIÓN='DEPORTES';
```
3. Realizar una consulta de acción de creación de tabla a partir de la tabla PEDIDOS, utilizando todos los campos de la tabla, pero sólo los registros que tengan registrada la forma de pago TARJETA. El nuevo objeto – tabla lo nombramos con el texto “PEDIDOS_PAGADOS_CON_TARJETA”. Ejecutamos la consulta.
```sql
CREATE TABLE PEDIDOS_PAGADOS_CON_TARJETA SELECT * FROM PEDIDOS WHERE "FORMA DE PAGO"='TARJETA';
```
En Access los nombres con espacio se delimitan con corchetes [] en vez de comillas dobles "". En Access sería:
```sql
SELECT * INTO PEDIDOS_PAGADOS_CON_TARJETA FROM PEDIDOS WHERE [FORMA DE PAGO]='TARJETA';
```
4. Realizar una consulta que actualice los precios de la tabla ARTÍCULOS DE DEPORTE. La actualización consiste en calcular el IVA (21%) y mostrar en ese campo como resultado el precio con el IVA incluido. Ejecutar la consulta.
```sql
UPDATE PRODUCTOS SET PRECIO=PRECIO*1.21;
```
Con el código anterior actualizaríamos el precio en la propia tabla y en todas las posteriores consultas. Con el siguiente código crearíamos una consulta que nos muestra el precio con el IVA sumado, pero no lo modifica en la tabla:
```sql
SELECT PRECIO*1.21 AS PRECIO_CON_IVA FROM PRODUCTOS;
```
5. Realizar una consulta que actualice el campo DESCUENTO de la tabla PEDIDOS_PAGADOS_CON TARJETA. La actualización consiste poner a un 5% los descuentos que se muestran inferiores a esta cifra. Ejecutar la consulta.
```sql
UPDATE PEDIDOS_PAGADOS_CON_TARJETA SET DESCUENTO=0.05 WHERE DESCUENTO<0.05;
```