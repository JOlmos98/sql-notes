Existen tres tipos de subconsulta:

-      Escalonada.
-      De lista.
-      Correlacionada.

**Escalonada:


```sql
SELECT NOMBREARTÍCULO, SECCIÓN, PRECIO FROM PRODUCTOS WHERE PRECIO>(SELECT AVG(PRECIO) FROM PRODUCTOS);
```

Usamos la subconsulta hija como criterio, que es la que halla la media de los productos, y la ponemos entre paréntesis, y antes de ella hacemos la consulta padre que es para comparar el precio de los productos con la media.

**De lista:

**(ALL, ANY)**

```sql
SELECT * FROM PRODUCTOS WHERE PRECIO> ALL (SELECT PRECIO FROM PRODUCTOS WHERE SECCIÓN='CERÁMICA');
```

En este caso en la consulta hija filtramos el precio de los productos de la sección CERÁMICA y en la consulta padre pedimos que seleccione todos los productos cuyo precio sea mayor que todos(ALL) los de la consulta hija. Es decir, los productos que tengan un precio mayor que el más caro de CERÁMICA.

Si usásemos ANY en vez de ALL, estaríamos pidiendo que nos mostrase todos los productos más caros que el más barato de CERÁMICA.

**(IN, NOT IN)**

En este ejemplo queremos mostrar los productos cuyas unidades superen las 20 vendidas en la tabla PRODUCTOSPEDIDOS, usamos IN.

```sql
SELECT NOMBREARTÍCULO, PRECIO FROM PRODUCTOS WHERE CÓDIGOARTÍCULO IN (SELECT CÓDIGOARTÍCULO FROM PRODUCTOSPEDIDOS WHERE UNIDADES>20);
```

Podríamos hacer la misma consulta usando INNER JOIN de esta manera:

```sql
SELECT NOMBREARTÍCULO, PRECIO FROM PRODUCTOS INNER JOIN PRODUCTOSPEDIDOS ON PRODUCTOS.CÓDIGOARTÍCULO=PRODUCTOSPEDIDOS.CÓDIGOARTÍCULO WHERE UNIDADES>20;
```

En este caso con INNER JOIN no haría falta que las tablas estuviesen relacionadas, con la subconsulta, sí. Aunque resulta más sencillo el código de la subconsulta.

En este ejemplo usamos el NOT IN para mostrar los clientes que han pagado con tarjeta o no han realizado pedidos, excluyendo los que han pagado al contado o aplazado.

```sql
SELECT EMPRESA, POBLACIÓN FROM CLIENTES WHERE CÓDIGOCLIENTE NOT IN (SELECT CÓDIGOCLIENTE FROM PEDIDOS WHERE FORMADEPAGO="CONTADO" OR FORMADEPAGO="APLAZADO");
```

**Correlacionada:

Son subconsultas que hacen referencia a una columna de la consulta principal. Se pueden utilizar para realizar operaciones complejas que no se pueden realizar con una sola subconsulta.